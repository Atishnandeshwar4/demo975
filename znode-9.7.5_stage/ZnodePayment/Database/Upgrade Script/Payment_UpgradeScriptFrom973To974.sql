INSERT INTO ZNodePaymentGateway
   ([GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate],[GatewayCode])
SELECT
    N'PaypalExpress', N'http://www.paypal.com', N'PaypalExpressRestProvider', GETDATE(), GETDATE(), N'paypalexpress'
WHERE NOT EXISTS (SELECT TOP 1 1 FROM ZNodePaymentGateway 
                WHERE [GatewayCode] = 'paypalexpress')
