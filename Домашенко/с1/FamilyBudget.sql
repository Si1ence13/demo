USE [master]
GO
/****** Object:  Database [FamilyBudget]    Script Date: 21.05.2019 10:36:23 ******/
CREATE DATABASE [FamilyBudget]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prim1_FamilyBudget', FILENAME = N'D:\DataBase\DatabaseFamilyBudget\base1_Family.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB ),
( NAME = N'prim2_FamilyBudget', FILENAME = N'D:\DataBase\DatabaseFamilyBudget\base2_Family.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB ), 
 FILEGROUP [Secondary] 
( NAME = N'sec1_FamilyBudget', FILENAME = N'D:\DataBase\DatabaseFamilyBudget\base2_secondary.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'FamilyLog', FILENAME = N'D:\DataBase\DatabaseFamilyBudget\base_log.mdf' , SIZE = 1024KB , MAXSIZE = 102400KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FamilyBudget] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FamilyBudget].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FamilyBudget] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FamilyBudget] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FamilyBudget] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FamilyBudget] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FamilyBudget] SET ARITHABORT OFF 
GO
ALTER DATABASE [FamilyBudget] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FamilyBudget] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FamilyBudget] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FamilyBudget] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FamilyBudget] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FamilyBudget] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FamilyBudget] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FamilyBudget] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FamilyBudget] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FamilyBudget] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FamilyBudget] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FamilyBudget] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FamilyBudget] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FamilyBudget] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FamilyBudget] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FamilyBudget] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FamilyBudget] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FamilyBudget] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FamilyBudget] SET  MULTI_USER 
GO
ALTER DATABASE [FamilyBudget] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FamilyBudget] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FamilyBudget] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FamilyBudget] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FamilyBudget] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FamilyBudget]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Costs]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Costs](
	[CostsID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[OperationData] [date] NOT NULL,
	[FamilyMember] [varchar](255) NOT NULL,
	[MoneyAmount] [float] NOT NULL,
	[FamilyMemberID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[CostsLinkID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CostsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CostsLink]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostsLink](
	[CostsLinkID] [int] IDENTITY(1,1) NOT NULL,
	[CostAmount] [float] NOT NULL,
	[MemberID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CostsLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Family]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Family](
	[FamilyID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyName] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FamilyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FamilyComposition]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FamilyComposition](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Surname] [varchar](255) NOT NULL,
	[Lastname] [varchar](255) NOT NULL,
	[Login] [varchar](255) NOT NULL,
	[Pass] [varchar](255) NOT NULL,
	[Role] [varchar](255) NOT NULL,
	[FamilyID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Income]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Income](
	[IncomeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NULL,
	[OperationData] [date] NOT NULL,
	[FamilyMember] [varchar](255) NOT NULL,
	[MoneyAmount] [float] NOT NULL,
	[FamilyMemberID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[IncomeLinkID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IncomeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IncomeLink]    Script Date: 21.05.2019 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeLink](
	[IncomeLinkID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeAmount] [float] NOT NULL,
	[MemberID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IncomeLinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Costs]  WITH CHECK ADD FOREIGN KEY([CostsLinkID])
REFERENCES [dbo].[CostsLink] ([CostsLinkID])
GO
ALTER TABLE [dbo].[CostsLink]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[FamilyComposition] ([MemberID])
GO
ALTER TABLE [dbo].[FamilyComposition]  WITH CHECK ADD FOREIGN KEY([FamilyID])
REFERENCES [dbo].[Family] ([FamilyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Income]  WITH CHECK ADD FOREIGN KEY([IncomeLinkID])
REFERENCES [dbo].[IncomeLink] ([IncomeLinkID])
GO
ALTER TABLE [dbo].[IncomeLink]  WITH CHECK ADD FOREIGN KEY([MemberID])
REFERENCES [dbo].[FamilyComposition] ([MemberID])
GO
USE [master]
GO
ALTER DATABASE [FamilyBudget] SET  READ_WRITE 
GO
