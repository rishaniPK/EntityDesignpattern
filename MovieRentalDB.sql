USE [master]
GO
/****** Object:  Database [MovieRentalDB]    Script Date: 22/10/2019 10:57:22 AM ******/
CREATE DATABASE [MovieRentalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieRentalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieRentalDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieRentalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieRentalDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MovieRentalDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieRentalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieRentalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieRentalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieRentalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieRentalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieRentalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieRentalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieRentalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieRentalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieRentalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieRentalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieRentalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieRentalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieRentalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieRentalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieRentalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieRentalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieRentalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieRentalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieRentalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieRentalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieRentalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieRentalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieRentalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieRentalDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieRentalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieRentalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieRentalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieRentalDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieRentalDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieRentalDB] SET QUERY_STORE = OFF
GO
USE [MovieRentalDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/10/2019 10:57:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_CustomerID] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 22/10/2019 10:57:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieRent]    Script Date: 22/10/2019 10:57:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieRent](
	[RentID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[CustomerID] [int] NULL,
	[IssuseDate] [date] NULL,
 CONSTRAINT [PK_MovieRent] PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieReturned]    Script Date: 22/10/2019 10:57:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieReturned](
	[ReturnID] [int] IDENTITY(1,1) NOT NULL,
	[MovieTitle] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[IssueDate] [date] NULL,
	[ReturnDate] [date] NULL,
	[TotalRent] [decimal](18, 0) NULL,
 CONSTRAINT [PK_MovieReturned] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 22/10/2019 10:57:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Year] [nvarchar](50) NULL,
	[Gener] [nvarchar](50) NULL,
	[RentPerDay] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (1, N'Limba', N'Nisha', N'24, glennandrew drive', N'1589486735')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (4, N'Harlan ', N'Shields', N'111 Brook Lane', N'4434972   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (5, N'rishani kumari', N'miyu', N'24, glennandrew drive', N'0225351751')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (6, N'Stan ', N'Short', N'875 Edgewood Drive', N'2615295   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (8, N'Therese ', N'Shepherd', N'226 Front Street South', N'9208849   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (9, N'Ulysses ', N'Shannon', N'529 2nd Avenue', N'5678883   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (10, N'Alberta ', N'Sharp', N'222 Route 1', N'5759347   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (11, N'Clara ', N'Shaw', N'807 Route 41', N'7739826   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (12, N'Hugh ', N'Silva', N'206 Main Street', N'8860054   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (13, N'Maxine ', N'Silva', N'305 Prospect Avenue', N'1371532   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (14, N'Shawn ', N'Simmons', N'130 Cooper Street', N'7642181   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (15, N'Van ', N'Singleton', N'775 Edgewood Drive', N'2582573   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (16, N'Ginger ', N'Simon', N'992 Holly Court', N'4053574   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (17, N'Laurence ', N'Simon', N'950 Maple Street', N'5374945   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (18, N'Brent ', N'Sims', N'276 Edgewood Drive', N'1166640   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (19, N'Faith ', N'Singleton', N'526 Virginia Avenue', N'7397034   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (20, N'Tina ', N'Simmons', N'864 Augusta Drive', N'5039366   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (21, N'Vanessa ', N'Sims', N'179 Mulberry Lane', N'3189437   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (22, N'Kyle ', N'Simpson', N'145 Amherst Street', N'7919511   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (23, N'Ellen ', N'Simpson', N'284 4th Street West', N'8419851   ')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (30, N'rishani kumari', N'hewaga', N'24, glennandrew drive', N'0225351751')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Address], [Phone]) VALUES (32, N'CCC', N'DDDD', N'dfghjkl', N'0983883   ')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([LoginID], [UserName], [Password]) VALUES (1, N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[MovieRent] ON 

INSERT [dbo].[MovieRent] ([RentID], [MovieID], [CustomerID], [IssuseDate]) VALUES (7, 5, 6, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[MovieRent] ([RentID], [MovieID], [CustomerID], [IssuseDate]) VALUES (9, 13, 8, CAST(N'2019-10-03' AS Date))
INSERT [dbo].[MovieRent] ([RentID], [MovieID], [CustomerID], [IssuseDate]) VALUES (10, 3, 1, CAST(N'2019-10-20' AS Date))
SET IDENTITY_INSERT [dbo].[MovieRent] OFF
SET IDENTITY_INSERT [dbo].[MovieReturned] ON 

INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (1, N'Once Upon a Time in America', N'Stan ', CAST(N'2019-10-03' AS Date), CAST(N'2019-10-21' AS Date), CAST(190 AS Decimal(18, 0)))
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (2, N'Once Upon a Time in America', N'Stan ', CAST(N'2019-10-03' AS Date), CAST(N'2019-10-21' AS Date), CAST(190 AS Decimal(18, 0)))
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (3, N'Will Find You', N'Van ', CAST(N'2019-10-04' AS Date), CAST(N'2019-10-21' AS Date), CAST(180 AS Decimal(18, 0)))
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (4, N'	O Brother', N'	Limba', CAST(N'2019-10-08' AS Date), NULL, NULL)
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (5, N'O Brother', N'Limba', CAST(N'2019-10-08' AS Date), CAST(N'2019-10-21' AS Date), CAST(210 AS Decimal(18, 0)))
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (6, N'Will Find You', N'Van ', CAST(N'2019-10-04' AS Date), CAST(N'2019-10-21' AS Date), CAST(180 AS Decimal(18, 0)))
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (7, N'Lion King', N'Laurence ', CAST(N'2019-10-10' AS Date), CAST(N'2019-10-21' AS Date), CAST(240 AS Decimal(18, 0)))
INSERT [dbo].[MovieReturned] ([ReturnID], [MovieTitle], [CustomerName], [IssueDate], [ReturnDate], [TotalRent]) VALUES (8, N'Scared Morning', N'Brent ', CAST(N'2019-10-02' AS Date), CAST(N'2019-10-21' AS Date), CAST(300 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[MovieReturned] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (0, N'King Town', N'2012', N'Comdey', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (2, N'Hotel Rwanda', N'2004', N'Biography, Drama, History', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (3, N'Anna Karenina', N'2012', N'Drama', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (4, N'Who', N'1966', N'Drama', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (5, N'Once Upon a Time in America', N'1984', N'Crime, Drama', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (7, N'O Brother', N'2000', N'Comedy, Drama, War', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (8, N'Toy Stroy', N'2018', N'Animation', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (9, N'NULLTitanic', N'2000', N'Animation, Family', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (10, N'Will Find You', N'1998', N'Drama', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (11, N'Brave', N'2000', N'Crime, Thriller', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (12, N'Light We Lost', N'2018', N'Romantic, Love', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (13, N'Lusay', N'2002', N'Biography, Drama, History', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (14, N'Lion King', N'2017', N'Animation, Family', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (15, N'Fast and Furious', N'2019', N'Action, Sci-Fi, Thriller', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (16, N'Jasmine', N'1978', N'Drama', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (17, N'More than Words', N'2014', N'Romantic, Love', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (18, N'Men without Women', N'2004', N'Crime, Thriller', CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (19, N'Hills at high', N'1996', N'Romantic, Love', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (20, N'Scared Morning', N'2001', N'Action, Sci-Fi, Thrillerv', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (21, N'Game', N'2003', N'Animation, Family', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (22, N'Mute', N'1997', N'Comedy,War', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (23, N'Ocean On Romantic', N'1698', N'Drama', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (24, N'Kept In memories', N'2012', N'Comedy, Drama, War', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (25, N'Caption Marvel', N'1995', N'Animation, Family', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (26, N'Taking Animals', N'2008', N'Comedy, Drama, War', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (27, N'Date50', N'2004', N'Comedy, Drama', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (28, N'LinesUp', N'1977', N'Biography, Drama, History', CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (29, N'Quick Kiss', N'2000', N'Romantic, Love', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (30, N'Sipder Fram', N'2001', N'Crime, Thriller', CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (31, N'Race', N'2012', N'Action', CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[Movies] ([MovieID], [Title], [Year], [Gener], [RentPerDay]) VALUES (32, N'Us', N'2019', N'Honor', CAST(20 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Movies] OFF
ALTER TABLE [dbo].[MovieRent]  WITH CHECK ADD  CONSTRAINT [FK_MovieRent_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[MovieRent] CHECK CONSTRAINT [FK_MovieRent_Customer]
GO
ALTER TABLE [dbo].[MovieRent]  WITH CHECK ADD  CONSTRAINT [FK_MovieRent_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieRent] CHECK CONSTRAINT [FK_MovieRent_Movie]
GO
USE [master]
GO
ALTER DATABASE [MovieRentalDB] SET  READ_WRITE 
GO
