IF EXISTS(SELECT 1 FROM sys.columns WHERE [name] = N'FisrtName'
AND [object_id] = OBJECT_ID(N'ZnodePaymentCustomers'))
BEGIN
EXEC sp_RENAME 'ZnodePaymentCustomers.FisrtName', 'FirstName' , 'COLUMN'
END;

GO

insert into ZNodePaymentType(Name,Description,IsActive,CreatedDate,ModifiedDate,BehaviorType,Code)
select 'ACH','Automated Clearing House',1,getdate(),getdate(),'ACH','AUTOMATEDCLEARINGHOUSE'
where not exists(select * from ZNodePaymentType where Code = 'AUTOMATEDCLEARINGHOUSE')

GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsACHEnabled' AND Object_ID = Object_ID(N'dbo.ZNodePaymentGateway'))
BEGIN
	ALTER TABLE ZNodePaymentGateway ADD IsACHEnabled BIT NULL;
END

GO

UPDATE ZnodePaymentGateway SET IsACHEnabled = 0 WHERE IsACHEnabled IS NULL

GO

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'IsACHEnabled' AND TABLE_NAME = 'ZnodePaymentGateway')
BEGIN
	IF NOT EXISTS(SELECT * FROM SYS.default_constraints WHERE NAME = 'DF_ZnodePaymentGateway_IsACHEnabled')
	BEGIN
		ALTER TABLE ZnodePaymentGateway ADD CONSTRAINT DF_ZnodePaymentGateway_IsACHEnabled DEFAULT 0 FOR IsACHEnabled
	END
END
GO
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'IsACHEnabled' AND TABLE_NAME = 'ZnodePaymentGateway')
BEGIN
	ALTER TABLE ZnodePaymentGateway ALTER COLUMN IsACHEnabled BIT NOT NULL
END

GO

update ZnodePaymentGateway set IsACHEnabled=1 where GatewayName='Card Connect'

GO

IF NOT EXISTS (	SELECT TOP 1 1 FROM ZnodePaymentSetting PS
			INNER JOIN ZnodePaymentGateway PG ON PS.PaymentGatewayId=PG.PaymentGatewayId
			WHERE PG.GatewayCode = 'paymentech')
BEGIN
	DELETE PS
	FROM ZnodePaymentSetting PS
	INNER JOIN ZnodePaymentGateway PG ON PS.PaymentGatewayId=PG.PaymentGatewayId
	WHERE PG.GatewayCode = 'paymentech'

	DELETE FROM ZnodePaymentGateway WHERE GatewayCode = 'paymentech'
END

GO

IF NOT EXISTS (	SELECT TOP 1 1 FROM ZnodePaymentSetting PS
			INNER JOIN ZnodePaymentGateway PG ON PS.PaymentGatewayId=PG.PaymentGatewayId
			WHERE PG.GatewayCode = 'stripe')
BEGIN
	DELETE PS
	FROM ZnodePaymentSetting PS
	INNER JOIN ZnodePaymentGateway PG ON PS.PaymentGatewayId=PG.PaymentGatewayId
	WHERE PG.GatewayCode = 'stripe'

	DELETE FROM ZnodePaymentGateway WHERE GatewayCode = 'stripe'
END

GO

IF NOT EXISTS (	SELECT TOP 1 1 FROM ZnodePaymentSetting PS
			INNER JOIN ZnodePaymentGateway PG ON PS.PaymentGatewayId=PG.PaymentGatewayId
			WHERE PG.GatewayCode = 'worldpay')
BEGIN
	DELETE PS
	FROM ZnodePaymentSetting PS
	INNER JOIN ZnodePaymentGateway PG ON PS.PaymentGatewayId=PG.PaymentGatewayId
	WHERE PG.GatewayCode = 'worldpay'

	DELETE FROM ZnodePaymentGateway WHERE GatewayCode = 'worldpay'
END

GO

INSERT INTO ZNodePaymentSetting(PaymentTypeId, PaymentGatewayId, EnableVisa, EnableMasterCard, EnableAmex, EnableDiscover, EnableRecurringPayments,
	EnableVault, IsActive, DisplayOrder, PreAuthorize, IsRMACompatible, TestMode, CreatedDate, ModifiedDate, EnablePODocUpload, IsPODocRequired, PaymentCode)
SELECT 
(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD'),
(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet'),
NULL,NULL,NULL,NULL,0,0,1,1,0,NULL,1,GETDATE(),GETDATE(),0,0,'Authorize'
WHERE NOT EXISTS(SELECT * FROM ZNodePaymentSetting WHERE PaymentTypeId = (SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD') 
        AND PaymentGatewayId = (SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet') AND PaymentCode = 'Authorize')

INSERT INTO ZNodePaymentSetting(PaymentTypeId, PaymentGatewayId, EnableVisa, EnableMasterCard, EnableAmex, EnableDiscover, EnableRecurringPayments,
	EnableVault, IsActive, DisplayOrder, PreAuthorize, IsRMACompatible, TestMode, CreatedDate, ModifiedDate, EnablePODocUpload, IsPODocRequired, PaymentCode)
SELECT 
(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='PURCHASEORDER'),
NULL,
NULL,NULL,NULL,NULL,0,0,1,1,0,NULL,1,GETDATE(),GETDATE(),1,0,'PO'
WHERE NOT EXISTS(SELECT * FROM ZNodePaymentSetting WHERE PaymentTypeId = (SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='PURCHASEORDER') 
        AND PaymentGatewayId IS NULL AND PaymentCode = 'PO')

INSERT INTO ZNodePaymentSetting(PaymentTypeId, PaymentGatewayId, EnableVisa, EnableMasterCard, EnableAmex, EnableDiscover, EnableRecurringPayments,
	EnableVault, IsActive, DisplayOrder, PreAuthorize, IsRMACompatible, TestMode, CreatedDate, ModifiedDate, EnablePODocUpload, IsPODocRequired, PaymentCode)
SELECT 
(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD'),
(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet'),
NULL,NULL,NULL,NULL,0,0,1,1,0,NULL,1,GETDATE(),GETDATE(),0,0,'Credit'
WHERE NOT EXISTS(SELECT * FROM ZNodePaymentSetting WHERE PaymentTypeId = (SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD') 
        AND PaymentGatewayId = (SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet') AND PaymentCode = 'Credit')

INSERT INTO ZNodePaymentSetting(PaymentTypeId, PaymentGatewayId, EnableVisa, EnableMasterCard, EnableAmex, EnableDiscover, EnableRecurringPayments,
	EnableVault, IsActive, DisplayOrder, PreAuthorize, IsRMACompatible, TestMode, CreatedDate, ModifiedDate, EnablePODocUpload, IsPODocRequired, PaymentCode)
SELECT 
(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD'),
(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='cybersource'),
NULL,NULL,NULL,NULL,0,0,1,1,0,NULL,1,GETDATE(),GETDATE(),0,0,'card1234'
WHERE NOT EXISTS(SELECT * FROM ZNodePaymentSetting WHERE PaymentTypeId = (SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD') 
        AND PaymentGatewayId = (SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='cybersource') AND PaymentCode = 'card1234')

INSERT INTO ZNodePaymentSetting(PaymentTypeId, PaymentGatewayId, EnableVisa, EnableMasterCard, EnableAmex, EnableDiscover, EnableRecurringPayments,
	EnableVault, IsActive, DisplayOrder, PreAuthorize, IsRMACompatible, TestMode, CreatedDate, ModifiedDate, EnablePODocUpload, IsPODocRequired, PaymentCode)
SELECT 
(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD'),
(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='stripe'),
NULL,NULL,NULL,NULL,0,0,1,1,0,NULL,1,GETDATE(),GETDATE(),0,0,'Stripe'
WHERE NOT EXISTS(SELECT * FROM ZNodePaymentSetting WHERE PaymentTypeId = (SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD') 
        AND PaymentGatewayId = (SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='stripe') AND PaymentCode = 'Stripe')

INSERT INTO ZNodePaymentSettingCredential (Partner,Vendor,TestMode,PaymentSettingId,GatewayUsername,GatewayPassword,TransactionKey,
	CreatedDate,ModifiedDate,Custom1,Custom2,Custom3,Custom4,Custom5)
SELECT '','',1,
(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
	AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet')
	AND PaymentCode='Authorize'),
'','','',GETDATE(),GETDATE(),NULL,NULL,NULL,NULL,NULL
WHERE NOT EXISTS (SELECT * FROM ZNodePaymentSettingCredential WHERE PaymentSettingId=(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting 
											WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
										AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet')
	AND PaymentCode='Authorize'))

INSERT INTO ZNodePaymentSettingCredential (Partner,Vendor,TestMode,PaymentSettingId,GatewayUsername,GatewayPassword,TransactionKey,
	CreatedDate,ModifiedDate,Custom1,Custom2,Custom3,Custom4,Custom5)
SELECT '','',1,
(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='PURCHASEORDER')
	AND PaymentGatewayId IS NULL AND PaymentCode='PO'),
'','','',GETDATE(),GETDATE(),NULL,NULL,NULL,NULL,NULL
WHERE NOT EXISTS (SELECT * FROM ZNodePaymentSettingCredential WHERE PaymentSettingId=(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting 
											WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='PURCHASEORDER')
										AND PaymentGatewayId IS NULL AND PaymentCode='PO'))

INSERT INTO ZNodePaymentSettingCredential (Partner,Vendor,TestMode,PaymentSettingId,GatewayUsername,GatewayPassword,TransactionKey,
	CreatedDate,ModifiedDate,Custom1,Custom2,Custom3,Custom4,Custom5)
SELECT '','',1,
(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
	AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet')
	AND PaymentCode='Credit'),
'','','',GETDATE(),GETDATE(),NULL,NULL,NULL,NULL,NULL
WHERE NOT EXISTS (SELECT * FROM ZNodePaymentSettingCredential WHERE PaymentSettingId=(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting 
											WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
										AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='authorizenet')
	AND PaymentCode='Credit'))

INSERT INTO ZNodePaymentSettingCredential (Partner,Vendor,TestMode,PaymentSettingId,GatewayUsername,GatewayPassword,TransactionKey,
	CreatedDate,ModifiedDate,Custom1,Custom2,Custom3,Custom4,Custom5)
SELECT '','',1,
(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
	AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='cybersource')
	AND PaymentCode='card1234'),
'','','',GETDATE(),GETDATE(),NULL,NULL,NULL,NULL,NULL
WHERE NOT EXISTS (SELECT * FROM ZNodePaymentSettingCredential WHERE PaymentSettingId=(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting 
											WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
										AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='cybersource')
	AND PaymentCode='card1234'))

INSERT INTO ZNodePaymentSettingCredential (Partner,Vendor,TestMode,PaymentSettingId,GatewayUsername,GatewayPassword,TransactionKey,
	CreatedDate,ModifiedDate,Custom1,Custom2,Custom3,Custom4,Custom5)
SELECT '','',1,
(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
	AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='stripe')
	AND PaymentCode='Stripe'),
'','','',GETDATE(),GETDATE(),NULL,NULL,NULL,NULL,NULL
WHERE NOT EXISTS (SELECT * FROM ZNodePaymentSettingCredential WHERE PaymentSettingId=(SELECT TOP 1 PaymentSettingId FROM ZNodePaymentSetting 
											WHERE PaymentTypeId=(SELECT TOP 1 PaymentTypeId FROM ZnodePaymentType WHERE Code ='CREDITCARD')
										AND PaymentGatewayId=(SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayCode='stripe')
	AND PaymentCode='Stripe'))
