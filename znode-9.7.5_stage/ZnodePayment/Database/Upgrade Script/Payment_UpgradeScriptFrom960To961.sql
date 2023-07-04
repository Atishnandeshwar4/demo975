
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'ZNodePaymentSettingCredential' and COLUMN_NAME = 'Custom1')
begin
alter table ZNodePaymentSettingCredential add [Custom1] NVARCHAR(MAX) NULL
end
go
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'ZNodePaymentSettingCredential' and COLUMN_NAME = 'Custom2')
begin	
alter table ZNodePaymentSettingCredential add [Custom2] NVARCHAR(MAX) NULL
end
go
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'ZNodePaymentSettingCredential' and COLUMN_NAME = 'Custom3')
begin
alter table ZNodePaymentSettingCredential add [Custom3] NVARCHAR(MAX) NULL
end
go
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'ZNodePaymentSettingCredential' and COLUMN_NAME = 'Custom4')
begin
alter table ZNodePaymentSettingCredential add [Custom4] NVARCHAR(MAX) NULL
end
go
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'ZNodePaymentSettingCredential' and COLUMN_NAME = 'Custom5')
begin
alter table ZNodePaymentSettingCredential add [Custom5] NVARCHAR(MAX) NULL
end