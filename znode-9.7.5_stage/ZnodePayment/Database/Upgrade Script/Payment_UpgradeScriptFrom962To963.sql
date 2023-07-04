INSERT INTO ZnodePaymentGateway (GatewayName,	WebsiteURL	,ClassName,CreatedDate,ModifiedDate, GatewayCode )
SELECT 'Card Connect','https://cardpointe.com/','CardConnectProvider',GETDATE(),GETDATE(), 'cardconnect'
WHERE NOT EXISTS(SELECT * FROM ZnodePaymentGateway WHERE GatewayCode = 'cardconnect')