/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2019 (15.0.2000)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2019
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'CMj4phh7nV1npWQFFHXNzATxCwFDR+ioB3huxoAsRqg=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'j5VeIT4kSNca12vVUMwbwlo2rMr2oXlpEJRQobfu4U8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [DESKTOP-0NMKRNH\uswa nasir]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'DESKTOP-0NMKRNH\uswa nasir')
CREATE LOGIN [DESKTOP-0NMKRNH\uswa nasir] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQLSERVER')
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLSERVERAGENT')
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 4/30/2022 12:27:50 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DESKTOP-0NMKRNH\uswa nasir]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
USE [DuraGroup]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attendance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Attendance](
	[EmployeeID] [int] NOT NULL,
	[EntryTime] [datetime] NULL,
	[ExitTime] [datetime] NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Attendance] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[bill]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bill]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[qty] [int] NULL,
	[total] [decimal](18, 2) NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[bill] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[BranchToBranch]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BranchToBranch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BranchToBranch](
	[ProductID] [int] NOT NULL,
	[Date] [date] NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
 CONSTRAINT [PK_BranchToBranch] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[BranchToBranch] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CompanyGoods]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyGoods]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CompanyGoods](
	[ID] [int] NOT NULL,
	[RequestNo] [int] NOT NULL,
	[VendorID] [int] NOT NULL,
	[Date] [date] NULL,
	[ProductName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[TotalProducts] [int] NOT NULL,
 CONSTRAINT [PK_CompanyGoods_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[CompanyGoods] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employee](
	[ID] [int] NOT NULL,
	[FirstName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CNIC] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Gender] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DateOfBirth] [datetime] NULL,
	[Age] [int] NULL,
	[Type] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Salary] [decimal](18, 0) NULL,
	[AccountNo] [varchar](16) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Employee] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[GatePass]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GatePass]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GatePass](
	[VendorID] [int] NOT NULL,
	[Date] [date] NULL,
	[ProductDescription] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProductName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_GatePass] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[GatePass] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[GoodReturnNote]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GoodReturnNote]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GoodReturnNote](
	[GRN_No] [int] NOT NULL,
	[Innvoice_No] [varchar](6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PurcahseOrderNo] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[ItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_GoodReturnNote] PRIMARY KEY CLUSTERED 
(
	[GRN_No] ASC,
	[Innvoice_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[GoodReturnNote] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Leaves]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Leaves]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Leaves](
	[LeaveID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[Type] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Leaves] PRIMARY KEY CLUSTERED 
(
	[LeaveID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Leaves] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[MaterialRequisition]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MaterialRequisition]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MaterialRequisition](
	[RequestNo] [int] NOT NULL,
	[ItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PurchaseOrderNo] [int] NULL,
	[Date] [date] NOT NULL,
	[RequestBy] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Quantity] [int] NULL,
	[Description] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NeededDate] [date] NULL,
 CONSTRAINT [PK_MaterialRequisition] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[MaterialRequisition] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseOrder](
	[OrderNo] [int] NOT NULL,
	[ItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemCode] [int] NOT NULL,
	[Date] [date] NULL,
	[Quantity] [int] NULL,
	[SupplierID] [int] NULL,
	[PaymentMethod] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Unit] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PurchaseOrder_1] PRIMARY KEY CLUSTERED 
(
	[OrderNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[PurchaseOrder] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[RequiredItems]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RequiredItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RequiredItems](
	[Code] [int] NOT NULL,
	[ItemDescription] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_RequiredItems] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[RequiredItems] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sales](
	[VenderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UnitPrice] [decimal](18, 0) NULL,
	[NoOfProducts] [int] NOT NULL,
	[TotalPrice] [decimal](18, 0) NOT NULL,
	[Profit] [decimal](18, 0) NULL,
	[Discount] [real] NULL,
	[BuyerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BuyerCNIC] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ShopName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Contact] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Sales] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesReturn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SalesReturn](
	[ReturnID] [int] NOT NULL,
	[Date] [date] NULL,
	[Reason] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BuyerCompanyName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BuyerName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VenderID] [int] NOT NULL,
	[DriverName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VehicleNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProductID] [int] NOT NULL,
	[ReturnAmount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_SalesReturn_1] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC,
	[VehicleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[SalesReturn] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Suppliers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CNIC] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Contact] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Suppliers] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Transport]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Transport]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Transport](
	[VehicleNo] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DriverCNIC] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VehicleType] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DriverName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReturnID] [int] NULL,
 CONSTRAINT [PK_Transport_1] PRIMARY KEY CLUSTERED 
(
	[VehicleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Transport] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 4/30/2022 12:27:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vendor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vendor](
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Vendor] TO  SCHEMA OWNER 
GO
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (5, CAST(N'2022-04-06T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (2, CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2022-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (4, CAST(N'2022-04-01T00:00:00.000' AS DateTime), CAST(N'2022-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (6, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (7, CAST(N'2022-04-13T00:00:00.000' AS DateTime), CAST(N'2022-04-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (8, CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (9, CAST(N'2022-03-02T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (10, CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (11, CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (12, CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (13, CAST(N'2022-03-05T00:00:00.000' AS DateTime), CAST(N'2022-03-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (14, CAST(N'2022-03-25T00:00:00.000' AS DateTime), CAST(N'2022-03-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (15, CAST(N'2022-03-12T00:00:00.000' AS DateTime), CAST(N'2022-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (2, CAST(N'2022-04-08T00:00:00.000' AS DateTime), CAST(N'2022-04-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (7, CAST(N'2022-04-06T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (15, CAST(N'2022-04-06T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (13, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (10, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (14, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (7, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (12, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (2, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (5, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (8, CAST(N'2022-02-06T00:00:00.000' AS DateTime), CAST(N'2022-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (13, CAST(N'2022-04-29T00:00:00.000' AS DateTime), CAST(N'2022-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (2, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (4, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (8, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (14, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (15, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Attendance] ([EmployeeID], [EntryTime], [ExitTime]) VALUES (10, CAST(N'2022-04-06T00:00:00.000' AS DateTime), CAST(N'2022-04-07T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (3, CAST(15.00 AS Decimal(18, 2)), 9, CAST(135.00 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (4, CAST(20.00 AS Decimal(18, 2)), 8, CAST(160.00 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (5, CAST(21.00 AS Decimal(18, 2)), 4, CAST(84.00 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (6, CAST(9.00 AS Decimal(18, 2)), 6, CAST(54.00 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (7, CAST(18.00 AS Decimal(18, 2)), 10, CAST(180.00 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (8, CAST(7.00 AS Decimal(18, 2)), 8, CAST(56.00 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (9, CAST(12.99 AS Decimal(18, 2)), 6, CAST(77.94 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (10, CAST(16.89 AS Decimal(18, 2)), 15, CAST(253.35 AS Decimal(18, 2)))
INSERT [dbo].[bill] ([id], [Price], [qty], [total]) VALUES (11, CAST(77.70 AS Decimal(18, 2)), 5, CAST(388.50 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
INSERT [dbo].[BranchToBranch] ([ProductID], [Date], [Description], [FromDate], [ToDate]) VALUES (3, CAST(N'2022-04-30' AS Date), N'', CAST(N'2022-04-30' AS Date), CAST(N'2022-04-30' AS Date))
GO
INSERT [dbo].[CompanyGoods] ([ID], [RequestNo], [VendorID], [Date], [ProductName], [Description], [UnitPrice], [TotalProducts]) VALUES (3, 2, 3, CAST(N'2022-04-30' AS Date), N'pipes', N'', CAST(2 AS Decimal(18, 0)), 6)
GO
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (2, N'Ali', N'Mubeen', N'212123', N'Male', N'Lahore', N'0317286278', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 19, N'Vendor', CAST(23000 AS Decimal(18, 0)), N'2223672982`')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (3, N'Abbas', N'Asif', N'3782016729872', N'Male', N'Gujranwala sector 22', N'03338729017', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 29, N'Vendor', CAST(30000 AS Decimal(18, 0)), N'2345678209')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (4, N'Hafeez', N'Hafiz', N'3672910927836', N'Male', N'Lahore Pakistan', N'03837839278', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 25, N'Vendor', CAST(25000 AS Decimal(18, 0)), N'2893678097')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (5, N'Ali', N'Mubeen', N'212123', N'Male', N'Lahore', N'0317286278', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 30, N'Vendor', CAST(23000 AS Decimal(18, 0)), N'2223518729`')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (6, N'Babar', N'Azam', N'3838927820987', N'Male', N'Lahore Pakistan', N'03327085228', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 28, N'Vendor', CAST(45000 AS Decimal(18, 0)), N'2222783671')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (7, N'Waris', N'Waqar', N'3502082671987', N'Male', N'Lahore Pakistan', N'03897367289', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 26, N'Vendor', CAST(30000 AS Decimal(18, 0)), N'3678298267')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (8, N'Ali', N'Qasim', N'3567289278267', N'Male', N'Lahore Pakistan', N'03228397652', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 29, N'Vendor', CAST(25000 AS Decimal(18, 0)), N'5637829816')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (9, N'Asim', N'Azhar', N'3520296728917', N'Male', N'Karachi Pakistan', N'0321561890', CAST(N'2022-04-09T00:00:00.000' AS DateTime), 24, N'Vendor', CAST(40000 AS Decimal(18, 0)), N'6729178367')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (10, N'Farhan', N'Saeed', N'3562789278691', N'Male', N'Karachi Pakistan', N'03378926728', CAST(N'2022-04-02T00:00:00.000' AS DateTime), 31, N'Vendor', CAST(40000 AS Decimal(18, 0)), N'5672982678')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (11, N'Ali', N'Qasim', N'3567289278267', N'Male', N'Lahore Pakistan', N'03228397652', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 29, N'Driver', CAST(2500 AS Decimal(18, 0)), N'5637829816')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (12, N'Hashimi', N'Qasim', N'3566289278267', N'Male', N'Lahore Pakistan', N'03339826782', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 29, N'SecurityGuard', CAST(2000 AS Decimal(18, 0)), N'5637829816')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (13, N'Aqsa', N'Qasim', N'3568889278267', N'Female', N'Lahore Pakistan', N'03329826782', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 20, N'Worker', CAST(20000 AS Decimal(18, 0)), N'5639829816')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (14, N'Aiemen', N'AB', N'3568089278267', N'Female', N'Lahore Pakistan', N'03399826782', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 20, N'Worker', CAST(20000 AS Decimal(18, 0)), N'5630829816')
INSERT [dbo].[Employee] ([ID], [FirstName], [LastName], [CNIC], [Gender], [Address], [Contact], [DateOfBirth], [Age], [Type], [Salary], [AccountNo]) VALUES (15, N'Ali', N'Qasim', N'3567289278267', N'Male', N'Lahore Pakistan', N'03228997652', CAST(N'2022-04-01T00:00:00.000' AS DateTime), 29, N'Driver', CAST(2500 AS Decimal(18, 0)), N'5637829816')
GO
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (2, CAST(N'2022-04-01' AS Date), N'-', N'Inactive', N'Pipes')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (3, CAST(N'2022-04-01' AS Date), N'-', N'Active ', N'PVC Pipes')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (4, CAST(N'2022-04-01' AS Date), N'Manage Sales', N'Active ', N'PVC Pipes')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (5, CAST(N'2022-04-02' AS Date), N'-', N'Active ', N'PVC Pipes')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (6, CAST(N'2022-04-09' AS Date), N'To manage Sales', N'Active ', N'PVC Pipes')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (7, CAST(N'2022-04-16' AS Date), N'To manage Sales', N'Inactive', N'Water Tanks')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (8, CAST(N'2022-04-15' AS Date), N'To manage Sales', N'Active ', N'Water Tanks')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (9, CAST(N'2022-04-19' AS Date), N'To manage Sales', N'Active ', N'Water Tanks')
INSERT [dbo].[GatePass] ([VendorID], [Date], [ProductDescription], [Status], [ProductName]) VALUES (10, CAST(N'2022-04-17' AS Date), N'To manage Sales', N'Active ', N'Water Tanks')
GO
INSERT [dbo].[GoodReturnNote] ([GRN_No], [Innvoice_No], [PurcahseOrderNo], [SupplierID], [ItemName]) VALUES (2, N'5', 27, 5, N'plastic pipes')
INSERT [dbo].[GoodReturnNote] ([GRN_No], [Innvoice_No], [PurcahseOrderNo], [SupplierID], [ItemName]) VALUES (2, N'7', 22, 4, N'PVC Pipes')
INSERT [dbo].[GoodReturnNote] ([GRN_No], [Innvoice_No], [PurcahseOrderNo], [SupplierID], [ItemName]) VALUES (5, N'9', 26, 4, N'PVC Pipes')
GO
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (4, 2, CAST(N'2022-04-07' AS Date), CAST(N'2022-04-29' AS Date), N'emergency')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (5, 5, CAST(N'2022-04-29' AS Date), CAST(N'2022-04-29' AS Date), N'ill')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (7, 2, CAST(N'2022-04-29' AS Date), CAST(N'2022-04-29' AS Date), N'emergency')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (8, 3, CAST(N'2022-04-05' AS Date), CAST(N'2022-04-08' AS Date), N'emergency')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (9, 2, CAST(N'2022-04-29' AS Date), CAST(N'2022-04-29' AS Date), N'emergency')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (10, 2, CAST(N'2022-04-27' AS Date), CAST(N'2022-04-29' AS Date), N'ill')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (12, 7, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-05' AS Date), N'ill')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (13, 7, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (14, 7, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (15, 9, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (16, 13, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (17, 11, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (18, 12, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (19, 13, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (20, 15, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (21, 14, CAST(N'2022-04-02' AS Date), CAST(N'2022-04-02' AS Date), N'holiday')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (22, 14, CAST(N'2022-04-15' AS Date), CAST(N'2022-04-16' AS Date), N'emergency')
INSERT [dbo].[Leaves] ([LeaveID], [EmployeeID], [FromDate], [ToDate], [Type]) VALUES (23, 14, CAST(N'2022-03-14' AS Date), CAST(N'2022-03-17' AS Date), N'ill')
GO
INSERT [dbo].[MaterialRequisition] ([RequestNo], [ItemName], [PurchaseOrderNo], [Date], [RequestBy], [Quantity], [Description], [NeededDate]) VALUES (2, N'plastic pipes', 22, CAST(N'2022-04-30' AS Date), N'owner', 5, N'', CAST(N'2022-04-30' AS Date))
GO
INSERT [dbo].[PurchaseOrder] ([OrderNo], [ItemName], [ItemCode], [Date], [Quantity], [SupplierID], [PaymentMethod], [Unit]) VALUES (22, N'pipes', 5, CAST(N'2022-04-30' AS Date), 5, 3, N'Credit Card', CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[PurchaseOrder] ([OrderNo], [ItemName], [ItemCode], [Date], [Quantity], [SupplierID], [PaymentMethod], [Unit]) VALUES (26, N'pipes', 7, CAST(N'2022-04-30' AS Date), 5, 3, N'Cash', CAST(6 AS Decimal(18, 0)))
INSERT [dbo].[PurchaseOrder] ([OrderNo], [ItemName], [ItemCode], [Date], [Quantity], [SupplierID], [PaymentMethod], [Unit]) VALUES (27, N'PVC Pipes', 4, CAST(N'2022-04-30' AS Date), 5, 4, N'Cash', CAST(6 AS Decimal(18, 0)))
GO
INSERT [dbo].[RequiredItems] ([Code], [ItemDescription], [ItemName]) VALUES (2, N'tanks', N'required')
INSERT [dbo].[RequiredItems] ([Code], [ItemDescription], [ItemName]) VALUES (4, N'PVC plastic', N'required')
INSERT [dbo].[RequiredItems] ([Code], [ItemDescription], [ItemName]) VALUES (5, N'required', N'pipes')
INSERT [dbo].[RequiredItems] ([Code], [ItemDescription], [ItemName]) VALUES (6, N'required', N'pipes')
INSERT [dbo].[RequiredItems] ([Code], [ItemDescription], [ItemName]) VALUES (7, N'PVC Pipes', N'plastic pipes')
INSERT [dbo].[RequiredItems] ([Code], [ItemDescription], [ItemName]) VALUES (8, N'HDPE pipes', N'PVC Pipes')
GO
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (2, 2, N'Pipes', CAST(22 AS Decimal(18, 0)), 20, CAST(440 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), 5, N'Muhammad Ali', N'35202966678625', N'Dura Group', N'Township Lahore', N'03219367280')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 3, N'tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'03892786910 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (6, 10, N'PVC pipes ', CAST(90 AS Decimal(18, 0)), 10, CAST(900 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'Ameer Ali ', N'3520927836782 ', N'Ameer and Sons ', N'Lahore Pakistan ', N'03672891678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (4, 11, N'water tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'03892786910 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (8, 12, N'PVC pipes ', CAST(90 AS Decimal(18, 0)), 10, CAST(900 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'Ameer Ali ', N'3520927836782 ', N'Ameer and Sons ', N'Lahore Pakistan ', N'03672891678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (4, 15, N'Plastic pipes ', CAST(22 AS Decimal(18, 0)), 10, CAST(220 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), 5, N'Noor and Sons ', N'3902678296729 ', N'Noor Traders ', N'Lahore Pakistan ', N'03782902768 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (7, 16, N'PVC pipes ', CAST(90 AS Decimal(18, 0)), 100, CAST(9000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'Ameer Ali ', N'3520927836782 ', N'Ameer and Sons ', N'Lahore Pakistan ', N'03672891678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (4, 18, N'water tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'03892786910 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (9, 19, N'HDPE pipes ', CAST(90 AS Decimal(18, 0)), 10, CAST(900 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'Zameer Ali ', N'3530927836782 ', N'Zameer and Sons ', N'Lahore Pakistan ', N'03678891678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (4, 20, N'Plastic pipes ', CAST(22 AS Decimal(18, 0)), 10, CAST(220 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), 5, N' ', N'3902678296729 ', N' ', N'Lahore Pakistan ', N'03782902768 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (5, 21, N'water tanks ', CAST(500 AS Decimal(18, 0)), 20, CAST(10000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 5, N'Agha Noor ', N'3672891827908 ', N'Agha Noor factory ', N'Lahore Pakistan ', N'03178298267 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (7, 23, N'PVC Fittings ', CAST(100 AS Decimal(18, 0)), 20, CAST(2000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), 5, N'Amreeli ', N'3567289209872 ', N'Amreeli Plasters ', N'Lahore ', N'03217825678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (8, 25, N'PVC Pipes ', CAST(200 AS Decimal(18, 0)), 50, CAST(10000 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 5, N'Chauhdry Ahsan ', N'3520982676278 ', N'Chauhdry and sons ', N' ', N'03256278999 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 26, N'tanks ', CAST(90 AS Decimal(18, 0)), 10, CAST(900 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Sameer', N'5628978978927 ', N'Sameer tanks ', N'Lahore Pakistan ', N'03892786889 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (9, 27, N'tanks ', CAST(100 AS Decimal(18, 0)), 10, CAST(1000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Sameer', N'5628978978927 ', N'Sameer tanks ', N'Lahore Pakistan ', N'03892786889 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (7, 30, N'PVC Pipes ', CAST(100 AS Decimal(18, 0)), 20, CAST(2000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), 5, N'Amreeli ', N'3567289209872 ', N'Amreeli Plasters ', N'Lahore ', N'03217825678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (10, 32, N'PVC fittings', CAST(90 AS Decimal(18, 0)), 10, CAST(900 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'Sameer', N'5628978978927 ', N'Sameer pipes and Co ', N'Lahore Pakistan ', N'03892786889 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (7, 35, N'HDPE pipes ', CAST(80 AS Decimal(18, 0)), 10, CAST(800 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 0, N'Zameer Ali ', N'3530927836782 ', N'Zameer and Sons ', N'Lahore Pakistan ', N'03678891678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (4, 36, N'water tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'03892786910 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 38, N'tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'03892786910 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (7, 41, N'PVC pipes ', CAST(90 AS Decimal(18, 0)), 100, CAST(9000 AS Decimal(18, 0)), CAST(9 AS Decimal(18, 0)), 0, N'Ali Shah ', N'3520997836782 ', N'Ali Shah Pipes', N'Lahore Pakistan ', N'03372891678 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 77, N'tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'ABC')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 80, N'tanks ', CAST(40 AS Decimal(18, 0)), 20, CAST(800 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'03892786 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 88, N'tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'000')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 90, N'tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'5628925678927 ', N'Agha tanks ', N'Lahore Pakistan ', N'038927 ')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (3, 99, N'tanks ', CAST(80 AS Decimal(18, 0)), 20, CAST(1600 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 9, N'Ali Agha ', N'3672890156246', N'Agha tanks ', N'Lahore Pakistan ', N'03627819715')
INSERT [dbo].[Sales] ([VenderID], [ProductID], [ProductName], [UnitPrice], [NoOfProducts], [TotalPrice], [Profit], [Discount], [BuyerName], [BuyerCNIC], [ShopName], [Address], [Contact]) VALUES (4, 1234, N'tanks', CAST(12 AS Decimal(18, 0)), 5, CAST(60 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), 6, N'Ali', N'3567836906532', N'Ali and Co', N'Lahore', N'03457893245')
GO
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (2, CAST(N'2022-04-01' AS Date), N'', N'Agha Ali Factory', N'Agha Ali', 2, N'Ali Shah', N'234', 10, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (3, CAST(N'2022-04-01' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 6, N'Zameer Ali', N'230', 3, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (3, CAST(N'2022-04-01' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 5, N'Ali Shah', N'234', 11, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (4, CAST(N'2022-04-01' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 6, N'Zameer Ali', N'230', 3, CAST(300 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (5, CAST(N'2022-04-01' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 6, N'Zameer Ali', N'230', 21, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (6, CAST(N'2022-04-13' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 9, N'Zameer Ali', N'230', 32, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (9, CAST(N'2022-04-09' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 5, N'Ali Shah', N'234', 11, CAST(200 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (10, CAST(N'2022-04-01' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 7, N'Ali Shah', N'234', 19, CAST(900 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (11, CAST(N'2022-04-09' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 2, N'Ghulam Ali', N'2232', 26, CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (12, CAST(N'2022-04-09' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 8, N'Ghulam Ali', N'2232', 20, CAST(3000 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (13, CAST(N'2022-04-09' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 2, N'Ghulam Ali', N'2232', 26, CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (14, CAST(N'2022-04-09' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 8, N'Ghulam Ali', N'2232', 20, CAST(6000 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (15, CAST(N'2022-04-09' AS Date), N'not required', N'Amreeli Plasters', N'Ali hassan', 8, N'Ghulam Ali', N'2232', 20, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (16, CAST(N'2022-04-09' AS Date), N'not required', N'Amreeli Plasters', N'Ali hassan', 10, N'Ghulam Ali', N'2232', 36, CAST(5000 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (16, CAST(N'2022-04-01' AS Date), N'not required', N'Agha Ali Factory', N'Agha Ali', 6, N'Zameer Ali', N'230', 21, CAST(400 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (19, CAST(N'2022-04-01' AS Date), N'', N'Farhan and Co', N'Farhan', 2, N'Sahir Saad', N'2348', 30, CAST(789 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (20, CAST(N'2022-04-02' AS Date), N'', N'Farhan and Co', N'Farhan', 2, N'Sahir Saad', N'2348', 30, CAST(789 AS Decimal(18, 0)))
INSERT [dbo].[SalesReturn] ([ReturnID], [Date], [Reason], [BuyerCompanyName], [BuyerName], [VenderID], [DriverName], [VehicleNo], [ProductID], [ReturnAmount]) VALUES (21, CAST(N'2022-04-02' AS Date), N'', N'Farhan and Co', N'Farhan', 2, N'Sahir Saad', N'2248', 27, CAST(7890 AS Decimal(18, 0)))
GO
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [CNIC], [Contact], [Address]) VALUES (3, N'Asif Ali', N'3527289108367', N'03327829134', N'Lahore')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [CNIC], [Contact], [Address]) VALUES (4, N'Shahid Afridi', N'3527289108390', N'03327829121', N'Peshawar')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [CNIC], [Contact], [Address]) VALUES (5, N'Shahid Khan', N'3597289108390', N'03027829121', N'Peshawar')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [CNIC], [Contact], [Address]) VALUES (6, N'Shahid Khan', N'3467218267198', N'03278167398', N'Peshawar')
INSERT [dbo].[Suppliers] ([SupplierID], [Name], [CNIC], [Contact], [Address]) VALUES (9, N'Shahid Khan', N'3597289108390', N'ABC', N'Peshawar')
GO
INSERT [dbo].[Transport] ([VehicleNo], [DriverCNIC], [VehicleType], [DriverName], [ReturnID]) VALUES (N'230', N'3526728917236', N'Truck', N'Aman Khan', 4)
INSERT [dbo].[Transport] ([VehicleNo], [DriverCNIC], [VehicleType], [DriverName], [ReturnID]) VALUES (N'234', N'3526728917236', N'Truck', N'Aman Khan', 3)
GO
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (2)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (3)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (4)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (5)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (6)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (7)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (8)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (9)
INSERT [dbo].[Vendor] ([EmployeeID]) VALUES (10)
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Attendance_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Attendance]'))
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BranchToBranch_CompanyGoods]') AND parent_object_id = OBJECT_ID(N'[dbo].[BranchToBranch]'))
ALTER TABLE [dbo].[BranchToBranch]  WITH CHECK ADD  CONSTRAINT [FK_BranchToBranch_CompanyGoods] FOREIGN KEY([ProductID])
REFERENCES [dbo].[CompanyGoods] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BranchToBranch_CompanyGoods]') AND parent_object_id = OBJECT_ID(N'[dbo].[BranchToBranch]'))
ALTER TABLE [dbo].[BranchToBranch] CHECK CONSTRAINT [FK_BranchToBranch_CompanyGoods]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyGoods_MaterialRequisition]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyGoods]'))
ALTER TABLE [dbo].[CompanyGoods]  WITH CHECK ADD  CONSTRAINT [FK_CompanyGoods_MaterialRequisition] FOREIGN KEY([RequestNo])
REFERENCES [dbo].[MaterialRequisition] ([RequestNo])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyGoods_MaterialRequisition]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyGoods]'))
ALTER TABLE [dbo].[CompanyGoods] CHECK CONSTRAINT [FK_CompanyGoods_MaterialRequisition]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyGoods_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyGoods]'))
ALTER TABLE [dbo].[CompanyGoods]  WITH CHECK ADD  CONSTRAINT [FK_CompanyGoods_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([EmployeeID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompanyGoods_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompanyGoods]'))
ALTER TABLE [dbo].[CompanyGoods] CHECK CONSTRAINT [FK_CompanyGoods_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GatePass_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[GatePass]'))
ALTER TABLE [dbo].[GatePass]  WITH CHECK ADD  CONSTRAINT [FK_GatePass_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([EmployeeID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GatePass_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[GatePass]'))
ALTER TABLE [dbo].[GatePass] CHECK CONSTRAINT [FK_GatePass_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GoodReturnNote_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[GoodReturnNote]'))
ALTER TABLE [dbo].[GoodReturnNote]  WITH CHECK ADD  CONSTRAINT [FK_GoodReturnNote_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GoodReturnNote_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[GoodReturnNote]'))
ALTER TABLE [dbo].[GoodReturnNote] CHECK CONSTRAINT [FK_GoodReturnNote_Suppliers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Leaves_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Leaves]'))
ALTER TABLE [dbo].[Leaves]  WITH CHECK ADD  CONSTRAINT [FK_Leaves_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Leaves_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Leaves]'))
ALTER TABLE [dbo].[Leaves] CHECK CONSTRAINT [FK_Leaves_Employee]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MaterialRequisition_PurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[MaterialRequisition]'))
ALTER TABLE [dbo].[MaterialRequisition]  WITH CHECK ADD  CONSTRAINT [FK_MaterialRequisition_PurchaseOrder] FOREIGN KEY([PurchaseOrderNo])
REFERENCES [dbo].[PurchaseOrder] ([OrderNo])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MaterialRequisition_PurchaseOrder]') AND parent_object_id = OBJECT_ID(N'[dbo].[MaterialRequisition]'))
ALTER TABLE [dbo].[MaterialRequisition] CHECK CONSTRAINT [FK_MaterialRequisition_PurchaseOrder]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrder_RequiredItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]'))
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_RequiredItems] FOREIGN KEY([ItemCode])
REFERENCES [dbo].[RequiredItems] ([Code])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrder_RequiredItems]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]'))
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_RequiredItems]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrder_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]'))
ALTER TABLE [dbo].[PurchaseOrder]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseOrder_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseOrder_Suppliers]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseOrder]'))
ALTER TABLE [dbo].[PurchaseOrder] CHECK CONSTRAINT [FK_PurchaseOrder_Suppliers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales]'))
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Vendor] FOREIGN KEY([VenderID])
REFERENCES [dbo].[Vendor] ([EmployeeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Sales_Vendor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Sales]'))
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Vendor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalesReturn_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalesReturn]'))
ALTER TABLE [dbo].[SalesReturn]  WITH CHECK ADD  CONSTRAINT [FK_SalesReturn_Sales] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Sales] ([ProductID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalesReturn_Sales]') AND parent_object_id = OBJECT_ID(N'[dbo].[SalesReturn]'))
ALTER TABLE [dbo].[SalesReturn] CHECK CONSTRAINT [FK_SalesReturn_Sales]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Transport_SalesReturn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Transport]'))
ALTER TABLE [dbo].[Transport]  WITH CHECK ADD  CONSTRAINT [FK_Transport_SalesReturn] FOREIGN KEY([ReturnID], [VehicleNo])
REFERENCES [dbo].[SalesReturn] ([ReturnID], [VehicleNo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Transport_SalesReturn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Transport]'))
ALTER TABLE [dbo].[Transport] CHECK CONSTRAINT [FK_Transport_SalesReturn]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor]'))
ALTER TABLE [dbo].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vendor_Employee]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vendor]'))
ALTER TABLE [dbo].[Vendor] CHECK CONSTRAINT [FK_Vendor_Employee]
GO
/****** Object:  StoredProcedure [dbo].[spBill]    Script Date: 4/30/2022 12:27:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spBill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spBill] AS' 
END
GO
ALTER PROCEDURE [dbo].[spBill]
	@Price [decimal](10, 2),
	@qty [int]
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into bill(Price,qty)values(@Price, @qty)
END
GO
ALTER AUTHORIZATION ON [dbo].[spBill] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[spBill] TO  SCHEMA OWNER 
GO
/****** Object:  Trigger [dbo].[totalprice]    Script Date: 4/30/2022 12:27:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[totalprice]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[totalprice] 
   ON  [dbo].[bill] 
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE bill SET total = Price * qty

END
' 
GO
ALTER TABLE [dbo].[bill] ENABLE TRIGGER [totalprice]
GO
/****** Object:  Trigger [dbo].[getTotal]    Script Date: 4/30/2022 12:27:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[getTotal]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[getTotal]
   ON  [dbo].[Sales]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE Sales SET TotalPrice = UnitPrice * NoOfProducts

END
' 
GO
ALTER TABLE [dbo].[Sales] ENABLE TRIGGER [getTotal]
GO
