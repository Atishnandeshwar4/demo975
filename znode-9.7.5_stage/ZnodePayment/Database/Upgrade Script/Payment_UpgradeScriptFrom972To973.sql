GO
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'UserId' AND TABLE_NAME = 'ZnodePaymentGateway')
BEGIN
	ALTER TABLE ZnodePaymentGateway DROP COLUMN UserId
END

GO

IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'UserId' AND TABLE_NAME = 'ZnodePaymentMethods')
BEGIN
	ALTER TABLE ZnodePaymentMethods ADD UserId INT NULL
END

GO

Update ZnodePaymentSetting set IsActive = 0
where isnull(PaymentGatewayId,0) in (select PaymentGatewayId from ZnodePaymentGateway WHERE GatewayCode = 'cybersource')
