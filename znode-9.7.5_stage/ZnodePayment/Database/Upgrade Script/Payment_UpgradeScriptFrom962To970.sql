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