IF NOT EXISTS (SELECT TOP 1 1 FROM sys.tables WHERE Name = 'ZnodeAuthToken')
BEGIN
	CREATE TABLE [dbo].[ZnodeAuthToken]
	(
		[AuthTokenId] [int] IDENTITY(1,1) NOT NULL,
		[AuthToken] [nvarchar](200) CONSTRAINT [DF_ZnodeAuthToken_AuthToken] DEFAULT (newid()) NOT NULL,
		[CreatedDate] [datetime] NOT NULL,
		[TotalAttempt] [int] NULL,
		[UserOrSessionId] varchar(300), 
		[IsFromAdminApp] bit
		CONSTRAINT [PK_ZnodeAuthToken] PRIMARY KEY CLUSTERED (	[AuthTokenId] ASC ),
	) 
	CREATE INDEX Idx_ZnodeAuthToken_AuthTokenId ON [ZnodeAuthToken] ([AuthToken])
	CREATE INDEX Idx_ZnodeAuthToken_UserOrSessionIdIsFromAdminApp ON [ZnodeAuthToken] ([UserOrSessionId] ,[IsFromAdminApp])
END

GO

IF EXISTS(SELECT * FROM SYS.PROCEDURES WHERE NAME = 'Znode_DeleteAuthToken')
	DROP PROC Znode_DeleteAuthToken

GO

CREATE PROCEDURE [dbo].[Znode_DeleteAuthToken]
(
	@AuthToken NVARCHAR(200),
	@Status BIT = 0 OUT 
)
/* SP used to delete auth token*/
AS
BEGIN
BEGIN TRY
	SET NOCOUNT ON;
	DELETE FROM ZnodeAuthToken
	WHERE AuthToken = @AuthToken

	SET @Status = 1
END TRY
BEGIN CATCH
	SET @Status = 0
	SELECT ERROR_MESSAGE()
END CATCH
END

GO

IF EXISTS(SELECT * FROM SYS.PROCEDURES WHERE NAME = 'Znode_DeleteOldAuthTokens')
	DROP PROC Znode_DeleteOldAuthTokens

GO

CREATE PROCEDURE [dbo].[Znode_DeleteOldAuthTokens]
/*To delete older(since 1hr old) using scheduler(sql job)*/
AS
BEGIN
BEGIN TRY
	SET NOCOUNT ON;
	DELETE
	FROM ZnodeAuthToken
	WHERE CreatedDate < DATEADD(HOUR, -1, GETDATE())

END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
END CATCH
END

GO

IF EXISTS(SELECT * FROM SYS.PROCEDURES WHERE NAME = 'Znode_InsertAuthToken')
	DROP PROC Znode_InsertAuthToken

GO

CREATE PROCEDURE [dbo].[Znode_InsertAuthToken]
@UserOrSessionId varchar(300), 
@IsFromAdminApp bit
AS
/* SP used to generate auth token*/
BEGIN
BEGIN TRY
	SET NOCOUNT ON;
	DECLARE @AuthTokenId INT
	IF (@IsFromAdminApp =0 )
	BEGIN
	--Max time is in seconds and minus it goes back to the date i.e -300 sec and check the count after that. Note: It should be less than the delete job which runs every hour
		 Declare @MaxTime int=-300, @TokenLimit int=10
		 IF (select count(*) from ZnodeAuthToken WITH (NOLOCK)  where CreatedDate >= DATEADD(SECOND, @MaxTime, GETDATE()) and UserOrSessionId =@UserOrSessionId) >= @TokenLimit
		 BEGIN
			Select 'Token Limit Exceeded.';
			Return ; 		 
		END
	END

	INSERT INTO ZnodeAuthToken(CreatedDate,UserOrSessionId,IsFromAdminApp)
	SELECT GETDATE(),@UserOrSessionId,@IsFromAdminApp

	SET @AuthTokenId = @@IDENTITY

	SELECT * FROM ZnodeAuthToken WITH (NOLOCK) WHERE AuthTokenId = @AuthTokenId
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
END CATCH
END

GO

IF EXISTS(SELECT * FROM SYS.PROCEDURES WHERE NAME = 'Znode_ValidateAuthToken')
	DROP PROC Znode_ValidateAuthToken

GO

CREATE PROCEDURE [dbo].[Znode_ValidateAuthToken]
(
	@AuthToken NVARCHAR(200),
    @DoNotCount BIT=0,
	@Status BIT = 0 OUT,
	@MaxAllowedAttempt INT = 3
)
/*SP used to validate auth token and expire token after 3 fail attempt*/
AS
BEGIN
BEGIN TRY
	SET NOCOUNT ON;
	IF EXISTS(SELECT * FROM ZnodeAuthToken WITH (NOLOCK) WHERE AuthToken = @AuthToken AND ISNULL(TotalAttempt,0) <= @MaxAllowedAttempt)
	BEGIN
		SET @Status = 1
        IF @DoNotCount = 0
		begin
		UPDATE ZnodeAuthToken SET TotalAttempt = ISNULL(TotalAttempt,0) + 1 WHERE AuthToken = @AuthToken
                END
	END
	----If anyone wants to use time based token expiration then uncomment below code. Code will expire the token in 20 min
	--DECLARE @CreatedDate DATETIME = (SELECT TOP 1 CreatedDate FROM ZnodeAuthToken WITH (NOLOCK) WHERE AuthToken = @AuthToken)
	--ELSE IF DATEADD(minute,20,@CreatedDate) > @CreatedDate
	--BEGIN
	--	SET @Status = 0
	--END
	ELSE
	BEGIN
		SET @Status = 0
	END
END TRY
BEGIN CATCH
	SET @Status = 0
	SELECT ERROR_MESSAGE()
END CATCH

END

GO

IF EXISTS(SELECT * FROM SYS.PROCEDURES WHERE NAME = 'Znode_DeleteOldAuthTokens')
	DROP PROC Znode_DeleteOldAuthTokens

GO

CREATE PROCEDURE [dbo].[Znode_DeleteOldAuthTokens]
/*To delete older(since 1hr old) using scheduler(sql job)*/
(
	@Status int OUT
)
AS
BEGIN
BEGIN TRY
SET NOCOUNT ON
	DELETE
	FROM ZnodeAuthToken
	WHERE CreatedDate < DATEADD(HOUR, -1, GETDATE())
	SET @Status = 1
END TRY
BEGIN CATCH
	SET @Status = 0
	SELECT ERROR_MESSAGE()
END CATCH
END

GO

UPDATE ZnodePaymentType SET BehaviorType='COD' WHERE Code = 'INVOICEME' AND BehaviorType <> 'COD'
