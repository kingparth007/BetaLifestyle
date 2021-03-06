USE [master]
GO
/****** Object:  Database [Beta]    Script Date: 11/01/2018 12:28:55 p.m. ******/
CREATE DATABASE [Beta]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Beta', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Beta.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Beta_llog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Beta_llog.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Beta] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Beta].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Beta] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Beta] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Beta] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Beta] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Beta] SET ARITHABORT OFF 
GO
ALTER DATABASE [Beta] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Beta] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Beta] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Beta] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Beta] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Beta] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Beta] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Beta] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Beta] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Beta] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Beta] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Beta] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Beta] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Beta] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Beta] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Beta] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Beta] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Beta] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Beta] SET  MULTI_USER 
GO
ALTER DATABASE [Beta] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Beta] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Beta] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Beta] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Beta] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Beta]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Size] [varchar](50) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GUID]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GUID](
	[UniqueId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Purpose] [varchar](50) NULL,
 CONSTRAINT [PK_GUID_1] PRIMARY KEY CLUSTERED 
(
	[UniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL CONSTRAINT [DF_Login_CreatedOn]  DEFAULT (getdate()),
	[Islocked] [bit] NULL,
	[UserRole] [varchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[InvoiceNo] [varchar](50) NULL,
	[UserId] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[TotalAmount] [decimal](18, 2) NULL,
	[Size] [varchar](20) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Subtotal] [decimal](18, 2) NULL,
	[Shipping] [decimal](18, 2) NULL,
	[Tax] [decimal](18, 2) NULL,
	[Status] [int] NULL,
	[InvoiceNo] [varchar](50) NULL,
	[UserId] [int] NULL,
	[AddedOn] [datetime] NULL,
	[ShippingAddress] [varchar](500) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](20) NOT NULL,
	[ProductPrice] [decimal](18, 0) NOT NULL,
	[ProductDesc] [varchar](100) NOT NULL,
	[ProductBrandName] [varchar](20) NOT NULL,
	[ProductWeight] [varchar](10) NULL,
	[ProductColor] [varchar](20) NOT NULL,
	[ProductAddDate] [date] NOT NULL,
	[ProductCatID] [int] NOT NULL,
	[ProductSubCatID] [int] NOT NULL,
 CONSTRAINT [PK_ProductTbl] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCatID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCatName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ProductCategoriesTbl] PRIMARY KEY CLUSTERED 
(
	[ProductCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ProductImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductImageName] [varchar](50) NOT NULL,
	[ProductImagePath] [varchar](200) NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ProducImgTbl] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductSizes]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSizes](
	[ProductSizeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductSizeName] [varchar](10) NOT NULL,
	[ProductSubCatID] [int] NOT NULL,
 CONSTRAINT [PK_ProductSizeTbl] PRIMARY KEY CLUSTERED 
(
	[ProductSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSubCategories](
	[ProductSubCatID] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCatName] [varchar](20) NOT NULL,
	[ProductCatID] [int] NOT NULL,
 CONSTRAINT [PK_ProductSubCategoriesTbl] PRIMARY KEY CLUSTERED 
(
	[ProductSubCatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[PinCode] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 11/01/2018 12:28:56 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductSizeName] [varchar](10) NOT NULL,
	[StockCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductStock] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Login] FOREIGN KEY([UserId])
REFERENCES [dbo].[Login] ([ID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Login]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[GUID]  WITH CHECK ADD  CONSTRAINT [FK_GUID_Login] FOREIGN KEY([UserId])
REFERENCES [dbo].[Login] ([ID])
GO
ALTER TABLE [dbo].[GUID] CHECK CONSTRAINT [FK_GUID_Login]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Login] FOREIGN KEY([UserId])
REFERENCES [dbo].[Login] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Login]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Login] FOREIGN KEY([UserId])
REFERENCES [dbo].[Login] ([ID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Login]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProductTbl_ProductCategoriesTbl] FOREIGN KEY([ProductCatID])
REFERENCES [dbo].[ProductCategories] ([ProductCatID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProductTbl_ProductCategoriesTbl]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_ProductTbl_ProductSubCategoriesTbl] FOREIGN KEY([ProductSubCatID])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCatID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_ProductTbl_ProductSubCategoriesTbl]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProducImgTbl_ProductTbl] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProducImgTbl_ProductTbl]
GO
ALTER TABLE [dbo].[ProductSizes]  WITH CHECK ADD  CONSTRAINT [FK_ProductSizeTbl_ProductCategoriesTbl] FOREIGN KEY([ProductSubCatID])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCatID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSizes] CHECK CONSTRAINT [FK_ProductSizeTbl_ProductCategoriesTbl]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategoriesTbl_ProductCategoriesTbl] FOREIGN KEY([ProductCatID])
REFERENCES [dbo].[ProductCategories] ([ProductCatID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategoriesTbl_ProductCategoriesTbl]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Login] FOREIGN KEY([UserId])
REFERENCES [dbo].[Login] ([ID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Login]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_ProductStock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_ProductStock_Product]
GO
USE [master]
GO
ALTER DATABASE [Beta] SET  READ_WRITE 
GO
