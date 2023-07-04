

IF NOT EXISTS (SELECT TOP 1  1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ZNodePaymentType' AND COLUMN_NAME = 'BehaviourType')
BEGIN 
	ALTER TABLE [dbo].[ZNodePaymentType] ADD [BehaviourType]  VARCHAR (100)  NULL
END 

GO
IF NOT EXISTS (SELECT TOP 1  1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ZNodePaymentType' AND COLUMN_NAME = 'Code')
BEGIN 
	ALTER TABLE [dbo].[ZNodePaymentType] ADD [Code] Varchar(100)  NULL
END 

GO

IF NOT EXISTS (SELECT TOP 1  1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ZnodePaymentSetting' AND COLUMN_NAME = 'PaymentCode')
BEGIN 
	ALTER TABLE [dbo].[ZnodePaymentSetting] ADD [PaymentCode] Varchar(200)  NULL
END 
GO


IF NOT EXISTS (SELECT TOP 1  1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ZNodePaymentGateway' AND COLUMN_NAME = 'GatewayCode')
BEGIN 
	ALTER TABLE [dbo].[ZNodePaymentGateway] ADD [GatewayCode] Varchar(100)  NULL
END 
GO


SET IDENTITY_INSERT ZnodePaymentType ON 

INSERT INTO ZnodePaymentType (PaymentTypeId,Name,Description,IsActive,CreatedDate,ModifiedDate)
SELECT 6,'Invoice Me','Invoice Me',1,GETDATE(),GETDATE()
WHERE NOT EXISTS (SELECT TOP 1 1 FROM ZnodePaymentType WHERE  name = 'Invoice Me')

SET IDENTITY_INSERT ZnodePaymentType OFF 

GO

update ZNodePaymentType set Name='CREDIT_CARD' where Name = 'Credit Card'
update ZNodePaymentType set Name='PURCHASE_ORDER' where Name = 'Purchase Order'
update ZNodePaymentType set Name='PaypalExpress' where Name = 'Paypal Express'
update ZNodePaymentType set Name='COD' where Name = 'COD'
update ZNodePaymentType set Name='AmazonPay' where Name = 'AmazonPay'

GO


update ZnodepaymentType
set Code = Name  

GO
update ZNodePaymentGateway
set GatewayCode = LOWER(REPLACE(REPLACE(REPLACE(GatewayName, ' ', ''), '.', ''),'Chase',''))

GO

update ZnodePaymentSetting 
set PaymentCode = PaymentSettingId

GO

update ZNodePaymentType set Code ='CREDITCARD' where Name = 'CREDIT_CARD'
update ZNodePaymentType set Code ='PURCHASEORDER' where Name = 'PURCHASE_ORDER'
update ZNodePaymentType set Code ='PAYPALEXPRESS' where Name = 'PaypalExpress'
update ZNodePaymentType set Code ='CHARGEONDELIVERY' where Name = 'COD'
update ZNodePaymentType set Code ='AMAZONPAY' where Name = 'AmazonPay'
update ZNodePaymentType set Code ='INVOICEME' where Name = 'Invoice Me'

GO
update ZnodepaymentType
set Behaviourtype = Name  

GO

update ZnodepaymentType
set Behaviourtype = 'PAYPAL_EXPRESS'
WHERE CODE = 'PAYPALEXPRESS'

GO
update ZnodepaymentType
set Behaviourtype = 'AMAZON_PAY'
WHERE CODE = 'AMAZONPAY'

GO
update ZNodePaymentType set BehaviourType = 'COD' where Code = 'INVOICEME'