USE [master]
GO
/****** Object:  Database [demin_prat_15]    Script Date: 28.03.2026 13:52:40 ******/
CREATE DATABASE [demin_prat_15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'demin_prat_15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\demin_prat_15.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'demin_prat_15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\demin_prat_15_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [demin_prat_15] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [demin_prat_15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [demin_prat_15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [demin_prat_15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [demin_prat_15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [demin_prat_15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [demin_prat_15] SET ARITHABORT OFF 
GO
ALTER DATABASE [demin_prat_15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [demin_prat_15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [demin_prat_15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [demin_prat_15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [demin_prat_15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [demin_prat_15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [demin_prat_15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [demin_prat_15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [demin_prat_15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [demin_prat_15] SET  DISABLE_BROKER 
GO
ALTER DATABASE [demin_prat_15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [demin_prat_15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [demin_prat_15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [demin_prat_15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [demin_prat_15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [demin_prat_15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [demin_prat_15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [demin_prat_15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [demin_prat_15] SET  MULTI_USER 
GO
ALTER DATABASE [demin_prat_15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [demin_prat_15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [demin_prat_15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [demin_prat_15] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [demin_prat_15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [demin_prat_15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'demin_prat_15', N'ON'
GO
ALTER DATABASE [demin_prat_15] SET QUERY_STORE = OFF
GO
USE [demin_prat_15]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 28.03.2026 13:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28.03.2026 13:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_tags]    Script Date: 28.03.2026 13:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_tags](
	[ProductId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28.03.2026 13:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Stock] [int] NOT NULL,
	[Rating] [float] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 28.03.2026 13:52:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'Samsung')
GO
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Apple')
GO
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Sony')
GO
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Lenovo')
GO
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Xiaomi')
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Smartphones')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Laptops')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Accessories')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Tablets')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'TV')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (1, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (1, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (1, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (2, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (2, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (3, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (4, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (5, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (6, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (6, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (7, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (7, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (8, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (9, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (9, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (9, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (10, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (10, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (11, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (11, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (12, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (13, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (13, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (14, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (14, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (15, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (15, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (16, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (16, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (17, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (18, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (19, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (20, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (20, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (21, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (21, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (22, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (23, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (24, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (25, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (26, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (26, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (26, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (27, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (27, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (28, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (28, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (28, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (29, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (30, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (31, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (31, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (32, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (32, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (33, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (33, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (33, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (34, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (34, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (34, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (35, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (35, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (36, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (36, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (37, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (38, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (39, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (39, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (39, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (40, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (40, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (41, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (42, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (43, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (43, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (43, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (44, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (45, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (45, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (45, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (46, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (46, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (46, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (47, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (47, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (47, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (48, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (48, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (49, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (49, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (50, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (50, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (50, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (51, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (51, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (52, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (53, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (53, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (54, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (55, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (56, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (57, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (58, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (59, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (59, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (60, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (60, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (61, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (62, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (63, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (63, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (63, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (64, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (65, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (65, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (66, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (66, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (66, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (67, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (67, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (68, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (69, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (69, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (70, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (71, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (72, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (72, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (72, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (73, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (73, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (74, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (74, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (74, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (75, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (76, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (76, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (77, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (77, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (78, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (78, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (78, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (79, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (79, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (80, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (80, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (81, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (82, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (83, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (83, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (84, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (85, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (85, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (86, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (87, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (88, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (89, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (90, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (91, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (91, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (92, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (93, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (93, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (94, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (95, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (95, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (96, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (96, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (96, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (97, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (98, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (98, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (99, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (99, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (99, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (100, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (100, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (101, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (102, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (102, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (103, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (104, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (105, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (106, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (107, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (107, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (108, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (109, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (110, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (110, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (111, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (111, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (112, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (112, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (113, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (113, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (114, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (115, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (115, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (116, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (116, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (117, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (117, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (118, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (119, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (120, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (121, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (122, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (122, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (123, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (124, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (124, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (124, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (125, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (125, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (126, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (127, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (127, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (128, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (129, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (129, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (129, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (130, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (130, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (131, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (132, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (133, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (134, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (135, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (135, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (136, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (136, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (137, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (137, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (138, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (139, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (140, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (140, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (141, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (142, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (142, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (143, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (143, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (143, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (144, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (145, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (145, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (146, 5)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (147, 4)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (148, 2)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (149, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (149, 3)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (150, 1)
GO
INSERT [dbo].[Product_tags] ([ProductId], [TagId]) VALUES (150, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (1, N'Logitech MX Master 3', N'Latest-generation technology', 167.56, 307, 4.4, CAST(N'2024-07-11T00:00:00.0000000' AS DateTime2), 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (2, N'Lenovo Tab P12', N'High-performance device', 2659.51, 238, 1.8, CAST(N'2024-03-06T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (3, N'TCL 6-Series 55', N'High-performance device', 1563.33, 499, 4.6, CAST(N'2023-11-05T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (4, N'Samsung Galaxy Tab S9', N'Premium build quality', 2007.26, 437, 3.2, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (5, N'Samsung Galaxy Tab S9', N'Durable and reliable', 2131.64, 78, 1.3, CAST(N'2024-08-17T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (6, N'LG OLED C2 65', N'Durable and reliable', 558.69, 124, 3.5, CAST(N'2024-07-06T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (7, N'HP Spectre x360', N'Latest-generation technology', 1922.87, 282, 3.8, CAST(N'2023-11-17T00:00:00.0000000' AS DateTime2), 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (8, N'MacBook Pro 16', N'Budget-friendly model', 1575.3, 121, 2, CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (9, N'MacBook Pro 16', N'Compact and lightweight', 2652.68, 94, 4.5, CAST(N'2023-12-06T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (10, N'Xiaomi Pad 6', N'Durable and reliable', 1224.85, 150, 4.8, CAST(N'2023-02-21T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (11, N'Apple AirPods Pro', N'Top-rated by users', 1601.24, 326, 3.1, CAST(N'2024-04-12T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (12, N'MacBook Pro 16', N'Budget-friendly model', 290.54, 474, 3.6, CAST(N'2023-11-15T00:00:00.0000000' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (13, N'Sony Bravia X90J', N'Compact and lightweight', 1863.96, 93, 1.4, CAST(N'2024-03-19T00:00:00.0000000' AS DateTime2), 5, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (14, N'Sony Bravia X90J', N'High-performance device', 2197.89, 394, 4.6, CAST(N'2023-08-13T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (15, N'Huawei P50', N'High-performance device', 2250.04, 363, 3.3, CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (16, N'Samsung QLED 55', N'Budget-friendly model', 1425.01, 315, 4.4, CAST(N'2023-11-23T00:00:00.0000000' AS DateTime2), 5, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (17, N'TCL 6-Series 55', N'Durable and reliable', 2850.11, 411, 1.5, CAST(N'2023-11-26T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (18, N'Xiaomi Pad 6', N'Latest-generation technology', 1752.25, 231, 3.6, CAST(N'2023-07-10T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (19, N'iPad Pro 12.9', N'Latest-generation technology', 1643.48, 281, 4.9, CAST(N'2023-08-04T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (20, N'Lenovo Tab P12', N'Latest-generation technology', 2836.2, 234, 2.1, CAST(N'2023-03-23T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (21, N'LG OLED C2 65', N'High-performance device', 2639.67, 205, 1.1, CAST(N'2024-07-09T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (22, N'OnePlus 11', N'Latest-generation technology', 376.37, 274, 3.5, CAST(N'2024-11-12T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (23, N'Samsung Galaxy Buds2', N'High-performance device', 1156.51, 442, 4.1, CAST(N'2024-03-26T00:00:00.0000000' AS DateTime2), 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (24, N'Huawei P50', N'Budget-friendly model', 779.94, 305, 1.6, CAST(N'2023-01-16T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (25, N'Xiaomi Mi 12', N'Budget-friendly model', 2184.55, 430, 1.4, CAST(N'2023-12-03T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (26, N'TCL 6-Series 55', N'Top-rated by users', 1003.38, 333, 1.6, CAST(N'2023-02-26T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (27, N'OnePlus 11', N'Budget-friendly model', 614.44, 48, 4.1, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (28, N'Lenovo ThinkPad X1', N'Budget-friendly model', 516.22, 429, 4.1, CAST(N'2023-02-22T00:00:00.0000000' AS DateTime2), 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (29, N'Apple AirPods Pro', N'High-performance device', 2473.68, 430, 3.4, CAST(N'2023-12-04T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (30, N'LG OLED C2 65', N'Durable and reliable', 2751.47, 156, 4.6, CAST(N'2024-06-04T00:00:00.0000000' AS DateTime2), 5, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (31, N'Huawei P50', N'Top-rated by users', 1778.05, 232, 4.7, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (32, N'Lenovo ThinkPad X1', N'Top-rated by users', 2683.84, 32, 1.6, CAST(N'2024-06-04T00:00:00.0000000' AS DateTime2), 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (33, N'iPad Pro 12.9', N'Compact and lightweight', 2295.17, 73, 3.1, CAST(N'2024-10-14T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (34, N'Huawei P50', N'Top-rated by users', 1136.43, 45, 4.7, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (35, N'Samsung QLED 55', N'Durable and reliable', 220.7, 347, 2.8, CAST(N'2024-06-21T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (36, N'Samsung QLED 55', N'Latest-generation technology', 580.86, 365, 3.5, CAST(N'2024-05-14T00:00:00.0000000' AS DateTime2), 5, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (37, N'Lenovo Tab P12', N'Latest-generation technology', 1427.58, 68, 4.5, CAST(N'2024-01-11T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (38, N'Lenovo Tab P12', N'Top-rated by users', 2748.42, 364, 4.6, CAST(N'2023-10-03T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (39, N'Sony Bravia X90J', N'Durable and reliable', 1738.98, 325, 4.4, CAST(N'2023-01-29T00:00:00.0000000' AS DateTime2), 5, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (40, N'Samsung Galaxy Buds2', N'High-performance device', 2328.56, 164, 2.8, CAST(N'2023-03-15T00:00:00.0000000' AS DateTime2), 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (41, N'iPad Pro 12.9', N'Budget-friendly model', 1534.97, 281, 2.8, CAST(N'2024-04-19T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (42, N'MacBook Pro 16', N'Compact and lightweight', 882.35, 386, 3.2, CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (43, N'Razer BlackShark V2', N'Budget-friendly model', 1894.88, 344, 4.7, CAST(N'2023-02-04T00:00:00.0000000' AS DateTime2), 3, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (44, N'OnePlus 11', N'High-performance device', 376.34, 124, 1.6, CAST(N'2023-10-27T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (45, N'MacBook Pro 16', N'Premium build quality', 2007.25, 277, 5, CAST(N'2023-03-03T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (46, N'Samsung Galaxy Tab S9', N'Premium build quality', 57.99, 453, 4.4, CAST(N'2023-08-26T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (47, N'Xiaomi Pad 6', N'Premium build quality', 1157.92, 285, 2.2, CAST(N'2023-12-30T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (48, N'OnePlus 11', N'Premium build quality', 1348.96, 34, 4.2, CAST(N'2023-07-01T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (49, N'Acer Predator', N'Budget-friendly model', 1317.98, 308, 2.1, CAST(N'2024-10-13T00:00:00.0000000' AS DateTime2), 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (50, N'Pixel 8', N'Compact and lightweight', 1202.48, 170, 4.9, CAST(N'2023-09-24T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (51, N'OnePlus 11', N'Latest-generation technology', 2473.6, 323, 2.7, CAST(N'2024-03-13T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (52, N'OnePlus 11', N'Latest-generation technology', 2124.65, 236, 3.6, CAST(N'2024-10-13T00:00:00.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (53, N'Samsung Galaxy Tab S9', N'Top-rated by users', 1334.13, 258, 3.4, CAST(N'2023-09-07T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (54, N'Xiaomi Mi 12', N'Compact and lightweight', 274.23, 197, 2.1, CAST(N'2024-05-16T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (55, N'HP Spectre x360', N'Top-rated by users', 1428.18, 462, 1.9, CAST(N'2024-03-26T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (56, N'Lenovo Tab P12', N'Top-rated by users', 1819.96, 348, 2.1, CAST(N'2024-01-28T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (57, N'Galaxy S23', N'Budget-friendly model', 1402.64, 259, 4.7, CAST(N'2023-03-12T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (58, N'HP Spectre x360', N'Premium build quality', 677.3, 381, 1.6, CAST(N'2024-07-07T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (59, N'Galaxy S23', N'Latest-generation technology', 1360.21, 240, 3.3, CAST(N'2024-07-05T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (60, N'Lenovo Tab P12', N'Budget-friendly model', 2643.83, 350, 4.9, CAST(N'2024-10-22T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (61, N'Lenovo Tab P12', N'Compact and lightweight', 1929.72, 150, 3.1, CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (62, N'Logitech MX Master 3', N'Latest-generation technology', 734.57, 154, 1.7, CAST(N'2024-11-05T00:00:00.0000000' AS DateTime2), 3, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (63, N'Pixel 8', N'Budget-friendly model', 908.23, 32, 2.1, CAST(N'2024-03-19T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (64, N'Lenovo Tab P12', N'Latest-generation technology', 122.96, 88, 3.9, CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (65, N'LG OLED C2 65', N'Premium build quality', 2296.63, 97, 2.3, CAST(N'2023-07-26T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (66, N'HP Spectre x360', N'Compact and lightweight', 2389.99, 495, 2.5, CAST(N'2023-08-25T00:00:00.0000000' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (67, N'TCL 6-Series 55', N'Compact and lightweight', 959.36, 353, 5, CAST(N'2023-10-01T00:00:00.0000000' AS DateTime2), 5, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (68, N'Galaxy S23', N'Compact and lightweight', 590.08, 86, 2.7, CAST(N'2024-09-08T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (69, N'Pixel 8', N'Premium build quality', 308.89, 386, 5, CAST(N'2024-03-08T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (70, N'Lenovo ThinkPad X1', N'Durable and reliable', 816.1, 370, 5, CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), 2, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (71, N'LG OLED C2 65', N'Durable and reliable', 731.11, 232, 4.4, CAST(N'2023-11-19T00:00:00.0000000' AS DateTime2), 5, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (72, N'iPad Pro 12.9', N'Premium build quality', 818.61, 76, 1.3, CAST(N'2024-04-17T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (73, N'Apple AirPods Pro', N'Budget-friendly model', 2159.86, 136, 1.6, CAST(N'2023-03-14T00:00:00.0000000' AS DateTime2), 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (74, N'Samsung Galaxy Tab S9', N'Premium build quality', 792.25, 294, 2, CAST(N'2024-04-30T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (75, N'OnePlus 11', N'Latest-generation technology', 496.6, 280, 1.3, CAST(N'2023-05-13T00:00:00.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (76, N'Razer BlackShark V2', N'Premium build quality', 1749.38, 163, 1.2, CAST(N'2023-12-27T00:00:00.0000000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (77, N'Logitech MX Master 3', N'Top-rated by users', 361.58, 301, 1, CAST(N'2024-03-30T00:00:00.0000000' AS DateTime2), 3, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (78, N'Lenovo Tab P12', N'Premium build quality', 832.96, 129, 3.2, CAST(N'2023-09-08T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (79, N'MacBook Pro 16', N'Latest-generation technology', 1967.49, 472, 3.4, CAST(N'2023-03-30T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (80, N'OnePlus 11', N'Budget-friendly model', 1218.39, 41, 2.7, CAST(N'2023-07-09T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (81, N'Sony WH-1000XM5', N'Budget-friendly model', 879.16, 245, 4.7, CAST(N'2023-11-26T00:00:00.0000000' AS DateTime2), 3, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (82, N'LG OLED C2 65', N'High-performance device', 2532.56, 249, 2.3, CAST(N'2023-07-15T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (83, N'Samsung Galaxy Tab S9', N'Durable and reliable', 1369.37, 146, 2.8, CAST(N'2024-01-28T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (84, N'Xiaomi Mi 12', N'Premium build quality', 423.28, 421, 2.7, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (85, N'HP Spectre x360', N'High-performance device', 2108.77, 187, 3.2, CAST(N'2023-03-02T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (86, N'LG OLED C2 65', N'Compact and lightweight', 1240.06, 392, 2.6, CAST(N'2024-11-08T00:00:00.0000000' AS DateTime2), 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (87, N'iPhone 14', N'High-performance device', 400.53, 426, 4.6, CAST(N'2024-01-03T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (88, N'Xiaomi Pad 6', N'Compact and lightweight', 464.17, 55, 2.1, CAST(N'2023-04-07T00:00:00.0000000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (89, N'Dell XPS 15', N'Latest-generation technology', 1946.19, 98, 1.4, CAST(N'2023-02-15T00:00:00.0000000' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (90, N'Samsung Galaxy Tab S9', N'Latest-generation technology', 1276.76, 170, 1.3, CAST(N'2024-06-10T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (91, N'Samsung QLED 55', N'Compact and lightweight', 1463.85, 40, 1.2, CAST(N'2023-01-10T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (92, N'Sony Bravia X90J', N'Top-rated by users', 1795.89, 72, 4.6, CAST(N'2023-07-09T00:00:00.0000000' AS DateTime2), 5, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (93, N'Pixel 8', N'Top-rated by users', 1189.04, 89, 1.3, CAST(N'2024-01-07T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (94, N'Xiaomi Mi 12', N'Latest-generation technology', 1156.09, 366, 2.5, CAST(N'2023-05-16T00:00:00.0000000' AS DateTime2), 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (95, N'Lenovo ThinkPad X1', N'Premium build quality', 2550.29, 422, 4.3, CAST(N'2023-05-02T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (96, N'Asus ROG Strix', N'Durable and reliable', 2849.27, 72, 1.3, CAST(N'2023-12-13T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (97, N'Sony WH-1000XM5', N'Budget-friendly model', 833.97, 419, 2.1, CAST(N'2024-11-18T00:00:00.0000000' AS DateTime2), 3, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (98, N'Lenovo Tab P12', N'Budget-friendly model', 2975.89, 30, 2.3, CAST(N'2023-01-15T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (99, N'Samsung QLED 55', N'Budget-friendly model', 1675.01, 152, 3.4, CAST(N'2023-03-11T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (100, N'Xiaomi Mi 12', N'Latest-generation technology', 2936.87, 483, 3.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (101, N'iPad Pro 12.9', N'Budget-friendly model', 2586.19, 263, 4.1, CAST(N'2023-01-25T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (102, N'Samsung Galaxy Tab S9', N'Compact and lightweight', 968.65, 438, 3.3, CAST(N'2023-11-08T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (103, N'iPad Pro 12.9', N'Durable and reliable', 690.52, 183, 4.3, CAST(N'2023-02-04T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (104, N'Razer BlackShark V2', N'Premium build quality', 1937.44, 325, 4.1, CAST(N'2024-01-31T00:00:00.0000000' AS DateTime2), 3, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (105, N'Sony Bravia X90J', N'High-performance device', 1363.02, 98, 2.7, CAST(N'2024-05-07T00:00:00.0000000' AS DateTime2), 5, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (106, N'Huawei P50', N'High-performance device', 1374.74, 120, 1.6, CAST(N'2023-01-18T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (107, N'Samsung Galaxy Tab S9', N'High-performance device', 1275.12, 23, 4.3, CAST(N'2023-03-14T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (108, N'MacBook Pro 16', N'High-performance device', 239.67, 134, 2.3, CAST(N'2024-10-13T00:00:00.0000000' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (109, N'HP Spectre x360', N'Latest-generation technology', 1723.77, 78, 2.8, CAST(N'2024-01-09T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (110, N'iPad Pro 12.9', N'Budget-friendly model', 705.37, 195, 3.5, CAST(N'2024-03-14T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (111, N'Xiaomi Mi 12', N'High-performance device', 497.93, 282, 3.7, CAST(N'2023-05-01T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (112, N'Asus ROG Strix', N'Budget-friendly model', 2619.86, 319, 1.3, CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (113, N'Samsung Galaxy Buds2', N'Budget-friendly model', 1358.29, 499, 2.8, CAST(N'2023-02-13T00:00:00.0000000' AS DateTime2), 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (114, N'Dell XPS 15', N'Budget-friendly model', 93.57, 390, 2.2, CAST(N'2023-11-21T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (115, N'Huawei P50', N'Compact and lightweight', 348.28, 460, 3.4, CAST(N'2024-09-17T00:00:00.0000000' AS DateTime2), 1, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (116, N'Xiaomi Pad 6', N'Top-rated by users', 847.36, 285, 1, CAST(N'2023-09-17T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (117, N'MacBook Pro 16', N'Compact and lightweight', 983.58, 145, 2.3, CAST(N'2024-03-13T00:00:00.0000000' AS DateTime2), 2, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (118, N'Pixel 8', N'Budget-friendly model', 2571.01, 475, 3, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (119, N'Lenovo Tab P12', N'Compact and lightweight', 1716.59, 485, 1.7, CAST(N'2024-02-07T00:00:00.0000000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (120, N'Huawei P50', N'Top-rated by users', 2939.88, 495, 4.3, CAST(N'2023-01-30T00:00:00.0000000' AS DateTime2), 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (121, N'HP Spectre x360', N'Budget-friendly model', 739.59, 161, 3.1, CAST(N'2024-04-13T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (122, N'Galaxy S23', N'Compact and lightweight', 2174.94, 399, 1.5, CAST(N'2024-06-27T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (123, N'Samsung Galaxy Buds2', N'Premium build quality', 693.09, 310, 3.8, CAST(N'2023-06-30T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (124, N'Acer Predator', N'Top-rated by users', 297.72, 36, 4.2, CAST(N'2024-03-10T00:00:00.0000000' AS DateTime2), 2, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (125, N'Xiaomi Pad 6', N'Top-rated by users', 822.88, 449, 3.7, CAST(N'2024-03-17T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (126, N'Samsung Galaxy Buds2', N'Durable and reliable', 1290.09, 141, 2.1, CAST(N'2023-09-17T00:00:00.0000000' AS DateTime2), 3, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (127, N'Samsung QLED 55', N'Premium build quality', 1215.62, 20, 2.6, CAST(N'2023-11-30T00:00:00.0000000' AS DateTime2), 5, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (128, N'Samsung QLED 55', N'Compact and lightweight', 2564.4, 104, 3.9, CAST(N'2024-07-02T00:00:00.0000000' AS DateTime2), 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (129, N'Lenovo Tab P12', N'Top-rated by users', 1705.73, 272, 3.1, CAST(N'2023-11-10T00:00:00.0000000' AS DateTime2), 4, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (130, N'iPad Pro 12.9', N'Latest-generation technology', 2525.51, 453, 4.6, CAST(N'2023-04-14T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (131, N'Xiaomi Pad 6', N'Latest-generation technology', 1608, 460, 2.2, CAST(N'2024-05-01T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (132, N'Huawei P50', N'Latest-generation technology', 2513.16, 209, 3.5, CAST(N'2023-10-23T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (133, N'Samsung Galaxy Tab S9', N'Compact and lightweight', 1825.39, 187, 1.9, CAST(N'2023-01-28T00:00:00.0000000' AS DateTime2), 4, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (134, N'Logitech MX Master 3', N'Premium build quality', 1219.83, 293, 3.3, CAST(N'2023-11-23T00:00:00.0000000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (135, N'Razer BlackShark V2', N'Premium build quality', 615.61, 18, 1.7, CAST(N'2024-09-10T00:00:00.0000000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (136, N'Sony WH-1000XM5', N'Premium build quality', 1335.97, 7, 3.8, CAST(N'2023-06-21T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (137, N'Razer BlackShark V2', N'Durable and reliable', 2920.93, 161, 2.3, CAST(N'2024-10-07T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (138, N'Razer BlackShark V2', N'Top-rated by users', 1282.97, 252, 2.9, CAST(N'2024-07-21T00:00:00.0000000' AS DateTime2), 3, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (139, N'Sony WH-1000XM5', N'Top-rated by users', 2393.2, 8, 4.9, CAST(N'2023-09-15T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (140, N'Lenovo Tab P12', N'Budget-friendly model', 1534.12, 275, 2.7, CAST(N'2023-08-15T00:00:00.0000000' AS DateTime2), 4, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (141, N'OnePlus 11', N'Budget-friendly model', 2761.74, 108, 4.4, CAST(N'2023-03-22T00:00:00.0000000' AS DateTime2), 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (142, N'MacBook Pro 16', N'High-performance device', 1530.97, 181, 3.3, CAST(N'2024-06-27T00:00:00.0000000' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (143, N'Asus ROG Strix', N'Compact and lightweight', 1224.79, 440, 2.4, CAST(N'2024-09-13T00:00:00.0000000' AS DateTime2), 2, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (144, N'iPad Pro 12.9', N'Premium build quality', 1716.75, 108, 1.3, CAST(N'2023-07-17T00:00:00.0000000' AS DateTime2), 4, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (145, N'Samsung Galaxy Tab S9', N'Budget-friendly model', 2865.94, 389, 2.4, CAST(N'2023-05-17T00:00:00.0000000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (146, N'Sony Bravia X90J', N'Premium build quality', 1260.87, 211, 4.8, CAST(N'2024-07-08T00:00:00.0000000' AS DateTime2), 5, 5)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (147, N'Razer BlackShark V2', N'Compact and lightweight', 1664.07, 125, 3.8, CAST(N'2023-12-02T00:00:00.0000000' AS DateTime2), 3, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (148, N'TCL 6-Series 55', N'Compact and lightweight', 754, 47, 1.7, CAST(N'2024-03-06T00:00:00.0000000' AS DateTime2), 5, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (149, N'Lenovo ThinkPad X1', N'High-performance device', 1775.27, 379, 1.6, CAST(N'2023-01-07T00:00:00.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Rating], [CreatedAt], [CategoryId], [BrandId]) VALUES (150, N'Xiaomi Pad 6', N'Compact and lightweight', 2488.21, 167, 4.5, CAST(N'2024-01-02T00:00:00.0000000' AS DateTime2), 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (1, N'New')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (2, N'Popular')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (3, N'Discount')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (4, N'Limited')
GO
INSERT [dbo].[Tags] ([Id], [Name]) VALUES (5, N'TopRated')
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
ALTER TABLE [dbo].[Product_tags]  WITH CHECK ADD  CONSTRAINT [FK_Product_tags_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Product_tags] CHECK CONSTRAINT [FK_Product_tags_Products]
GO
ALTER TABLE [dbo].[Product_tags]  WITH CHECK ADD  CONSTRAINT [FK_Product_tags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[Product_tags] CHECK CONSTRAINT [FK_Product_tags_Tags]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [demin_prat_15] SET  READ_WRITE 
GO
