
UPDATE A
SET A.Vendor = A.GatewayUsername
FROM ZNodePaymentSettingCredential A
WHERE PaymentSettingId = (SELECT TOP 1 PaymentSettingId FROM ZnodePaymentSetting B
WHERE PaymentGatewayId = (SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway C
WHERE C.GatewayCode = 'payflow' AND C.PaymentGatewayId = B.PaymentGatewayId)
AND A.PaymentSettingId = B.PaymentSettingId)