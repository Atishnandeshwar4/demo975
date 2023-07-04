IF EXISTS(SELECT 1 FROM sys.columns WHERE [name] = N'BehaviourType'
AND [object_id] = OBJECT_ID(N'ZNodePaymentType'))
BEGIN
EXEC sp_RENAME 'ZNodePaymentType.BehaviourType', 'BehaviorType' , 'COLUMN'
END;
IF EXISTS(SELECT 1 FROM sys.columns WHERE [name] = N'FisrtName'
AND [object_id] = OBJECT_ID(N'ZnodePaymentCustomers'))
BEGIN
EXEC sp_RENAME 'ZnodePaymentCustomers.FisrtName', 'FirstName' , 'COLUMN'
END;
go
Update ZNodePaymentType set BehaviorType = Name where BehaviorType is null
go
update ZNodePaymentType set BehaviorType = 'COD' where Name = 'COD' OR CODE = 'CHARGEONDELIVERY'
go
Update ZnodePaymentType Set BehaviorType = 'PAYPAL_EXPRESS' where Name = 'PaypalExpress' and BehaviorType = 'PaypalExpress'
GO
INSERT INTO ZnodePaymentGateway (GatewayName,	WebsiteURL	,ClassName,CreatedDate,ModifiedDate, GatewayCode )
SELECT 'Card Connect','https://cardpointe.com/','CardConnectProvider',GETDATE(),GETDATE(), 'cardconnect'
WHERE NOT EXISTS(SELECT * FROM ZnodePaymentGateway WHERE GatewayCode = 'cardconnect')

GO
Update ZnodeTransactions SET PaymentSettingId = NULL
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
		WHERE PaymentGatewayId IN (SELECT PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayName = 'Paypal'))

GO
DELETE FROM ZnodePaymentMethods
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
		WHERE PaymentGatewayId IN (SELECT PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayName = 'Paypal'))
DELETE FROM ZNodePaymentSettingCredential
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
		WHERE PaymentGatewayId IN (SELECT PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayName = 'Paypal'))
DELETE FROM ZNodePaymentSetting
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
		WHERE PaymentGatewayId IN (SELECT PaymentGatewayId FROM ZnodePaymentGateway WHERE GatewayName = 'Paypal'))

DELETE FROM ZnodePaymentGateway WHERE GatewayName = 'Paypal'
GO



