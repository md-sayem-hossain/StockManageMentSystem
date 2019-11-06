USE [master]
GO
/****** Object:  Database [StockDB]    Script Date: 06/11/2019 13:54:20 ******/
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
/****** Object:  Table [dbo].[CategoryTB]    Script Date: 06/11/2019 13:54:20 ******/
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
/****** Object:  Table [dbo].[CompanyTB]    Script Date: 06/11/2019 13:54:20 ******/
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
/****** Object:  Table [dbo].[ItemTB]    Script Date: 06/11/2019 13:54:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemTB](
	[Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Name] [varchar](50) NULL,
	[Item_Reorder] [int] NULL,
	[Item_Quantity] [int] NULL,
	[Category_Id] [int] NULL,
	[Company_id] [int] NULL,
 CONSTRAINT [PK_ItemTB] PRIMARY KEY CLUSTERED 
(
	[Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOutTB]    Script Date: 06/11/2019 13:54:20 ******/
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
SET IDENTITY_INSERT [dbo].[CategoryTB] ON 

INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (1, N'CPU')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2, N'Modem')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (3, N'Pendrive')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (4, N'harddrive')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (1004, N'Computer')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (1005, N'Router')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2004, N'Mouse')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2005, N'Monitor')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2006, N'keyboard')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2007, N'Printer')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2008, N'HeadPhones')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2009, N'Laptop')
INSERT [dbo].[CategoryTB] ([Id], [CategoryName]) VALUES (2010, N'WIFI')
SET IDENTITY_INSERT [dbo].[CategoryTB] OFF
SET IDENTITY_INSERT [dbo].[CompanyTB] ON 

INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (1, N'Dell')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2, N'Asus')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (3, N'A4Tech')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (1003, N'ADATA')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2003, N'Lenovo')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2004, N'Sony')
INSERT [dbo].[CompanyTB] ([Id], [CompanyName]) VALUES (2005, N'CNet')
SET IDENTITY_INSERT [dbo].[CompanyTB] OFF
SET IDENTITY_INSERT [dbo].[ItemTB] ON 

INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (4, N'Dell_01', 10, 135, 1, 1)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (5, N'Key_01', 101, 0, 3, 2)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (6, N'Mouse_01', 301, 5, 4, 3)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (1006, N'HDPHN_01', 10, 75, 1004, 3)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (1007, N'A1_32GB', 10, 40, 1005, 1003)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (2006, N'HDPHN_02', 501, 500, 2008, 3)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (2007, N'Sony5252', 601, 285, 2009, 2004)
INSERT [dbo].[ItemTB] ([Item_Id], [Item_Name], [Item_Reorder], [Item_Quantity], [Category_Id], [Company_id]) VALUES (2008, N'DDNBD', 601, 0, 2010, 2005)
SET IDENTITY_INSERT [dbo].[ItemTB] OFF
SET IDENTITY_INSERT [dbo].[StockOutTB] ON 

INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (1002, 1, 4, 0, N'05-11-2019', N'0')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (1003, 1003, 1007, 0, N'05-11-2019', N'0')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (1004, 3, 1006, 0, N'05-11-2019', N'0')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2002, 1003, 1007, 9, N'2019-11-05', N'Sell')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2003, 0, -1, 10, N'2019-11-05', N'Sell')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2004, 1003, 1007, 10, N'2019-11-05', N'Sell')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2005, 1, 4, 5, N'2019-11-05', N'Sell')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2006, 3, 1006, 5, N'2019-11-05', N'Sell')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2007, 2004, 2007, 15, N'2019-11-06', N'Damage')
INSERT [dbo].[StockOutTB] ([StockOut_Id], [Company_Id], [Item_Id], [StockOut_Quantity], [Date], [ChosesButton]) VALUES (2008, 1, 4, 25, N'2019-11-06', N'Damage')
SET IDENTITY_INSERT [dbo].[StockOutTB] OFF
ALTER TABLE [dbo].[ItemTB]  WITH CHECK ADD  CONSTRAINT [CategoryAndItemRelation] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[CategoryTB] ([Id])
GO
ALTER TABLE [dbo].[ItemTB] CHECK CONSTRAINT [CategoryAndItemRelation]
GO
ALTER TABLE [dbo].[ItemTB]  WITH CHECK ADD  CONSTRAINT [CompanyAndItemRelation] FOREIGN KEY([Company_id])
REFERENCES [dbo].[CompanyTB] ([Id])
GO
ALTER TABLE [dbo].[ItemTB] CHECK CONSTRAINT [CompanyAndItemRelation]
GO
USE [master]
GO
ALTER DATABASE [StockDB] SET  READ_WRITE 
GO
