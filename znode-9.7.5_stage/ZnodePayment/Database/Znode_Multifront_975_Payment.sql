IF EXISTS (SELECT TOP 1 1 FROM SYSDATABASES WHERE Name = 'Znode_Multifront_975_Payment')
BEGIN 
	DECLARE @EEEE NVARCHAR(max)= 'USE [Znode_Multifront_975_Payment]'
	EXEC (@EEEE)
 PRINT '"Znode_Multifront_975_Payment" is already exists. ';
 SET NOEXEC ON;
END 
GO

USE [master]
GO
/****** Object:  Database [Znode_Multifront_975_Payment]    Script Date: 10/25/2018 6:46:01 PM ******/
CREATE DATABASE [Znode_Multifront_975_Payment]
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Znode_Multifront_975_Payment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET ANSI_NULLS ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET ANSI_PADDING ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET ARITHABORT ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET RECOVERY FULL 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET  MULTI_USER 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Znode_Multifront_975_Payment]
GO
/****** Object:  Table [dbo].[ZNodeActivityLog]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNodeActivityLog](
	[ActivityLogId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentSettingId] [int] NULL,
	[PortalID] [int] NULL,
	[URL] [nvarchar](max) NULL,
	[Data1] [nvarchar](255) NULL,
	[Data2] [nvarchar](255) NULL,
	[Data3] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[LongData] [nvarchar](max) NULL,
	[Source] [nvarchar](255) NULL,
	[Target] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZNodeActivityLog] PRIMARY KEY CLUSTERED 
(
	[ActivityLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZNodeDomain]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNodeDomain](
	[DomainId] [int] IDENTITY(1,1) NOT NULL,
	[PortalId] [int] NOT NULL,
	[DomainName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ApiKey] [nvarchar](200) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZNodeDomain] PRIMARY KEY CLUSTERED 
(
	[DomainId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZnodePaymentAddress]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZnodePaymentAddress](
	[CreditCardAddressId] [uniqueidentifier] NOT NULL,
	[CardHolderFirstName] [varchar](60) NULL,
	[CardHolderLastName] [varchar](60) NULL,
	[AddressLine1] [varchar](200) NULL,
	[AddressLine2] [varchar](200) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
	[ZipCode] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZnodePaymentAddress] PRIMARY KEY CLUSTERED 
(
	[CreditCardAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZnodePaymentCustomers]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZnodePaymentCustomers](
	[CustomersGUID] [uniqueidentifier] NOT NULL,
	[FisrtName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZnodePaymentCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomersGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZNodePaymentGateway]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNodePaymentGateway](
	[PaymentGatewayId] [int] IDENTITY(1,1) NOT NULL,
	[GatewayName] [varchar](max) NOT NULL,
	[WebsiteURL] [varchar](max) NULL,
	[ClassName] [varchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[GatewayCode] [varchar](100) NULL,
 CONSTRAINT [PK_SC_Gateway] PRIMARY KEY CLUSTERED 
(
	[PaymentGatewayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZnodePaymentMethods]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZnodePaymentMethods](
	[PaymentGUID] [uniqueidentifier] NOT NULL,
	[Token] [varchar](max) NULL,
	[CreditCardLastFourDigit] [varchar](4) NULL,
	[CreditCardExpMonth] [int] NULL,
	[CreditCardExpYear] [int] NULL,
	[CreditCardAddressId] [uniqueidentifier] NULL,
	[PaymentSettingID] [int] NULL,
	[CustomersGUID] [uniqueidentifier] NULL,
	[CustomerProfileId] [nvarchar](64) NULL,
	[CreditCardImageUrl] [nvarchar](200) NULL,
	[IsSaveCreditCard] [bit] NOT NULL,
	[CardType] [varchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZnodePaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZNodePaymentSetting]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNodePaymentSetting](
	[PaymentSettingId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[PaymentGatewayId] [int] NULL,
	[EnableVisa] [bit] NULL,
	[EnableMasterCard] [bit] NULL,
	[EnableAmex] [bit] NULL,
	[EnableDiscover] [bit] NULL,
	[EnableRecurringPayments] [bit] NULL,
	[EnableVault] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[PreAuthorize] [bit] NOT NULL,
	[IsRMACompatible] [bit] NULL,
	[TestMode] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[EnablePODocUpload] [bit] NOT NULL,
	[IsPODocRequired] [bit] NOT NULL,
	[PaymentCode] [varchar](200) NULL,
 CONSTRAINT [PK_SC_PaymentSetting] PRIMARY KEY CLUSTERED 
(
	[PaymentSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZNodePaymentSettingCredential]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNodePaymentSettingCredential](
	[PaymentSettingCredentialId] [int] IDENTITY(1,1) NOT NULL,
	[Partner] [nvarchar](max) NULL,
	[Vendor] [nvarchar](max) NULL,
	[TestMode] [bit] NOT NULL,
	[PaymentSettingId] [int] NULL,
	[GatewayUsername] [nvarchar](max) NULL,
	[GatewayPassword] [nvarchar](max) NULL,
	[TransactionKey] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ZNodePaymentSettingCredential] PRIMARY KEY CLUSTERED 
(
	[PaymentSettingCredentialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZNodePaymentType]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZNodePaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[BehaviourType] [varchar](100) NULL,
	[Code] [varchar](100) NULL,
 CONSTRAINT [PK_SC_PaymentType] PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZnodeTransactions]    Script Date: 10/25/2018 6:46:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZnodeTransactions](
	[GUID] [uniqueidentifier] NOT NULL,
	[CustomerProfileId] [nvarchar](max) NULL,
	[CustomerPaymentId] [nvarchar](max) NULL,
	[TransactionId] [nvarchar](max) NULL,
	[TransactionDate] [datetime] NULL,
	[CaptureTransactionDate] [datetime] NULL,
	[RefundTransactionDate] [datetime] NULL,
	[ResponseText] [nvarchar](max) NULL,
	[ResponseCode] [nvarchar](50) NULL,
	[Custom1] [nvarchar](max) NULL,
	[RefundTransactionId] [nvarchar](max) NULL,
	[CaptureTransactionId] [nvarchar](max) NULL,
	[Amount] [money] NULL,
	[PaymentSettingId] [int] NULL,
	[CurrencyCode] [nvarchar](50) NULL,
	[SubscriptionId] [nvarchar](max) NULL,
	[PaymentStatusId] [int] NULL,
	[RefundAmount] [numeric](12, 6) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Znode_Transactions] PRIMARY KEY CLUSTERED 
(
	[GUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ZNodePaymentGateway] ON 

GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (1, N'Authorize.Net', N'http://www.authorize.net', N'AuthorizeNetCustomerProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'authorizenet')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (3, N'CyberSource', N'http://www.cybersource.com', N'CyberSourceCustomerProvider', CAST(N'2018-03-28T11:58:47.773' AS DateTime), CAST(N'2018-03-28T11:58:47.773' AS DateTime), N'cybersource')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (4, N'Stripe', N'', N'StripeCustomerProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'stripe')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (5, N'Paypal', N'http://www.paypal.com', N'PaypalCustomerProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'paypal')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (6, N'Chase Paymentech', N'https://securevar.paymentech.com/manager', N'PaymentTechProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'paymentech')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (7, N'WorldPay', N'http://www.wordlpay.com', N'SecureNetCustomerProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'worldpay')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (8, N'Braintree', N'https://www.braintreepayments.com/', N'BraintreeProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'braintree')
GO
INSERT [dbo].[ZNodePaymentGateway] ([PaymentGatewayId], [GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate], [GatewayCode]) VALUES (9, N'PayFlow', N'http://www.manager.paypal.com', N'PayFlowCustomerProvider', CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'payflow')
GO
SET IDENTITY_INSERT [dbo].[ZNodePaymentGateway] OFF
GO
SET IDENTITY_INSERT [dbo].[ZNodePaymentSetting] ON 

GO
INSERT [dbo].[ZNodePaymentSetting] ([PaymentSettingId], [PaymentTypeId], [PaymentGatewayId], [EnableVisa], [EnableMasterCard], [EnableAmex], [EnableDiscover], [EnableRecurringPayments], [EnableVault], [IsActive], [DisplayOrder], [PreAuthorize], [IsRMACompatible], [TestMode], [CreatedDate], [ModifiedDate], [EnablePODocUpload], [IsPODocRequired], [PaymentCode]) VALUES (1, 4, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 1, 0, NULL, 0, CAST(N'2017-03-31T00:00:00.000' AS DateTime), CAST(N'2017-03-31T00:00:00.000' AS DateTime), 0, 0, N'1')
GO
SET IDENTITY_INSERT [dbo].[ZNodePaymentSetting] OFF
GO
SET IDENTITY_INSERT [dbo].[ZNodePaymentType] ON 

GO
INSERT [dbo].[ZNodePaymentType] ([PaymentTypeId], [Name], [Description], [IsActive], [CreatedDate], [ModifiedDate], [BehaviourType], [Code]) VALUES (1, N'CREDIT_CARD', N'Credit Card', 1, CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'CREDIT_CARD', N'CREDITCARD')
GO
INSERT [dbo].[ZNodePaymentType] ([PaymentTypeId], [Name], [Description], [IsActive], [CreatedDate], [ModifiedDate], [BehaviourType], [Code]) VALUES (2, N'PURCHASE_ORDER', N'Purchase Order', 1, CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'PURCHASE_ORDER', N'PURCHASEORDER')
GO
INSERT [dbo].[ZNodePaymentType] ([PaymentTypeId], [Name], [Description], [IsActive], [CreatedDate], [ModifiedDate], [BehaviourType], [Code]) VALUES (3, N'PaypalExpress', N'Paypal Express', 1, CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'PAYPAL_EXPRESS', N'PAYPALEXPRESS')
GO
INSERT [dbo].[ZNodePaymentType] ([PaymentTypeId], [Name], [Description], [IsActive], [CreatedDate], [ModifiedDate], [BehaviourType], [Code]) VALUES (4, N'COD', N'Charge On Delivery', 1, CAST(N'2016-07-29T13:46:19.620' AS DateTime), CAST(N'2016-07-29T13:46:19.620' AS DateTime), N'COD', N'CHARGEONDELIVERY')
GO
INSERT [dbo].[ZNodePaymentType] ([PaymentTypeId], [Name], [Description], [IsActive], [CreatedDate], [ModifiedDate], [BehaviourType], [Code]) VALUES (5, N'AmazonPay', N'Amazon Pay', 1, CAST(N'2018-10-25T18:45:31.253' AS DateTime), CAST(N'2018-10-25T18:45:31.253' AS DateTime), N'AMAZON_PAY', N'AMAZONPAY')
GO
INSERT [dbo].[ZNodePaymentType] ([PaymentTypeId], [Name], [Description], [IsActive], [CreatedDate], [ModifiedDate], [BehaviourType], [Code]) VALUES (6, N'Invoice Me', N'Invoice Me', 1, CAST(N'2018-10-25T18:45:31.253' AS DateTime), CAST(N'2018-10-25T18:45:31.253' AS DateTime), N'COD', N'INVOICEME')
GO
SET IDENTITY_INSERT [dbo].[ZNodePaymentType] OFF
GO
ALTER TABLE [dbo].[ZNodeDomain] ADD  CONSTRAINT [DF_ZNodeDomain_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ZNodeDomain] ADD  CONSTRAINT [DF_ZNodeDomain_ApiKey]  DEFAULT (CONVERT([nvarchar](200),newid(),(0))) FOR [ApiKey]
GO
ALTER TABLE [dbo].[ZnodePaymentCustomers] ADD  CONSTRAINT [DF_ZnodePaymentCustomers_CustomersGUID]  DEFAULT (newid()) FOR [CustomersGUID]
GO
ALTER TABLE [dbo].[ZnodePaymentMethods] ADD  CONSTRAINT [DF_ZnodePaymentMethods]  DEFAULT ((0)) FOR [IsSaveCreditCard]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] ADD  CONSTRAINT [DF_ZNodePaymentSetting_EnableRecurringPayments]  DEFAULT ((0)) FOR [EnableRecurringPayments]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] ADD  CONSTRAINT [DF_ZNodePaymentSetting_EnableVault]  DEFAULT ((0)) FOR [EnableVault]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] ADD  CONSTRAINT [DF_ZNodePaymentSetting_PreAuthorize]  DEFAULT ((0)) FOR [PreAuthorize]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] ADD  CONSTRAINT [DF_ZNodePaymentSetting_TestMode]  DEFAULT ((0)) FOR [TestMode]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] ADD  CONSTRAINT [DF_ZNodePaymentSetting_EnablePODocUpload]  DEFAULT ((0)) FOR [EnablePODocUpload]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] ADD  CONSTRAINT [DF_ZNodePaymentSetting_IsPODocRequired]  DEFAULT ((0)) FOR [IsPODocRequired]
GO
ALTER TABLE [dbo].[ZNodePaymentSettingCredential] ADD  CONSTRAINT [DF_ZNodePaymentSettingCredential_TestMode]  DEFAULT ((0)) FOR [TestMode]
GO
ALTER TABLE [dbo].[ZNodePaymentType] ADD  CONSTRAINT [DF_SC_PaymentType_ActiveInd]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ZnodePaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_ZnodePaymentMethods_CreditCardAddressId] FOREIGN KEY([CreditCardAddressId])
REFERENCES [dbo].[ZnodePaymentAddress] ([CreditCardAddressId])
GO
ALTER TABLE [dbo].[ZnodePaymentMethods] CHECK CONSTRAINT [FK_ZnodePaymentMethods_CreditCardAddressId]
GO
ALTER TABLE [dbo].[ZnodePaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_ZnodePaymentMethods_CustomersGUID] FOREIGN KEY([CustomersGUID])
REFERENCES [dbo].[ZnodePaymentCustomers] ([CustomersGUID])
GO
ALTER TABLE [dbo].[ZnodePaymentMethods] CHECK CONSTRAINT [FK_ZnodePaymentMethods_CustomersGUID]
GO
ALTER TABLE [dbo].[ZnodePaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_ZnodePaymentMethods_PaymentSettingID] FOREIGN KEY([PaymentSettingID])
REFERENCES [dbo].[ZNodePaymentSetting] ([PaymentSettingId])
GO
ALTER TABLE [dbo].[ZnodePaymentMethods] CHECK CONSTRAINT [FK_ZnodePaymentMethods_PaymentSettingID]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting]  WITH CHECK ADD  CONSTRAINT [FK_SC_PaymentSetting_SC_Gateway] FOREIGN KEY([PaymentGatewayId])
REFERENCES [dbo].[ZNodePaymentGateway] ([PaymentGatewayId])
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] CHECK CONSTRAINT [FK_SC_PaymentSetting_SC_Gateway]
GO
ALTER TABLE [dbo].[ZNodePaymentSetting]  WITH CHECK ADD  CONSTRAINT [FK_ZNodePaymentSetting_ZNodePaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[ZNodePaymentType] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[ZNodePaymentSetting] CHECK CONSTRAINT [FK_ZNodePaymentSetting_ZNodePaymentType]
GO
ALTER TABLE [dbo].[ZNodePaymentSettingCredential]  WITH CHECK ADD  CONSTRAINT [FK_ZNodePaymentSettingCredential_ZNodePaymentSetting] FOREIGN KEY([PaymentSettingId])
REFERENCES [dbo].[ZNodePaymentSetting] ([PaymentSettingId])
GO
ALTER TABLE [dbo].[ZNodePaymentSettingCredential] CHECK CONSTRAINT [FK_ZNodePaymentSettingCredential_ZNodePaymentSetting]
GO
ALTER TABLE [dbo].[ZnodeTransactions]  WITH CHECK ADD  CONSTRAINT [FK_Znode_Transactions_ZNodePaymentSetting] FOREIGN KEY([PaymentSettingId])
REFERENCES [dbo].[ZNodePaymentSetting] ([PaymentSettingId])
GO
ALTER TABLE [dbo].[ZnodeTransactions] CHECK CONSTRAINT [FK_Znode_Transactions_ZNodePaymentSetting]
GO
UPDATE A
SET A.Vendor = A.GatewayUsername
FROM ZNodePaymentSettingCredential A
WHERE PaymentSettingId = (SELECT TOP 1 PaymentSettingId FROM ZnodePaymentSetting B
WHERE PaymentGatewayId = (SELECT TOP 1 PaymentGatewayId FROM ZnodePaymentGateway C
WHERE C.GatewayCode = 'payflow' AND C.PaymentGatewayId = B.PaymentGatewayId)
AND A.PaymentSettingId = B.PaymentSettingId)
go

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
go
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
insert into ZNodeDomain(PortalId,DomainName,IsActive,ApiKey,CreatedDate,ModifiedDate)
select 7, 'localhost:44322',1,'55D5235C-F562-4743-B6F1-8D460A0413C2',getdate(),getdate()
where not exists(select * from ZNodeDomain where DomainName = 'localhost:44322' and PortalId = 7)
go

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
GO


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

GO

DELETE FROM ZnodePaymentMethods
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
                         WHERE PaymentTypeId NOT IN (select PaymentTypeId from ZnodePaymentType where code='CHARGEONDELIVERY' or Name='COD'))
						 
DELETE FROM ZNodePaymentSettingCredential
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
                WHERE  PaymentTypeId NOT IN (select PaymentTypeId from ZnodePaymentType where code='CHARGEONDELIVERY' or Name='COD'))
				
DELETE FROM ZnodeTransactions
WHERE PaymentSettingId IN (SELECT PaymentSettingId FROM ZnodePaymentSetting
                WHERE PaymentTypeId NOT IN (select PaymentTypeId from ZnodePaymentType where code='CHARGEONDELIVERY' or Name='COD'))
				
DELETE FROM ZnodePaymentSetting
WHERE PaymentTypeId NOT IN (select PaymentTypeId from ZnodePaymentType where code='CHARGEONDELIVERY' or Name='COD')

GO
IF NOT EXISTS(SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'UserId' AND TABLE_NAME = 'ZnodePaymentMethods')
BEGIN
	ALTER TABLE ZnodePaymentMethods ADD UserId INT NULL
END

GO

Update ZnodePaymentSetting set IsActive = 0
where isnull(PaymentGatewayId,0) in (select PaymentGatewayId from ZnodePaymentGateway WHERE GatewayCode = 'cybersource')

GO

INSERT INTO ZNodePaymentGateway
   ([GatewayName], [WebsiteURL], [ClassName], [CreatedDate], [ModifiedDate],[GatewayCode])
SELECT
    N'PaypalExpress', N'http://www.paypal.com', N'PaypalExpressRestProvider', GETDATE(), GETDATE(), N'paypalexpress'
WHERE NOT EXISTS (SELECT TOP 1 1 FROM ZNodePaymentGateway 
                WHERE [GatewayCode] = 'paypalexpress')

GO
USE [master]
GO
ALTER DATABASE [Znode_Multifront_975_Payment] SET  READ_WRITE 
GO
