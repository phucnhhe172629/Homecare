USE [master]
GO
/****** Object:  Database [HomeCare_EXE201]    Script Date: 25-Mar-25 18:27:01 ******/
CREATE DATABASE [HomeCare_EXE201]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HomeCare_EXE201', FILENAME = N'D:\rdsdbdata\DATA\HomeCare_EXE201.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HomeCare_EXE201_log', FILENAME = N'D:\rdsdbdata\DATA\HomeCare_EXE201_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HomeCare_EXE201] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HomeCare_EXE201].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HomeCare_EXE201] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET ARITHABORT OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HomeCare_EXE201] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HomeCare_EXE201] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HomeCare_EXE201] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HomeCare_EXE201] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET RECOVERY FULL 
GO
ALTER DATABASE [HomeCare_EXE201] SET  MULTI_USER 
GO
ALTER DATABASE [HomeCare_EXE201] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HomeCare_EXE201] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HomeCare_EXE201] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HomeCare_EXE201] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HomeCare_EXE201] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HomeCare_EXE201] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HomeCare_EXE201] SET QUERY_STORE = OFF
GO
USE [HomeCare_EXE201]
GO
/****** Object:  User [admin]    Script Date: 25-Mar-25 18:27:03 ******/
CREATE USER [admin] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cleanerId] [int] NULL,
	[customerId] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[date] [date] NULL,
	[status] [nvarchar](max) NULL,
	[totalPrice] [decimal](18, 2) NOT NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking_Services]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking_Services](
	[bookingId] [int] NOT NULL,
	[serviceId] [int] NOT NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC,
	[serviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookingId] [int] NOT NULL,
	[beforeImg] [nvarchar](max) NULL,
	[afterImg] [nvarchar](max) NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookingId] [int] NOT NULL,
	[status] [nvarchar](max) NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookingId] [int] NOT NULL,
	[content] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[image] [varbinary](max) NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[bookingId] [int] NOT NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[description] [nvarchar](max) NULL,
	[createAt] [datetime2](7) NOT NULL,
	[createBy] [nvarchar](max) NULL,
	[updateAt] [datetime2](7) NULL,
	[updateBy] [nvarchar](max) NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[street] [nvarchar](50) NULL,
	[city] [nvarchar](30) NULL,
	[province] [nvarchar](30) NULL,
	[country] [nvarchar](30) NULL,
	[status] [nvarchar](30) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 25-Mar-25 18:27:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (1, 3, 4, N'Ha Noi, 2345, hoai duc ha noi', CAST(N'2025-03-13' AS Date), N'Complete', CAST(200000.00 AS Decimal(18, 2)), CAST(N'2025-03-10T13:32:36.2063631' AS DateTime2), N'4', CAST(N'2025-03-10T13:32:36.2064221' AS DateTime2), N'4', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (3, 3, 5, N'Hà Nội, Hà Nội, trọ Hà Thành, Bình Yên, Thạch Thất', CAST(N'2025-03-12' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-10T14:09:28.8523104' AS DateTime2), N'5', CAST(N'2025-03-10T14:09:28.8523142' AS DateTime2), N'5', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (4, NULL, 10, N'Hà Nội, Hà Nội, Thôn 2, Thạch Thất Hòa, Thạch Thất', CAST(N'2025-03-15' AS Date), N'Complete', CAST(150000.00 AS Decimal(18, 2)), CAST(N'2025-03-11T01:05:47.8513144' AS DateTime2), N'10', CAST(N'2025-03-11T01:05:47.8514004' AS DateTime2), N'10', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (5, NULL, 11, N'Hà Nội, Hà Nội, ngõ 2 Cây xăng 39, xã Thạch Hòa, Huyện Thạch Thất', CAST(N'2025-03-14' AS Date), N'Complete', CAST(150000.00 AS Decimal(18, 2)), CAST(N'2025-03-11T08:43:38.8386158' AS DateTime2), N'11', CAST(N'2025-03-11T08:43:38.8386190' AS DateTime2), N'11', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (6, NULL, 15, N'Hà Nội, Hà Nội, Ngách 30, ngõ 198, QL21A, Th?ch Th?t', CAST(N'2025-03-14' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-14T02:03:19.8605007' AS DateTime2), N'15', CAST(N'2025-03-14T02:03:19.8606147' AS DateTime2), N'15', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (7, NULL, 14, N'Hà N?i, Hà N?i, Xóm Ð?i Xuân, Bình Yên, Th?ch Th?t, Hà N?i', CAST(N'2025-03-15' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-14T02:05:37.8100203' AS DateTime2), N'14', CAST(N'2025-03-14T02:05:37.8100240' AS DateTime2), N'14', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (8, NULL, 16, N'Hà N?i, Hà N?i, Ngách 30, ngõ 198, QL21A, Th?ch Th?t', CAST(N'2025-03-15' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-14T07:09:35.2714396' AS DateTime2), N'16', CAST(N'2025-03-14T07:09:35.2715351' AS DateTime2), N'16', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (9, NULL, 17, N'Hà N?i, Hà N?i, thôn Ðoàn K?t, xã C? Ðông, Huy?n Th?ch Th?t', CAST(N'2025-03-15' AS Date), N'Complete', CAST(240000.00 AS Decimal(18, 2)), CAST(N'2025-03-14T14:30:55.9217416' AS DateTime2), N'17', CAST(N'2025-03-14T14:30:55.9218406' AS DateTime2), N'17', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (10, NULL, 18, N'Hà Nội, Hà Nội, 250 bùi xương trạch, khương đình, thanh xuân', CAST(N'2025-03-15' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-14T14:55:20.8796822' AS DateTime2), N'18', CAST(N'2025-03-14T14:55:20.8797860' AS DateTime2), N'18', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (11, NULL, 4, N'Ha Noi, 2345, hoai duc ha noi', CAST(N'2025-03-19' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-15T07:35:18.0441476' AS DateTime2), N'4', CAST(N'2025-03-15T07:35:18.0442391' AS DateTime2), N'4', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (12, NULL, 20, N'Hà Nội, Hà Nội, Trọ Thành Nam 1, cây xăng 39, thôn 3 Thạch Hoà', CAST(N'2025-03-15' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-15T10:04:41.2429952' AS DateTime2), N'20', CAST(N'2025-03-15T10:04:41.2430844' AS DateTime2), N'20', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (14, NULL, 21, N'Hà Nội, Hà Nội, Tr? Hà Truong, Tân Xã, Th?ch Th?t', CAST(N'2025-03-15' AS Date), N'Complete', CAST(240000.00 AS Decimal(18, 2)), CAST(N'2025-03-15T10:31:41.2956017' AS DateTime2), N'21', CAST(N'2025-03-15T10:31:41.2956079' AS DateTime2), N'21', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (17, NULL, 24, N'Hà Nội, Hà Nội, Trọ Tâm Lê Thạch Hòa Thạch Thất', CAST(N'2025-03-18' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-16T10:00:41.8201354' AS DateTime2), N'24', CAST(N'2025-03-16T10:00:41.8201372' AS DateTime2), N'24', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (18, NULL, 23, N'Hà Nội, Hà Nội, HomeSweetHome 24 thôn 2 Kim Bông, Tân Xã', CAST(N'2025-03-16' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-16T10:02:33.4405428' AS DateTime2), N'23', CAST(N'2025-03-16T10:02:33.4405445' AS DateTime2), N'23', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (19, NULL, 25, N'Hà Nội, Hà Nội, Nhà Trọ Tuyết, 2HC2+3HP, Tân Xá, Thạch Thất', CAST(N'2025-03-14' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-14T10:06:07.3994870' AS DateTime2), N'25', CAST(N'2025-03-14T10:06:07.3994893' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (23, NULL, 26, N'Hà Nội, Hà Nội, Trọ Nhật Anh, Kim Bông, Tân Xã, Thạch Thất', CAST(N'2025-03-17' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-16T13:37:29.1249377' AS DateTime2), N'26', CAST(N'2025-03-16T13:37:29.1249389' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (25, NULL, 27, N'Hà Nội, Hà Nội, Tuấn Cường 1, Thạch Hoà, Thạch Thất, Hà Nội', CAST(N'2025-03-17' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-17T02:03:43.7797301' AS DateTime2), N'27', CAST(N'2025-03-17T02:03:43.7797355' AS DateTime2), N'27', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (26, NULL, 28, N'Hà Nội, Hà Nội, Hoàng Anh, Thạch Hoà, Thạch Thất', CAST(N'2025-03-17' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-17T02:24:38.7118523' AS DateTime2), N'28', CAST(N'2025-03-17T02:24:38.7118545' AS DateTime2), N'28', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (28, NULL, 25, N'Hà Nội, Hà Nội, Nhà Trọ Tuyết, 2HC2+3HP, Tân Xá, Thạch Thất', CAST(N'2025-03-28' AS Date), N'Pending', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-17T08:41:22.2010163' AS DateTime2), N'25', CAST(N'2025-03-17T08:41:22.2010182' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (29, NULL, 30, N'Hà Nội, Hà Nội, Cát Quế, Hoài Đức, Hà Nội', CAST(N'2025-03-15' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-15T14:01:31.8372671' AS DateTime2), N'30', CAST(N'2025-03-15T14:01:31.8372686' AS DateTime2), N'30', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (30, NULL, 31, N'Hà Nội, Hà Nội, Cát Quế, Hoài Đức, Hà Nội', CAST(N'2025-03-13' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-13T14:03:29.4111191' AS DateTime2), N'31', CAST(N'2025-03-13T14:03:29.4111207' AS DateTime2), N'31', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (31, NULL, 32, N'Hà Nội, Hà Nội, 288, cụm 4, thôn 3, Thach Hoà, Thạch Thất', CAST(N'2025-03-11' AS Date), N'Complete', CAST(150000.00 AS Decimal(18, 2)), CAST(N'2025-03-11T14:07:30.4683265' AS DateTime2), N'32', CAST(N'2025-03-11T14:07:30.4684166' AS DateTime2), N'32', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (32, NULL, 33, N'Hà Nội, Hà Nội, 288, cụm 4, thôn 3, Thach Hoà, Thạch Thất', CAST(N'2025-03-13' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-13T14:11:34.4873386' AS DateTime2), N'33', CAST(N'2025-03-01T14:11:34.4873431' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (33, NULL, 34, N'Hà Nội, Hà Nội, 179e, Trương Định', CAST(N'2025-03-15' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-15T14:13:16.5662636' AS DateTime2), N'34', CAST(N'2025-03-15T14:13:16.5662650' AS DateTime2), N'34', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (34, NULL, 33, N'Hà Nội, Hà Nội, 288, cụm 4, thôn 3, Thach Hoà, Thạch Thất', CAST(N'2025-03-16' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-16T14:14:16.7669249' AS DateTime2), N'33', CAST(N'2025-03-16T14:14:16.7669261' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (35, NULL, 35, N' Hà Nội ,  Hà Nội , Sunhome, Thạch Hoà, Thạch Thất', CAST(N'2025-03-17' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-17T14:15:45.3422096' AS DateTime2), N'35', CAST(N'2025-03-17T14:15:45.3422114' AS DateTime2), N'35', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (36, NULL, 37, N'Hà Nội , Hà Nội , Hoàng Anh, Thạch Hoà, Thạch Thất, Hà Nội ', CAST(N'2025-03-17' AS Date), N'Complete', CAST(210000.00 AS Decimal(18, 2)), CAST(N'2025-03-17T14:24:54.3760177' AS DateTime2), N'37', CAST(N'2025-03-17T14:24:54.3760192' AS DateTime2), N'37', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (37, NULL, 36, N'Hà Nội, Hà Nội, Cát Quế, Hoài Đức, Hà Nội', CAST(N'2025-03-17' AS Date), N'Complete', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-17T14:25:23.1868288' AS DateTime2), N'36', CAST(N'2025-03-17T14:25:23.1868302' AS DateTime2), N'36', 0)
GO
INSERT [dbo].[Booking] ([id], [cleanerId], [customerId], [address], [date], [status], [totalPrice], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (38, NULL, 38, N'Hà Nội, Hà Nội, Thôn 4 Thạch Thất', CAST(N'2025-03-25' AS Date), N'Pending', CAST(180000.00 AS Decimal(18, 2)), CAST(N'2025-03-25T02:30:10.8532038' AS DateTime2), N'38', CAST(N'2025-03-25T02:30:10.8533016' AS DateTime2), N'38', 0)
GO
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (1, 1, CAST(N'2025-03-10T13:32:37.6611966' AS DateTime2), N'1', CAST(N'2025-03-10T13:32:37.6612488' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (3, 3, CAST(N'2025-03-10T14:09:29.8525960' AS DateTime2), N'1', CAST(N'2025-03-10T14:09:29.8525989' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (4, 4, CAST(N'2025-03-11T01:05:49.1108402' AS DateTime2), N'10', CAST(N'2025-03-11T01:05:49.1109200' AS DateTime2), N'10', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (5, 5, CAST(N'2025-03-11T08:43:39.8465140' AS DateTime2), N'11', CAST(N'2025-03-11T08:43:39.8465169' AS DateTime2), N'11', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (6, 7, CAST(N'2025-03-14T02:03:21.1593004' AS DateTime2), N'15', CAST(N'2025-03-14T02:03:21.1593789' AS DateTime2), N'15', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (7, 8, CAST(N'2025-03-14T02:05:38.7246030' AS DateTime2), N'14', CAST(N'2025-03-14T02:05:38.7246207' AS DateTime2), N'14', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (8, 9, CAST(N'2025-03-14T07:09:37.2661689' AS DateTime2), N'16', CAST(N'2025-03-14T07:09:37.2662501' AS DateTime2), N'16', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (9, 10, CAST(N'2025-03-14T14:30:57.3391956' AS DateTime2), N'17', CAST(N'2025-03-14T14:30:57.3392759' AS DateTime2), N'17', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (10, 11, CAST(N'2025-03-14T14:55:22.2653002' AS DateTime2), N'18', CAST(N'2025-03-14T14:55:22.2653852' AS DateTime2), N'18', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (11, 12, CAST(N'2025-03-15T07:35:20.0841309' AS DateTime2), N'4', CAST(N'2025-03-15T07:35:20.0842121' AS DateTime2), N'4', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (12, 13, CAST(N'2025-03-15T10:04:43.2132069' AS DateTime2), N'20', CAST(N'2025-03-15T10:04:43.2132963' AS DateTime2), N'20', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (14, 15, CAST(N'2025-03-15T10:31:42.2058406' AS DateTime2), N'21', CAST(N'2025-03-15T10:31:42.2058419' AS DateTime2), N'21', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (17, 18, CAST(N'2025-03-16T10:00:42.7792901' AS DateTime2), N'24', CAST(N'2025-03-16T10:00:42.7792913' AS DateTime2), N'24', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (18, 19, CAST(N'2025-03-16T10:02:34.3967867' AS DateTime2), N'23', CAST(N'2025-03-16T10:02:34.3967890' AS DateTime2), N'23', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (19, 20, CAST(N'2025-03-16T10:06:08.3477534' AS DateTime2), N'25', CAST(N'2025-03-16T10:06:08.3477554' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (23, 24, CAST(N'2025-03-16T13:37:30.0758488' AS DateTime2), N'26', CAST(N'2025-03-16T13:37:30.0758500' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (25, 26, CAST(N'2025-03-17T02:03:44.7701710' AS DateTime2), N'27', CAST(N'2025-03-17T02:03:44.7701725' AS DateTime2), N'27', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (26, 27, CAST(N'2025-03-17T02:24:39.6591343' AS DateTime2), N'28', CAST(N'2025-03-17T02:24:39.6591358' AS DateTime2), N'28', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (28, 29, CAST(N'2025-03-17T08:41:23.2364162' AS DateTime2), N'25', CAST(N'2025-03-17T08:41:23.2364184' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (29, 30, CAST(N'2025-03-17T14:01:32.8085913' AS DateTime2), N'30', CAST(N'2025-03-17T14:01:32.8085930' AS DateTime2), N'30', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (30, 31, CAST(N'2025-03-17T14:03:30.3512346' AS DateTime2), N'31', CAST(N'2025-03-17T14:03:30.3512358' AS DateTime2), N'31', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (31, 32, CAST(N'2025-03-17T14:07:31.9455349' AS DateTime2), N'32', CAST(N'2025-03-17T14:07:31.9456173' AS DateTime2), N'32', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (32, 33, CAST(N'2025-03-17T14:11:35.4153662' AS DateTime2), N'33', CAST(N'2025-03-17T14:11:35.4153700' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (33, 34, CAST(N'2025-03-17T14:13:17.4872777' AS DateTime2), N'34', CAST(N'2025-03-17T14:13:17.4872788' AS DateTime2), N'34', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (34, 35, CAST(N'2025-03-17T14:14:17.6808100' AS DateTime2), N'33', CAST(N'2025-03-17T14:14:17.6808116' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (35, 36, CAST(N'2025-03-17T14:15:46.2755980' AS DateTime2), N'35', CAST(N'2025-03-17T14:15:46.2755990' AS DateTime2), N'35', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (36, 37, CAST(N'2025-03-17T14:24:55.3174002' AS DateTime2), N'37', CAST(N'2025-03-17T14:24:55.3174013' AS DateTime2), N'37', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (37, 38, CAST(N'2025-03-17T14:25:24.0982912' AS DateTime2), N'36', CAST(N'2025-03-17T14:25:24.0982924' AS DateTime2), N'36', 0)
GO
INSERT [dbo].[Booking_Services] ([bookingId], [serviceId], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (38, 39, CAST(N'2025-03-25T02:30:12.1599228' AS DateTime2), N'38', CAST(N'2025-03-25T02:30:12.1600031' AS DateTime2), N'38', 0)
GO
SET IDENTITY_INSERT [dbo].[BookingDetail] ON 
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (1, 1, NULL, NULL, CAST(N'2025-03-10T13:32:36.6970661' AS DateTime2), N'1', CAST(N'2025-03-10T13:32:36.7038852' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (3, 3, NULL, NULL, CAST(N'2025-03-10T14:09:29.1297447' AS DateTime2), N'1', CAST(N'2025-03-10T14:09:29.1297477' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (4, 4, NULL, NULL, CAST(N'2025-03-11T01:05:48.1968155' AS DateTime2), N'10', CAST(N'2025-03-11T01:05:48.1968977' AS DateTime2), N'10', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (5, 5, NULL, NULL, CAST(N'2025-03-11T08:43:39.1028343' AS DateTime2), N'11', CAST(N'2025-03-11T08:43:39.1028385' AS DateTime2), N'11', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (6, 6, NULL, NULL, CAST(N'2025-03-14T02:03:20.2299632' AS DateTime2), N'15', CAST(N'2025-03-14T02:03:20.2300452' AS DateTime2), N'15', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (7, 7, NULL, NULL, CAST(N'2025-03-14T02:05:38.0489362' AS DateTime2), N'14', CAST(N'2025-03-14T02:05:38.0489404' AS DateTime2), N'14', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (8, 8, NULL, NULL, CAST(N'2025-03-14T07:09:35.8063353' AS DateTime2), N'16', CAST(N'2025-03-14T07:09:35.8064174' AS DateTime2), N'16', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (9, 9, NULL, NULL, CAST(N'2025-03-14T14:30:56.4236568' AS DateTime2), N'17', CAST(N'2025-03-14T14:30:56.4237526' AS DateTime2), N'17', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (10, 10, NULL, NULL, CAST(N'2025-03-14T14:55:21.3436307' AS DateTime2), N'18', CAST(N'2025-03-14T14:55:21.3437131' AS DateTime2), N'18', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (11, 11, NULL, NULL, CAST(N'2025-03-15T07:35:19.1275881' AS DateTime2), N'4', CAST(N'2025-03-15T07:35:19.1276831' AS DateTime2), N'4', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (12, 12, NULL, NULL, CAST(N'2025-03-15T10:04:42.2767201' AS DateTime2), N'20', CAST(N'2025-03-15T10:04:42.2767943' AS DateTime2), N'20', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (14, 14, NULL, NULL, CAST(N'2025-03-15T10:31:41.5291954' AS DateTime2), N'21', CAST(N'2025-03-15T10:31:41.5291974' AS DateTime2), N'21', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (17, 17, NULL, NULL, CAST(N'2025-03-16T10:00:42.0673699' AS DateTime2), N'24', CAST(N'2025-03-16T10:00:42.0673710' AS DateTime2), N'24', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (18, 18, NULL, NULL, CAST(N'2025-03-16T10:02:33.6823141' AS DateTime2), N'23', CAST(N'2025-03-16T10:02:33.6823153' AS DateTime2), N'23', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (19, 19, NULL, NULL, CAST(N'2025-03-16T10:06:07.6446689' AS DateTime2), N'25', CAST(N'2025-03-16T10:06:07.6446705' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (23, 23, NULL, NULL, CAST(N'2025-03-16T13:37:29.3651147' AS DateTime2), N'26', CAST(N'2025-03-16T13:37:29.3651157' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (25, 25, NULL, NULL, CAST(N'2025-03-17T02:03:44.0430814' AS DateTime2), N'27', CAST(N'2025-03-17T02:03:44.0430827' AS DateTime2), N'27', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (26, 26, NULL, NULL, CAST(N'2025-03-17T02:24:38.9592461' AS DateTime2), N'28', CAST(N'2025-03-17T02:24:38.9592473' AS DateTime2), N'28', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (28, 28, NULL, NULL, CAST(N'2025-03-17T08:41:22.5082835' AS DateTime2), N'25', CAST(N'2025-03-17T08:41:22.5082847' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (29, 29, NULL, NULL, CAST(N'2025-03-17T14:01:32.0856433' AS DateTime2), N'30', CAST(N'2025-03-17T14:01:32.0856443' AS DateTime2), N'30', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (30, 30, NULL, NULL, CAST(N'2025-03-17T14:03:29.6512479' AS DateTime2), N'31', CAST(N'2025-03-17T14:03:29.6512494' AS DateTime2), N'31', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (31, 31, NULL, NULL, CAST(N'2025-03-17T14:07:30.9782969' AS DateTime2), N'32', CAST(N'2025-03-17T14:07:30.9783790' AS DateTime2), N'32', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (32, 32, NULL, NULL, CAST(N'2025-03-17T14:11:34.7186731' AS DateTime2), N'33', CAST(N'2025-03-17T14:11:34.7186772' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (33, 33, NULL, NULL, CAST(N'2025-03-17T14:13:16.8013733' AS DateTime2), N'34', CAST(N'2025-03-17T14:13:16.8013747' AS DateTime2), N'34', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (34, 34, NULL, NULL, CAST(N'2025-03-17T14:14:16.9962975' AS DateTime2), N'33', CAST(N'2025-03-17T14:14:16.9962991' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (35, 35, NULL, NULL, CAST(N'2025-03-17T14:15:45.5937992' AS DateTime2), N'35', CAST(N'2025-03-17T14:15:45.5938010' AS DateTime2), N'35', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (36, 36, NULL, NULL, CAST(N'2025-03-17T14:24:54.6113539' AS DateTime2), N'37', CAST(N'2025-03-17T14:24:54.6113550' AS DateTime2), N'37', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (37, 37, NULL, NULL, CAST(N'2025-03-17T14:25:23.4181256' AS DateTime2), N'36', CAST(N'2025-03-17T14:25:23.4181272' AS DateTime2), N'36', 0)
GO
INSERT [dbo].[BookingDetail] ([id], [bookingId], [beforeImg], [afterImg], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (38, 38, NULL, NULL, CAST(N'2025-03-25T02:30:11.2232555' AS DateTime2), N'38', CAST(N'2025-03-25T02:30:11.2233374' AS DateTime2), N'38', 0)
GO
SET IDENTITY_INSERT [dbo].[BookingDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'Customer', N'CUSTOMER', NULL)
GO
INSERT [dbo].[Roles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'Cleaner', N'CLEANER', NULL)
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (1, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Ủi đồ', CAST(N'2025-03-10T13:32:36.7474090' AS DateTime2), N'1', CAST(N'2025-03-10T13:32:36.7474565' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (2, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-10T14:07:31.1737185' AS DateTime2), N'1', CAST(N'2025-03-10T14:07:31.1737210' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (3, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-10T14:09:29.1299091' AS DateTime2), N'1', CAST(N'2025-03-10T14:09:29.1299098' AS DateTime2), N'1', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (4, N'Dọn theo giờ', CAST(150000.00 AS Decimal(18, 2)), N'2 giờ - ', CAST(N'2025-03-11T01:05:48.2549150' AS DateTime2), N'10', CAST(N'2025-03-11T01:05:48.2549884' AS DateTime2), N'10', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (5, N'Dọn theo giờ', CAST(150000.00 AS Decimal(18, 2)), N'2 giờ - ', CAST(N'2025-03-11T08:43:39.1031374' AS DateTime2), N'11', CAST(N'2025-03-11T08:43:39.1031382' AS DateTime2), N'11', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (6, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-12T14:11:50.4178098' AS DateTime2), N'5', CAST(N'2025-03-12T14:11:50.4178562' AS DateTime2), N'5', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (7, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-14T02:03:20.2893101' AS DateTime2), N'15', CAST(N'2025-03-14T02:03:20.2893833' AS DateTime2), N'15', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (8, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-14T02:05:38.0491220' AS DateTime2), N'14', CAST(N'2025-03-14T02:05:38.0491226' AS DateTime2), N'14', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (9, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-14T07:09:35.8579865' AS DateTime2), N'16', CAST(N'2025-03-14T07:09:35.8580586' AS DateTime2), N'16', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (10, N'Dọn theo giờ', CAST(240000.00 AS Decimal(18, 2)), N'4 giờ - Hương liệu', CAST(N'2025-03-14T14:30:56.4833323' AS DateTime2), N'17', CAST(N'2025-03-14T14:30:56.4834037' AS DateTime2), N'17', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (11, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-14T14:55:21.3945660' AS DateTime2), N'18', CAST(N'2025-03-14T14:55:21.3946390' AS DateTime2), N'18', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (12, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-15T07:35:19.1962914' AS DateTime2), N'4', CAST(N'2025-03-15T07:35:19.1963683' AS DateTime2), N'4', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (13, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-15T10:04:42.3378136' AS DateTime2), N'20', CAST(N'2025-03-15T10:04:42.3378870' AS DateTime2), N'20', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (14, N'Dọn theo giờ', CAST(240000.00 AS Decimal(18, 2)), N'3 giờ - Ủi đồ,Hương liệu', CAST(N'2025-03-15T10:30:54.3656822' AS DateTime2), N'21', CAST(N'2025-03-15T10:30:54.3656840' AS DateTime2), N'21', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (15, N'Dọn theo giờ', CAST(240000.00 AS Decimal(18, 2)), N'3 giờ - Ủi đồ,Hương liệu', CAST(N'2025-03-15T10:31:41.5293565' AS DateTime2), N'21', CAST(N'2025-03-15T10:31:41.5293570' AS DateTime2), N'21', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (16, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'2 giờ - Ủi đồ,Hương liệu', CAST(N'2025-03-16T09:45:13.3235593' AS DateTime2), N'22', CAST(N'2025-03-16T09:45:13.3236418' AS DateTime2), N'22', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (17, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'2 giờ - Ủi đồ,Hương liệu', CAST(N'2025-03-16T09:57:27.1979943' AS DateTime2), N'22', CAST(N'2025-03-16T09:57:27.1979950' AS DateTime2), N'22', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (18, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-16T10:00:42.0675111' AS DateTime2), N'24', CAST(N'2025-03-16T10:00:42.0675116' AS DateTime2), N'24', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (19, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-16T10:02:33.6824535' AS DateTime2), N'23', CAST(N'2025-03-16T10:02:33.6824540' AS DateTime2), N'23', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (20, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-16T10:06:07.6447971' AS DateTime2), N'25', CAST(N'2025-03-16T10:06:07.6447976' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (21, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-16T13:35:42.3188355' AS DateTime2), N'26', CAST(N'2025-03-16T13:35:42.3189093' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (22, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-16T13:35:43.8422690' AS DateTime2), N'26', CAST(N'2025-03-16T13:35:43.8422696' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (23, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-16T13:35:44.6240164' AS DateTime2), N'26', CAST(N'2025-03-16T13:35:44.6240170' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (24, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-16T13:37:29.3653005' AS DateTime2), N'26', CAST(N'2025-03-16T13:37:29.3653010' AS DateTime2), N'26', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (25, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-16T17:44:28.1979119' AS DateTime2), N'22', CAST(N'2025-03-16T17:44:28.1979131' AS DateTime2), N'22', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (26, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-17T02:03:44.0440582' AS DateTime2), N'27', CAST(N'2025-03-17T02:03:44.0440598' AS DateTime2), N'27', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (27, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-17T02:24:38.9608563' AS DateTime2), N'28', CAST(N'2025-03-17T02:24:38.9608573' AS DateTime2), N'28', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (28, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T02:31:05.5347810' AS DateTime2), N'29', CAST(N'2025-03-17T02:31:05.5347820' AS DateTime2), N'29', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (29, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T08:41:22.5090550' AS DateTime2), N'25', CAST(N'2025-03-17T08:41:22.5090561' AS DateTime2), N'25', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (30, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T14:01:32.0865614' AS DateTime2), N'30', CAST(N'2025-03-17T14:01:32.0865624' AS DateTime2), N'30', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (31, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T14:03:29.6513764' AS DateTime2), N'31', CAST(N'2025-03-17T14:03:29.6513769' AS DateTime2), N'31', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (32, N'Dọn theo giờ', CAST(150000.00 AS Decimal(18, 2)), N'2 giờ - ', CAST(N'2025-03-17T14:07:31.0297902' AS DateTime2), N'32', CAST(N'2025-03-17T14:07:31.0298644' AS DateTime2), N'32', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (33, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T14:11:34.7188232' AS DateTime2), N'33', CAST(N'2025-03-17T14:11:34.7188239' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (34, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'2 giờ - Ủi đồ,Hương liệu', CAST(N'2025-03-17T14:13:16.8015086' AS DateTime2), N'34', CAST(N'2025-03-17T14:13:16.8015090' AS DateTime2), N'34', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (35, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T14:14:16.9964451' AS DateTime2), N'33', CAST(N'2025-03-17T14:14:16.9964455' AS DateTime2), N'33', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (36, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T14:15:45.5939178' AS DateTime2), N'35', CAST(N'2025-03-17T14:15:45.5939181' AS DateTime2), N'35', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (37, N'Dọn theo giờ', CAST(210000.00 AS Decimal(18, 2)), N'3 giờ - Hương liệu', CAST(N'2025-03-17T14:24:54.6114876' AS DateTime2), N'37', CAST(N'2025-03-17T14:24:54.6114879' AS DateTime2), N'37', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (38, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-17T14:25:23.4182412' AS DateTime2), N'36', CAST(N'2025-03-17T14:25:23.4182415' AS DateTime2), N'36', 0)
GO
INSERT [dbo].[Services] ([id], [name], [price], [description], [createAt], [createBy], [updateAt], [updateBy], [isDeleted]) VALUES (39, N'Dọn theo giờ', CAST(180000.00 AS Decimal(18, 2)), N'2 giờ - Hương liệu', CAST(N'2025-03-25T02:30:11.2829758' AS DateTime2), N'38', CAST(N'2025-03-25T02:30:11.2830484' AS DateTime2), N'38', 0)
GO
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'John', N'Doe', N'123 Main St', N'Hanoi', N'Hanoi', N'Vietnam', N'Active', N'john.doe', N'JOHN.DOE', N'john.doe@gmail.com', N'JOHN.DOE@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEF4F9Z...', N'FRVV6EZ3VIFNXZ6JTYVX...', N'0f9dfb6d-ecae-4cd4-bb81...', N'0123456789', 1, 0, NULL, 0, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'Jane', N'Doe', N'456 Elm St', N'HCM', N'HCM', N'Vietnam', N'Active', N'jane.doe', N'JANE.DOE', N'jane.doe@gmail.com', N'JANE.DOE@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEEIZU0aJLnH3nRc+HcTuov3N9kKZxJo3lkKu0a4Q7Nmbi5CfgwDFBRCZOg3zJLkCFQ==', N'O7OC2ML3TRXUDG25CLD5KNYUUJBIAFLB', N'2cd2ed2a-fd89-4440-ac3b-333c6ac51858', N'0987654321', 1, 0, NULL, 0, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (4, N'Nguyen', N'Kiet', N'hoai duc ha noi', N'Ha Noi', N'2345', NULL, NULL, N'nvutuankiet2003@gmail.com', N'NVUTUANKIET2003@GMAIL.COM', N'nvutuankiet2003@gmail.com', N'NVUTUANKIET2003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJwJOG23CfAivpQbbMALh2Y9JIA1GwIaeKJm9/gUeg7R2so/yQvH5yUBQ/7Hj+9cUg==', N'RALBHYXD5A7B47UY3D5ZTP6L6YD5KP6Y', N'44b2d2b9-b803-4b48-9c6a-82f8948b3fe3', N'0326713614', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (5, N'Phạm', N'Đạt', N'tr? Hà Thành, Bình Yên, Th?ch Th?t', N'Hà N?i', N'Hà N?i', NULL, NULL, N'Datpq8@gmail.com', N'DATPQ8@GMAIL.COM', N'Datpq8@gmail.com', N'DATPQ8@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMDp5j0LBT78NtH8SLd2lIICvaDJeaa8gYhWn4kCgQJPFGcuCZEArw0CEUNbJdaeEA==', N'ORFPDMNG5S5LPQYS76LAYD4UD6BIYNZR', N'ef40f8e9-c699-4d2e-9f8c-04b0500d8791', N'0857138734', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (6, N'Nguyễn Tiến ', N'Hưng', N'288, cụm 4, thôn 3, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'hungdbn040903@gmail.com', N'HUNGDBN040903@GMAIL.COM', N'hungdbn040903@gmail.com', N'HUNGDBN040903@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPvhr7uvk5F7TKLqprP0a68puYfKwrIT5Grr9TeQ9JQQJjo0vN5E93DNfCjvjj+gBw==', N'7ESNP7V3VVGJ5FHYU4ASPFUOZOI65YUQ', N'ab7a57bf-bce7-4d98-8853-df7318c172bd', N'0813755786', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (7, N'Hoàng', N'Tâm', N'Ngách 30, ngõ 198, QL21A, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'hoangtam4a509@gmail.com', N'HOANGTAM4A509@GMAIL.COM', N'hoangtam4a509@gmail.com', N'HOANGTAM4A509@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEP+JcyH3OIGTQP3qCVH/xaQFvnKUMhv4Kvm4lmFZc3gaPJnv3CG6wUvSRg/X75r0TA==', N'YKFVJLIG55QR32G4HLUAVKJBIE3VDOPK', N'00d48bf7-1a31-464e-ac4b-e105fbcdaa7a', N'0853641509', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (8, N'Nguyễn', N'Phúc', N'Ðồng Tiến - Khoái Châu', N'Hung Yên', N'Hung Yên', NULL, NULL, N'Phuc021203@gmail.com', N'PHUC021203@GMAIL.COM', N'Phuc021203@gmail.com', N'PHUC021203@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMRHYSW3bc7ts1Tm1jQr3gE8z1SMJb2vFj8er0U3hHCEp4xB2NLixWrSIaAjWiwJzg==', N'5QM775OA5GUPEMXW2SG24RNCCEQROMUF', N'63a9fac9-d5a0-4605-b2ee-334f48e7ac3d', N'0966393025', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Admin88@homecare.com', N'ADMIN88@HOMECARE.COM', N'Admin88@homecare.com', N'ADMIN88@HOMECARE.COM', 0, N'AQAAAAIAAYagAAAAELZsZamDTp8e2C8j5rE29cv2bKmtlth8RzgVCpNkJ3Ax3sK3ayaPcmy569C7m0U+Mw==', N'Q4PIPJT6B6NWBXIWCBHT6XGGSOIAZHMS', N'6d2a2da3-d38d-4035-8a6d-8e1ac4cb94bc', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (10, N'Đỗ', N'Minh', N'Thôn 2, Thạch Hòa, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'doquangminh2003@gmail.com', N'DOQUANGMINH2003@GMAIL.COM', N'doquangminh2003@gmail.com', N'DOQUANGMINH2003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBre9fTSTvlGi0cSFvg5pACnGvBVtnO1GEtp+WBWlwdQuoqJobgNX8h6AMW7OMzcBA==', N'7JP662E7RWFTUEXMRRPEANZKSUDHMPKC', N'c322358d-94f8-4b54-ae8c-98500b2e41e2', N'0354416029', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (11, N'Lê', N'Khải', N'ngõ 2 Cây xăng 39, xã Thạch Hòa, Huyện Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'lquankhai11@gmail.com', N'LQUANKHAI11@GMAIL.COM', N'lquankhai11@gmail.com', N'LQUANKHAI11@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBlREaXMNGBkN22P+XxeleiH6wtsQ848O1QrJux9c+aJR5CZYVf5xfH0xiBrGwDmzQ==', N'2B5MXU7RMTXQ6HLXC2UBZOUBL3UQECM7', N'76c32f32-7557-45e6-9b56-bd63fddb5281', N'0389466556', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'dinhsontung153153@gmail.com', N'DINHSONTUNG153153@GMAIL.COM', N'dinhsontung153153@gmail.com', N'DINHSONTUNG153153@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEFNRJmm3Hf6x4iRNm6onOpM1Z1q9B6yqmi7myyzZcBp7/M5NnHJ1tiMro4pxOEoPRg==', N'LGG7CZRA7RV4Y3LIYDDG3R5SLS6J6QYD', N'745dc1bb-aab0-4091-87e0-c3e0182bad8b', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (13, N'Hoàng', N'Duy Vũ', N'Ngõ 10, Bình Yên, Thạch Thất, Hà Nội', N'Hà Nội', N'Hà Nội', NULL, NULL, N'vuhd@gmail.com', N'VUHD@GMAIL.COM', N'vuhd@gmail.com', N'VUHD@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECbpmd3SEZwEXLvEC2OxV845t/J7768tbZSoVVagZ/sLmv+3nuotLEVCpxWJBOqy4Q==', N'PXWXJYU22QJCFYWPUFPBCLH2R36PRDKD', N'cfa4b3eb-9f76-4647-9f56-451c2c153c0d', N'0354416029', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (14, N'Nguyễn Xuân ', N'Thắng', N'Xóm Ð?i Xuân, Bình Yên, Th?ch Th?t, Hà N?i', N'Hà Nội', N'Hà Nội', NULL, NULL, N'thangnx@gmail.com', N'THANGNX@GMAIL.COM', N'thangnx@gmail.com', N'THANGNX@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEMEM0HsNt3sinFNWjo9Tp+O/OmO60VYskzrrpEhMKaqnVwwfytc5kOEKFsLjp2fDCw==', N'XD2SV7BP46TVWGH5GNTQJPEKZ5K5PN2S', N'24a2338b-9527-49d4-8094-2fd59412a635', N'0389216298', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (15, N'Hoàng', N'Vũ', N'Ngõ 10, Bình Yên, Th?ch Th?t, Hà N?i', N'Hà Nội', N'Hà Nội', NULL, NULL, N'vuhd2@gmail.com', N'VUHD2@GMAIL.COM', N'vuhd2@gmail.com', N'VUHD2@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPQSYcIo8z+5GYlzTuYLsiHm8CEXvXM1mflbyqNbhWEX4HwCwp1ZUixlXs8P95d3Ew==', N'UX722LDBUDCGNKB6MI5AV675LSJ5NUCT', N'eee6f644-2326-4d80-95b6-d5461b8df163', N'0354416029', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (16, N'Hoàng', N'Thanh Tâm', N'Ngách 30, ngõ 198, QL21A, Th?ch Th?t', N'Hà Nội', N'Hà Nội', NULL, NULL, N'hoangtam4a5@gmail.com', N'HOANGTAM4A5@GMAIL.COM', N'hoangtam4a5@gmail.com', N'HOANGTAM4A5@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEE1zxKTBtVwP+3ziTXV1CJn/HV5n28Cs2VbcLQzNlbS29A0639He2/Tv33sjd2jonw==', N'JX3V7MIGNXEVAP2ALTQR5LY77TYBZI2H', N'928dfe30-6b44-4de7-8e9b-cd96ebbc536a', N'0853641509', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (17, N'Lê', N'Tiến', N'thôn Ðoàn K?t, xã C? Ðông, Huy?n Th?ch Th?t', N'Hà N?i', N'Hà N?i', NULL, NULL, N'quaithugaoru@gmail.com', N'QUAITHUGAORU@GMAIL.COM', N'quaithugaoru@gmail.com', N'QUAITHUGAORU@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDskMAUCQeIwrDwxuSPB1P3hhLuG6gLBxVHtP/Y1fc6FjDKm15xYxw+C2QLxETcG3A==', N'ECJT7FJ5HHGJUHLJXPHDPEYOL2LKZH4G', N'd66f0c3d-1f1c-4cc9-8a4f-64043c0e81c7', N'0349790193', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (18, N'Hoàng', N'Hải Nam', N'250 bùi xương trạch, khương đình, thanh xuân', N'Hà Nội', N'Hà Nội', NULL, NULL, N'hoangnam26122003@gmail.com', N'HOANGNAM26122003@GMAIL.COM', N'hoangnam26122003@gmail.com', N'HOANGNAM26122003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBH9eqFKSnZDdm45nCDVjYTcjHXEr+9YGudZf2tn2FoRuLMLnBOGSTKO+pfAZslEtA==', N'LPFSJHXGDFHPUNYYFKHT24VKF44KF6CZ', N'08d2df24-f6af-4b62-b531-8970b0991ddf', N'0923998816', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (20, N'Hoàng', N'Trang', N'Trọ Thành Nam 1, cây xăng 39, thôn 3 Thạch Hoà', N'Hà Nội', N'Hà Nội', NULL, NULL, N'hoangthiphuongtrang4082003glhd@gmail.com', N'HOANGTHIPHUONGTRANG4082003GLHD@GMAIL.COM', N'hoangthiphuongtrang4082003glhd@gmail.com', N'HOANGTHIPHUONGTRANG4082003GLHD@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHp8iewgiio89tbPmRPoyD8wIgK6c6Mwd0ZwUGgETT0oD5lhavVRvCija8WRuMV6qA==', N'EPHQICHTBZE4HS3FUM6KLOR7L6HWVOIN', N'34a0659b-4928-4202-88a2-0140396ec674', N'0383380368', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (21, N'Ðào', N'Minh Anh', N'Tr? Hà Truong, Tân Xã, Th?ch Th?t', N'Hà Nội', N'Hà Nội', NULL, NULL, N'minhanh711111@gmail.com', N'MINHANH711111@GMAIL.COM', N'minhanh711111@gmail.com', N'MINHANH711111@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDDA6sBKuJN8ayoxIBdxb7VEhubJrpBtXCaDukGSOzvh08qekhv7IJpejANu8EvZ1A==', N'K7GYNX6YESU5GWS7SPBHPTNMAIYBBBPS', N'983a5f28-1560-473a-9c8c-2e6c7002f431', N'0397445507', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'huyldhe176275@fpt.edu.vn', N'HUYLDHE176275@FPT.EDU.VN', N'huyldhe176275@fpt.edu.vn', N'HUYLDHE176275@FPT.EDU.VN', 0, N'AQAAAAIAAYagAAAAELNGPEDOjEOPtwcYodLUA1QoUFCfFMfcfh89KFJRWTlYROhz+6Pq9n7DIDy/P5hFcA==', N'N5CX3ZQ7IMO6P5VW2I3XSUEQUIRLHVEF', N'ab0f7963-9f67-4165-9a0f-0e22ad9a7977', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (23, N'Nguyễn', N'Nghĩa', N'HomeSweetHome 24 thôn 2 Kim Bông, Tân Xã', N'Hà Nội', N'Hà Nội', NULL, NULL, N'nguyenhuunghia2604@gmail.com', N'NGUYENHUUNGHIA2604@GMAIL.COM', N'nguyenhuunghia2604@gmail.com', N'NGUYENHUUNGHIA2604@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKSWNM3b8f3dUNoSJo7oLdjsI47Ot2hPvuot3FoB7+hO43AN3EddEoGIJ6DVqWuTkA==', N'AQSGQESDDDB7P6523BRQZMCSOWFI2GYB', N'd3c8d182-8b64-4c6c-8529-ba45f9629978', N'0372190194', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (24, N'Đào', N'Hương', N'Trọ Tâm Lê Thạch Hòa Thạch Thất ', N'Hà Nội', N'Hà Nội', NULL, NULL, N'huongdths170790@fpt.edu.vn', N'HUONGDTHS170790@FPT.EDU.VN', N'huongdths170790@fpt.edu.vn', N'HUONGDTHS170790@FPT.EDU.VN', 0, N'AQAAAAIAAYagAAAAEDecEAwdb119IlqarwGCpeqIErDqktayeOkYTf1Pc2Pw261jE7RnzS6wGv1bMOctAA==', N'F5KPV7EFWOIRFBLYSYFW4WPBZ6O5TL2O', N'754fcc90-9dcd-445e-9f59-80849608ff22', N'0378037068', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (25, N'Sơn', N'Hoàng', N'Nhà Trọ Tuyết, 2HC2+3HP, Tân Xá, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'xuanson0312@gmail.com', N'XUANSON0312@GMAIL.COM', N'xuanson0312@gmail.com', N'XUANSON0312@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDkOQOLs4By0+4ke/O4Agvxq/Is7m01ybndjL+N69T6y/u0xwbxVvbhOx3eF/jubkQ==', N'XBNTEYPGNYPSHUGJY4VO7ZLH4ZYN4PJM', N'daded6a9-a8e4-459c-8b72-425b081e2ab5', N'0332310630', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (26, N'Linh', N'Nguyễn', N'Trọ Nhật Anh, Kim Bông, Tân Xã, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'nguyenquynh12c6@gmail.com', N'NGUYENQUYNH12C6@GMAIL.COM', N'nguyenquynh12c6@gmail.com', N'NGUYENQUYNH12C6@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHmW80fzJcqkpR1fNKRADR2x0YTH9SvpeUgZe4IKwaMJRnLDpBqGNH5wx7VuIWn9Mw==', N'M4TC3KLYCPS65JNKZNBIKNFPKFWBO3SA', N'cffc8341-deb3-4100-b9e7-f54fbb34d746', N'0976138752', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (27, N'Quách', N'Khải', N'Tuấn Cường 1, Thạch Hoà, Thạch Thất, Hà Nội', N'Hà Nội', N'Hà Nội', NULL, NULL, N'duykhai607@gami.com', N'DUYKHAI607@GAMI.COM', N'duykhai607@gami.com', N'DUYKHAI607@GAMI.COM', 0, N'AQAAAAIAAYagAAAAEGAdqcl3gb+dlxraTxhDwiSwYDPgeSpmDIckOHVXryvZWoBLIy0p/MpLfXZM7m6zbA==', N'SJYHBEAIFSK6WA6PZT6UWPFDU2DXJURZ', N'779dfd05-97c1-4de5-85e3-e53960447a3a', N'0971299380', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (28, N'Nguyễn', N'Linh', N'Hoàng Anh, Thạch Hoà, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'jena.linh2003@gmail.com', N'JENA.LINH2003@GMAIL.COM', N'jena.linh2003@gmail.com', N'JENA.LINH2003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEN+lGYDcC2ADPVLpEyPMqX/K4uLkjhdEoYFsUT7xp5Szra3i1AG6OqGBYTSDmIv9kA==', N'T4HBPM22QLBQV2TCIA7CD6RSF3QMYYUR', N'73318559-6b5d-4c8f-a6bd-1265191c6df9', N'0966044060', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (29, N'Đỗ Kim', N'Phúc', N'Sunhome, Thạch Hoà, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'kimphucdz2003@gmail.com', N'KIMPHUCDZ2003@GMAIL.COM', N'kimphucdz2003@gmail.com', N'KIMPHUCDZ2003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEFj1w2fSnwZc9WFvYRhZHVU3naEgRNpoM08GJAfxz8NMxi0yYWpX58nVHk7g7FFj9g==', N'4AJEESHE5JA337XR6TWDF3U22CCFAQ7F', N'893f0ad7-0d30-4447-ac53-5877233ae07a', N'0936572110', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (30, N'Le', N'Quan', N'Cát Quế, Hoài Đức, Hà Nội', N'Hà Nội', N'Hà Nội', NULL, NULL, N'lequan@gmail.com', N'LEQUAN@GMAIL.COM', N'lequan@gmail.com', N'LEQUAN@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEItTqWipaxuvjj0/NXLC3F/Gc0JL33UJ0enj5HeiTG3oeDlZh7mcA22zJH1PJIGtbw==', N'SGMGMD6NO5V5DVNGGJOAAOOL3CT6ZK5I', N'c4e119b5-cb64-43e9-b671-fc07b53b0cbd', N'0326713614', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (31, N'Nguyen Duy', N'Quynh', N'Cát Quế, Hoài Đức, Hà Nội', N'Hà Nội', N'Hà Nội', NULL, NULL, N'duyquynh@gmail.com', N'DUYQUYNH@GMAIL.COM', N'duyquynh@gmail.com', N'DUYQUYNH@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHAe4uKwyAbVIyjY1nDTnRLjyzG5WrCKmzQOwXPFw9DNMrduk7LJNcJj8dKhtjo20g==', N'LV2E6YR5BD65N457PGER3SQIEWLFLNH7', N'39dbae99-9647-4f14-9308-54dac45787d6', N'0904182113', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (32, N'Phạm Minh', N'Khánh', N'288, cụm 4, thôn 3, Thach Hoà, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'KhanhPro123@gmail.com', N'KHANHPRO123@GMAIL.COM', N'KhanhPro123@gmail.com', N'KHANHPRO123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPCUzLh9xecigH+QMZPpClMpmrvBV/KHH0TtBb04z0gHqaeH27WTdWqiBYYD7ZIaKw==', N'CXGQATQEBMW4XGQLRIDHSKOMXYCYZEBQ', N'7bc47c36-fcd0-4e2f-b6f9-ca02e27b6366', N'0325337641', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (33, N'Đỗ Mạnh ', N'Cường', N'288, cụm 4, thôn 3, Thach Hoà, Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'CuongManh122@gmail.com', N'CUONGMANH122@GMAIL.COM', N'CuongManh122@gmail.com', N'CUONGMANH122@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEM7KS4gMe6qH9qDU5j9BD/vkxILFGGZjLHRBcjLbXfICFl5PZixyLE+HzqIvtnECIw==', N'O53HB5ISESSNJPOFUR2YVR2OEA7262ZN', N'5c1bf5f7-dc46-40bb-98ef-98d053051e2b', N'0969768066', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (34, N'Nguyễn Mạnh ', N'Hùng', N'179e, Trương Định', N'Hà Nội', N'Hà Nội', NULL, NULL, N'HungAniss@gmail.com', N'HUNGANISS@GMAIL.COM', N'HungAniss@gmail.com', N'HUNGANISS@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHrHXSdFyOfN9EWJZ5Yc0Za+La4nZ/W7zHX9nptvDSn3wGlQjjzcYrZLMTfs7+IeLg==', N'QL6KI3QAZSEPKXZZ45B2TMKSCSCLHCJP', N'c89fb03f-7fba-48c6-97b2-70d0c2202fd3', N'0868638556', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (35, N'Đỗ Kim ', N'Phúc', N'Sunhome, Thạch Hoà, Thạch Thất', N' Hà Nội ', N' Hà Nội ', NULL, NULL, N'PhucPKM339@gmail.com', N'PHUCPKM339@GMAIL.COM', N'PhucPKM339@gmail.com', N'PHUCPKM339@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEOTFCRRl/rCRA5m5EGQRrVYMEZWU+BN4r8rTU2i5dnth++885YeHXx7fms2s6bo/Cw==', N'F4P7BTNTORJZIQM2DPYGOKUOXLV2F2PQ', N'8b732ded-9bef-4e14-a328-769dd574f33a', N'0936572110', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (36, N'Le Thi Kim', N'Anh', N'Cát Quế, Hoài Đức, Hà Nội', N'Hà Nội', N'Hà Nội', NULL, NULL, N'kimanh@gmail.com', N'KIMANH@GMAIL.COM', N'kimanh@gmail.com', N'KIMANH@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHOe6G9H09sV+7D80aGBbaUjlXZMpaSVcujsRYpwgKWEX/cy4NfNM6A9TslRWNJVSA==', N'XMKSP6JO6X6SW47L76ZMOQ6MGWSQAPQC', N'f68343f7-74fe-42cb-b4cf-e9ba3ef5bb58', N'0904152476', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (37, N'Nguyen Dieu', N'Linh', N'Hoàng Anh, Thạch Hoà, Thạch Thất, Hà Nội ', N'Hà Nội ', N'Hà Nội ', NULL, NULL, N'dieulinh@gmail.com', N'DIEULINH@GMAIL.COM', N'dieulinh@gmail.com', N'DIEULINH@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHdH9wFXb4CtbcLWVIViEBFctsUYE9U6t7qGVdjx1G9mwiD6XK11RUDzPFNPbGLNwg==', N'LDDSWAH77HPXQIHCNLGDJUJUFMDQELJO', N'73a6d9a5-fd63-41e5-ad8c-419a8a7e9046', N'0966044060', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[User] ([id], [firstName], [lastName], [street], [city], [province], [country], [status], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (38, N'nguyễn', N'Phúc', N'Thôn 4 Thạch Thất', N'Hà Nội', N'Hà Nội', NULL, NULL, N'anvjp021203@gmail.com', N'ANVJP021203@GMAIL.COM', N'anvjp021203@gmail.com', N'ANVJP021203@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELUlJLhEmeAdAjnizYmpZ1I4WEbLLm8/mRUp4rhBggV2AZ7Imv6mKo9JxW0Un43BbA==', N'JTLZMZFTBUT33VYAXDQ3T5QKQHYI6YRC', N'59550815-630c-4bf8-b26b-bd260679d57d', N'0966393025', 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (1, 2, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (2, 3, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (4, 2, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (5, 2, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (6, 2, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (6, 3, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (7, 2, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (8, 3, CAST(N'2025-03-05' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (9, 1, CAST(N'2025-03-10' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (10, 2, CAST(N'2025-03-11' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (11, 2, CAST(N'2025-03-11' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (12, 2, CAST(N'2025-03-11' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (13, 2, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (14, 2, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (15, 2, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (16, 2, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (17, 2, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (18, 2, CAST(N'2025-03-14' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (20, 2, CAST(N'2025-03-15' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (21, 2, CAST(N'2025-03-15' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (22, 2, CAST(N'2025-03-16' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (23, 2, CAST(N'2025-03-16' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (24, 2, CAST(N'2025-03-16' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (25, 2, CAST(N'2025-03-16' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (26, 2, CAST(N'2025-03-16' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (27, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (28, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (29, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (30, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (31, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (32, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (33, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (34, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (35, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (36, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (37, 2, CAST(N'2025-03-17' AS Date))
GO
INSERT [dbo].[UserRoles] ([UserId], [RoleId], [CreatedDate]) VALUES (38, 2, CAST(N'2025-03-25' AS Date))
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [totalPrice]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Booking_Services] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[BookingDetail] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Report] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User] FOREIGN KEY([customerId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User]
GO
ALTER TABLE [dbo].[Booking_Services]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Services_Booking] FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Booking_Services] CHECK CONSTRAINT [FK_Booking_Services_Booking]
GO
ALTER TABLE [dbo].[Booking_Services]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Services_Service] FOREIGN KEY([serviceId])
REFERENCES [dbo].[Services] ([id])
GO
ALTER TABLE [dbo].[Booking_Services] CHECK CONSTRAINT [FK_Booking_Services_Service]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Booking] FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Booking]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Booking] FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Booking]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Booking] FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Booking]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Booking] FOREIGN KEY([bookingId])
REFERENCES [dbo].[Booking] ([id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Booking]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_User_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_User_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_User_UserId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [HomeCare_EXE201] SET  READ_WRITE 
GO
