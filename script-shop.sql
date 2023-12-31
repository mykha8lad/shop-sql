USE [master]
GO
/****** Object:  Database [Shop]    Script Date: 13.08.2023 13:09:07 ******/
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop', FILENAME = N'E:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shop_log', FILENAME = N'E:\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shop', N'ON'
GO
ALTER DATABASE [Shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [Shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Shop]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] NOT NULL,
	[street] [varchar](50) NULL,
	[id_city] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[id_region] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[id] [int] NOT NULL,
	[id_product] [int] NULL,
	[id_supplier] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_delivery] [date] NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Markup]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markup](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[percent] [int] NULL,
 CONSTRAINT [PK_Markup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Measurement]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Measurement](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](150) NULL,
 CONSTRAINT [PK_Measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[id_category] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[id_producer] [int] NULL,
	[id_measurement] [int] NULL,
	[id_markup] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[id_country] [int] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] NOT NULL,
	[id_product] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 13.08.2023 13:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[id_address] [int] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (1, N'Rue du Chevalier-de-Saint-George', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (2, N'Rue Clemence-Royer	', 3)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (3, N'Архитектора Николаева ул. 23а
', 1)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (4, N'ул. Семинарская 19', 5)
INSERT [dbo].[Address] ([id], [street], [id_city]) VALUES (5, N'Hauptstrabe 295', 4)
GO
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Tobacco ')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Cereals')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Alcohol')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Dairy')
GO
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (1, N'Kyiv', 1)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (2, N'New York', 2)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (3, N'Paris', 3)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (4, N'Berlin', 4)
INSERT [dbo].[City] ([id], [name], [id_region]) VALUES (5, N'Odesa', 5)
GO
INSERT [dbo].[Country] ([id], [name]) VALUES (1, N'Ukraine')
INSERT [dbo].[Country] ([id], [name]) VALUES (2, N'Poland')
INSERT [dbo].[Country] ([id], [name]) VALUES (3, N'USA')
INSERT [dbo].[Country] ([id], [name]) VALUES (4, N'France')
INSERT [dbo].[Country] ([id], [name]) VALUES (5, N'Germany')
GO
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (1, 1, 2, 23000, 230, CAST(N'2023-07-12' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (2, 2, 3, 29300, 158, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (3, 4, 1, 54850, 200, CAST(N'2023-07-07' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (4, 5, 5, 48100, 174, CAST(N'2023-07-15' AS Date))
INSERT [dbo].[Delivery] ([id], [id_product], [id_supplier], [price], [quantity], [date_of_delivery]) VALUES (5, 3, 4, 45310, 139, CAST(N'2023-08-01' AS Date))
GO
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (1, N'Marlboro', 68)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (2, N'Milk', 90)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (3, N'Buckwheat', 87)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (4, N'Camel', 70)
INSERT [dbo].[Markup] ([id], [name], [percent]) VALUES (5, N'Jack Daniels', 88)
GO
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (1, N'Pack', N'---')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (2, N'Plastic bag', N'---')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (3, N'Cellophane bag', N'---')
INSERT [dbo].[Measurement] ([id], [name], [description]) VALUES (4, N'Glass bottle', N'---')
GO
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (1, N'Valentino', 1)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (2, N'Elon', 4)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (3, N'Leonardo', 5)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (4, N'Karl', 2)
INSERT [dbo].[Producer] ([id], [name], [id_address]) VALUES (5, N'Budanov', 3)
GO
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (1, N'Marlboro', 1, 90, 310, 4, 1, 1)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (2, N'Milk', 4, 41, 40, 2, 2, 2)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (3, N'Buckwheat', 2, 107, 150, 3, 3, 3)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (4, N'Camel', 1, 65, 200, 3, 1, 4)
INSERT [dbo].[Product] ([id], [name], [id_category], [price], [quantity], [id_producer], [id_measurement], [id_markup]) VALUES (5, N'Jack Daniels', 3, 3199, 18, 1, 4, 5)
GO
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (1, N'Kyiv', 1)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (2, N'New York', 3)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (3, N'Paris', 4)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (4, N'Berlin', 5)
INSERT [dbo].[Region] ([id], [name], [id_country]) VALUES (5, N'Odesa', 1)
GO
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (1, 4, 60, 250, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (2, 3, 3000, 200, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (3, 5, 80, 25, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (4, 2, 38, 50, CAST(N'2023-07-10' AS Date))
INSERT [dbo].[Sale] ([id], [id_product], [price], [quantity], [date_of_sale]) VALUES (5, 1, 85, 400, CAST(N'2023-07-10' AS Date))
GO
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (1, N'Setnick', 5)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (2, N'FrancEdit', 1)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (3, N'GloryUA', 3)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (4, N'Novikon', 4)
INSERT [dbo].[Supplier] ([id], [name], [id_address]) VALUES (5, N'Amway', 2)
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_City] FOREIGN KEY([id_city])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_City]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Region] FOREIGN KEY([id_region])
REFERENCES [dbo].[Region] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Region]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Product]
GO
ALTER TABLE [dbo].[Producer]  WITH CHECK ADD  CONSTRAINT [FK_Producer_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Producer] CHECK CONSTRAINT [FK_Producer_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([id_category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Markup] FOREIGN KEY([id_markup])
REFERENCES [dbo].[Markup] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Markup]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[Measurement] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Measurement]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([id_producer])
REFERENCES [dbo].[Producer] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Region]  WITH CHECK ADD  CONSTRAINT [FK_Region_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Region] CHECK CONSTRAINT [FK_Region_Country]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
