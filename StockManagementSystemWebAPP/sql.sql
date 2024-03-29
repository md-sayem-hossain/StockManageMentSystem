USE [master]
GO
/****** Object:  Database [StockDB]    Script Date: 13/11/2019 00:18:26 ******/
CREATE DATABASE [StockDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StockDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\StockDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StockDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [StockDB]
GO
/****** Object:  Table [dbo].[ADDItemTB]    Script Date: 13/11/2019 00:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADDItemTB](
	[Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Name] [varchar](50) NULL,
	[Item_Reorder] [int] NULL,
	[Item_Quantity] [int] NULL,
	[Category_Id] [int] NULL,
	[Company_id] [int] NULL,
 CONSTRAINT [PK_ADDItemTB] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryTB]    Script Date: 13/11/2019 00:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NULL,
 CONSTRAINT [PK_CategoryTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyTB]    Script Date: 13/11/2019 00:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
 CONSTRAINT [PK_CompanyTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoginTB]    Script Date: 13/11/2019 00:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_LoginTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOutTB]    Script Date: 13/11/2019 00:18:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOutTB](
	[StockOut_Id] [int] IDENTITY(1,1) NOT NULL,
	[Company_Id] [int] NOT NULL,
	[Item_Id] [int] NOT NULL,
	[StockOut_Quantity] [int] NOT NULL,
	[Date] [varchar](50) NOT NULL,
	[ChosesButton] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockOutTB_1] PRIMARY KEY CLUSTERED 
(
	[StockOut_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ADDItemTB] ON 

INSERT [dbo].[ADDItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (10, N'Dell01', 11, 0, 2023, 2014)
INSERT [dbo].[ADDItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (12, N'Modem01', 10, 0, 2029, 2014)
INSERT [dbo].[ADDItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (14, N'mouse05', 10, 0, 2027, 2011)
INSERT [dbo].[ADDItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (15, N'test1', 10, 1, 2031, 2015)
INSERT [dbo].[ADDItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (16, N'Key_01', 11, 150, 2026, 2011)
SET IDENTITY_INSERT [dbo].[ADDItemTB] OFF
SET IDENTITY_INSERT [dbo].[CategoryTB] ON 

INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2023, N'CPU')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2024, N'Monitor')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2025, N'Pendrive')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2026, N'Keyboard')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2027, N'Mouse')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2028, N'Computer')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2029, N'Printer')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2030, N'HeadPhones')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2031, N'TestCategory')
SET IDENTITY_INSERT [dbo].[CategoryTB] OFF
SET IDENTITY_INSERT [dbo].[CompanyTB] ON 

INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2008, N'Ali')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2009, N'ADATA')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2010, N'ASUS')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2011, N'A4TECH')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2012, N'LENOVO')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2013, N'Dell')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2014, N'NONE')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2015, N'TestCompany')
SET IDENTITY_INSERT [dbo].[CompanyTB] OFF
SET IDENTITY_INSERT [dbo].[LoginTB] ON 

INSERT [dbo].[LoginTB] ([Id], [username], [password]) VALUES (1, N'promak', N'123456')
SET IDENTITY_INSERT [dbo].[LoginTB] OFF
SET IDENTITY_INSERT [dbo].[StockOutTB] ON 

INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2016, 2011, 14, 10, N'2019-11-12', N'Damage')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2017, 2011, 14, 5, N'2019-11-12', N'Sell')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2018, 2015, 15, 10, N'2019-11-12', N'Damage')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2019, 2011, 16, 5, N'2019-11-13', N'Sell')
SET IDENTITY_INSERT [dbo].[StockOutTB] OFF
ALTER TABLE [dbo].[ADDItemTB]  WITH CHECK ADD  CONSTRAINT [FK_ADDItemTB_CategoryTB] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[CategoryTB] ([Id])
GO
ALTER TABLE [dbo].[ADDItemTB] CHECK CONSTRAINT [FK_ADDItemTB_CategoryTB]
GO
ALTER TABLE [dbo].[ADDItemTB]  WITH CHECK ADD  CONSTRAINT [FK_ADDItemTB_CompanyTB] FOREIGN KEY([Company_id])
REFERENCES [dbo].[CompanyTB] ([Id])
GO
ALTER TABLE [dbo].[ADDItemTB] CHECK CONSTRAINT [FK_ADDItemTB_CompanyTB]
GO
USE [master]
GO
ALTER DATABASE [StockDB] SET  READ_WRITE 
GO
