USE [master]
GO
/****** Object:  Database [Étoile Sylph Couture]    Script Date: 27/10/2024 23:32:07 ******/
CREATE DATABASE [Étoile Sylph Couture]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Étoile Sylph Couture', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Étoile Sylph Couture.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Étoile Sylph Couture_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Étoile Sylph Couture_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Étoile Sylph Couture] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Étoile Sylph Couture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Étoile Sylph Couture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET ARITHABORT OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Étoile Sylph Couture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Étoile Sylph Couture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Étoile Sylph Couture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Étoile Sylph Couture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET RECOVERY FULL 
GO
ALTER DATABASE [Étoile Sylph Couture] SET  MULTI_USER 
GO
ALTER DATABASE [Étoile Sylph Couture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Étoile Sylph Couture] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Étoile Sylph Couture] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Étoile Sylph Couture] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Étoile Sylph Couture] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Étoile Sylph Couture] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Étoile Sylph Couture', N'ON'
GO
ALTER DATABASE [Étoile Sylph Couture] SET QUERY_STORE = ON
GO
ALTER DATABASE [Étoile Sylph Couture] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Étoile Sylph Couture]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27/10/2024 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Description] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 27/10/2024 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 27/10/2024 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/10/2024 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/10/2024 23:32:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[Description] [text] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
USE [master]
GO
ALTER DATABASE [Étoile Sylph Couture] SET  READ_WRITE 
GO
