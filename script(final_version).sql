USE [master]
GO
/****** Object:  Database [webPhimhhs]    Script Date: 4/3/2021 2:21:15 PM ******/
CREATE DATABASE [webPhimhhs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webPhimhhs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\webPhimhhs.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'webPhimhhs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\webPhimhhs_log.ldf' , SIZE = 7040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [webPhimhhs] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webPhimhhs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webPhimhhs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webPhimhhs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webPhimhhs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webPhimhhs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webPhimhhs] SET ARITHABORT OFF 
GO
ALTER DATABASE [webPhimhhs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webPhimhhs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webPhimhhs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webPhimhhs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webPhimhhs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webPhimhhs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webPhimhhs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webPhimhhs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webPhimhhs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webPhimhhs] SET  ENABLE_BROKER 
GO
ALTER DATABASE [webPhimhhs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webPhimhhs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webPhimhhs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webPhimhhs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webPhimhhs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webPhimhhs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webPhimhhs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webPhimhhs] SET RECOVERY FULL 
GO
ALTER DATABASE [webPhimhhs] SET  MULTI_USER 
GO
ALTER DATABASE [webPhimhhs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webPhimhhs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webPhimhhs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webPhimhhs] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [webPhimhhs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'webPhimhhs', N'ON'
GO
USE [webPhimhhs]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/3/2021 2:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[IDAC] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Pass] [nvarchar](50) NOT NULL,
	[ChucVu] [nvarchar](50) NOT NULL,
	[status] [varchar](50) NULL,
	[code] [text] NULL,
	[active] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDAC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cacTap]    Script Date: 4/3/2021 2:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cacTap](
	[tap] [nvarchar](50) NULL,
	[IDP] [nvarchar](50) NOT NULL,
	[Link] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 4/3/2021 2:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[IDP] [nvarchar](50) NOT NULL,
	[IDAC] [nvarchar](50) NOT NULL,
	[BinhLuan] [text] NOT NULL,
	[name] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[New]    Script Date: 4/3/2021 2:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [text] NOT NULL,
	[Content] [text] NOT NULL,
	[title] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phim]    Script Date: 4/3/2021 2:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[IDP] [nvarchar](50) NOT NULL,
	[TenPhim] [text] NOT NULL,
	[TheLoai] [text] NOT NULL,
	[Poster] [text] NOT NULL,
	[Image] [text] NOT NULL,
	[DienVien] [nvarchar](50) NOT NULL,
	[timePost] [date] NOT NULL,
	[MoTa] [text] NOT NULL,
	[Trailer] [text] NOT NULL,
	[luotView] [int] NULL,
	[Rate] [int] NULL,
	[Anhdienvien] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Uathich]    Script Date: 4/3/2021 2:21:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uathich](
	[IDP] [nvarchar](50) NOT NULL,
	[IDAC] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'A01', N'Admin', N'12', N'1', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U01', N'nguyenxuanhung', N'123', N'2', N'off', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U02', N'vuhongson', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U0211', N'sa', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U03', N'vuvanhai', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U04', N'duonghailong', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U05', N'hoanghieu', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U06', N'tuanlinh', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U07', N'sa1', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U15', N'conlon1', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U18', N'concho', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U39', N'conchim', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U44', N'hungnxhe141195@fpt.edu.vn', N'12', N'2', N'on', N'58045', N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U55', N'conheo', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[Account] ([IDAC], [Username], [Pass], [ChucVu], [status], [code], [active]) VALUES (N'U91', N'conga', N'12', N'2', N'on', NULL, N'active')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P01', N'https://drive.google.com/uc?id=1U66_izFWgbZD7wxA_fzsAPUr-BPq5UyS')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P02', N'https://drive.google.com/uc?id=1UihBZCYZ-ikqc5_xtbT7O3AQZLM55H1I')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P03', N'https://drive.google.com/uc?id=13PYnDPrZazc89d2DjmmouMN0QqOG3DAq')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'2', N'P01', N'https://drive.google.com/uc?id=13PYnDPrZazc89d2DjmmouMN0QqOG3DAq')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'3', N'P01', N'https://drive.google.com/uc?id=1UihBZCYZ-ikqc5_xtbT7O3AQZLM55H1I')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P04', N'https://drive.google.com/uc?id=1Z0krlnrqHaxIbT8c5q6RHHT1VlKD_CCk')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P05', N'https://drive.google.com/uc?id=1WY6FXkpQFTxN7mt7yzzj4qQNmYhmwWzV')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P06', N'https://drive.google.com/uc?id=1C81fGwkoxOGrat3Vcrr7TF6RrqOcElrD')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P07', N'https://drive.google.com/uc?id=13TTcQcSZBg-UHETesb4sQUiUcQH_90N9')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P08', N'https://drive.google.com/uc?id=1-X-GrjL3epNN7FRH_foNlD1GEYGXHFj2')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P09', N'https://drive.google.com/uc?id=1r-Q20CExXqlHrhapneC7tsXrExFiWd1I')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P10', N'https://drive.google.com/uc?id=1rY-wvHblzNcygyvVtJCNJNbAWk8xGzkL')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P11', N'https://drive.google.com/uc?id=1osFD14n04MLJBQGP7JV0n4-9Gsx-q_80')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P12', N'https://drive.google.com/uc?id=1XBVCY8chHUKyryaOVTXS6sz2MP90pXhQ')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P13', N'https://drive.google.com/uc?id=1QBUrxh9pJO717VyigUpDtWoUrR7ponKm')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'2', N'P13', N'https://drive.google.com/uc?id=1YQjudh4aQGbf8TeHCO1vpTU1KunF3MmU')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'3', N'P13', N'https://drive.google.com/uc?id=1XhUXslGmprKw_f2mCeNSPa4TjXIaOS9y')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P14', N'https://drive.google.com/uc?id=1-ToMneRigvaKe56FcaD-LUsExnciKmeE')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'2', N'P14', N'https://drive.google.com/uc?id=17TE2luzhkiOUh-_-YCqRDiAyM27w92al')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'3', N'P14', N'https://drive.google.com/uc?id=1WFlqg8_YiPe8_AeFTwmN1B4hrQzuwL1E')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P15', N'https://drive.google.com/uc?id=11uRymxo8wFVje2tiycCerk6D0wBZTGoo')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'2', N'P15', N'https://drive.google.com/uc?id=1vhnCNsTOE0PhLuEdUT576EGQGwMmuMfP')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'3', N'P15', N'https://drive.google.com/uc?id=1qFZJ_-8WbiI66ww54LIHUmCtHZwa22Uu')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P19', N'https://drive.google.com/uc?id=1ieraf4lfgYthdESFkBx1_h5WLMHx7ATn')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'2', N'P19', N'https://drive.google.com/uc?id=1JIFAri0otXg1GhlLUdJXSAmF8x4t0V7W')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'3', N'P19', N'https://drive.google.com/uc?id=1XQg591IKU0SwdzQxGZd-b3cbk0J9C1Gt')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'4', N'P19', N'https://drive.google.com/uc?id=1Ri_4ZyM48EkPh36-mrXoawM6aI6s6pq4')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P20', N'https://drive.google.com/uc?id=1iYEc6xwFtcq5kVCjMubmbEdzifDsNWq7')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P21', N'https://drive.google.com/uc?id=1iYEc6xwFtcq5kVCjMubmbEdzifDsNWq7')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P23', N'https://drive.google.com/uc?id=1DBAJ_GnaFyn4mgfEH6KXCqUOyJGa0SpK')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P31', N'https://drive.google.com/uc?id=1YVzbDPN2bn-s237D5F7vlgtQrNPvE81j')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P22', N'https://drive.google.com/uc?id=1JgTDuXmdFwDeDdOa_sPRAydWYTsvxZEa')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P25', N'https://drive.google.com/uc?id=1VSafYO9LpHCz5VEBtNeTEvvWhQes5FjS')
INSERT [dbo].[cacTap] ([tap], [IDP], [Link]) VALUES (N'1', N'P434', N'https://drive.google.com/uc?id=1KD9_0UcZdCtarL7IJ2ME0aGZBB-a2ofI')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P01', N'U01', N'Nguyen xuan hung', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P14', N'A01', N'Type your comment here.', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P14', N'A01', N'alo', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P01', N'U01', N'se1420', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P01', N'A01', N'test comment', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P23', N'U01', N'The previous record was held two years ago by “Cua lai vo bau” (Flirt with pregnant wife again), which also starred Tran Thanh, with domestic ticket sales reaching VND191.8 billion', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P02', N'A01', N'có ai ko', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P02', N'U01', N'alo alo', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P02', N'U01', N'sao the nhi', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P19', N'U01', N'Type your comment here.', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P03', N'U01', N'nguyen xuan hung', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P14', N'U01', N'Type your comment here.', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P14', N'U01', N'Type gffd', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P04', N'U03', N'test commnet', N'vuvanhai')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P23', N'U01', N'Action film “Hai Phuong” (Furie) collected up to VND200 billion, but the film was screened in the United States, Canada and China.', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P04', N'U03', N'ok la', N'vuvanhai')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P23', N'U01', N'Released on March 5, “Old Father” has set new records for the fastest Vietnamese movie to reach ticket sales of VND100 billion and VND200 billion.', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P14', N'A01', N'alo alo', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P25', N'A01', N'nguyen xuan hung', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P25', N'A01', N'xin chao ca lop', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P19', N'A01', N'con lon son', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P21', N'A01', N'con lon son', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P21', N'A01', N'con lon hai', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P01', N'A01', N'test ajax', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P13', N'U01', N'alo aloi', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P13', N'U01', N'Type your comment here.', N'nguyenxuanhung')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P31', N'A01', N'Fueled by his restored faith in humanity and inspired', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P31', N'A01', N'Diana Prince to face an even greater threat. Together, Batman and Wonder Woman work quickly to recruit a team to stand against this newly awakened enemy', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P31', N'A01', N'Batman and Wonder Woman work quickly to recruit a team to stand against this newly awakened enemy', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P19', N'A01', N'phim nay chan lam dung xem', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P20', N'A01', N'Underworld is a series of action horror films created by Len Wiseman, Kevin Grevioux, and Danny McBride, that follows characters who are caught up in a war between vampires and werewolves', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P20', N'A01', N'Most of the movies star Kate Beckinsale as the protagonist, Selene. The first film, Underworld, was released in 2003; it introduces Selene, an elite vampire-warrior who defies her orders, and Michael Corvin (Scott Speedman),', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P20', N'A01', N' a human who gets caught up in the war. The second film, Underworld: Evolution (released in 2006) follows Selene and Michael as they are hunted by their enemies.', N'Admin')
INSERT [dbo].[Comment] ([IDP], [IDAC], [BinhLuan], [name]) VALUES (N'P20', N'A01', N'n this film, humans have discovered the existence of vampires and Lycans, and are trying to eradicate both species. A further sequel, titled Underworld: Blood Wars', N'Admin')
SET IDENTITY_INSERT [dbo].[New] ON 

INSERT [dbo].[New] ([ID], [Image], [Content], [title]) VALUES (15, N'https://drive.google.com/uc?id=1mTbmRed0F0Baeb5wXvPCURpoeVTs5F1R', N' “Bo Gia” (Old Father), a family movie starring comedian and TV host Tran Thanh, has become the bestselling Vietnamese movie in the country’s cinema history after its ticket sales reached VND200 billion on March 14.', N'Old Father')
INSERT [dbo].[New] ([ID], [Image], [Content], [title]) VALUES (16, N'https://drive.google.com/uc?id=1KuEi6vBi9kWjm1l32QQO5rAzEnv-2Ud0', N' Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. However, when sinister monsters known as the Druun threatened the land, the dragons sacrificed themselves to save humanity', N'Raya and the Last Dragon')
INSERT [dbo].[New] ([ID], [Image], [Content], [title]) VALUES (17, N'https://drive.google.com/uc?id=1g7u9Yy__9U4LG3Hr380gda61XZQU3u1b', N'Underworld is a series of action horror films created by Len Wiseman, Kevin Grevioux, and Danny McBride, that follows characters who are caught up in a war between vampires and werewolves. Most of the movies star Kate Beckinsale as the protagonist, Selene Underworld is a series of action horror films created by Len Wiseman, Kevin Grevioux, and Danny McBride, that follows characters who are caught up in a war between vampires and werewolves. Most of the movies star Kate Beckinsale as the protagonist', N'Under world 2')
INSERT [dbo].[New] ([ID], [Image], [Content], [title]) VALUES (18, N'https://drive.google.com/uc?id=1dlyV51zHJEu3e-tJ8AWskXtqs3sB0ddy', N' Kung Fu Panda 3 is a 2016 computer-animated wuxia comedy film produced by DreamWorks Animation and distributed by 20th Century Fox worldwide and by Oriental DreamWorks in China. It is the third and final film in the Kung Fu Panda franchise and the sequel to Kung Fu Panda 2 (2011).', N'KungFu Panda 3')
INSERT [dbo].[New] ([ID], [Image], [Content], [title]) VALUES (19, N'https://drive.google.com/uc?id=16rfh3IEnmNLM7G6dTYyZYdIySkLlb2-C', N' In 1964, following the death of his wife, Ip Man discovers he has throat cancer due to chronic smoking. After his rebellious son Ip Ching fights back against a school bully and is subsequently expelled, Ip Man decides to travel to San Francisco in order to look for study opportunities. He entrusts Ching to his friend, Fat Bo, and promises to call Ching every night.', N'Ip Man 4')
INSERT [dbo].[New] ([ID], [Image], [Content], [title]) VALUES (20, N'https://drive.google.com/uc?id=1eVgNgQO7ubQE_T08_ncOqKDu9nTdcPG-', N' con lon son', N'Creativity Machine')
SET IDENTITY_INSERT [dbo].[New] OFF
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P01', N'Spider man 1', N'hanh fong', N'https://drive.google.com/uc?id=1SpA4UPQe46x3MyLXzMAVax9Ophfyk9AV', N'https://drive.google.com/uc?id=1B4od_tHyueiQWExYAS1EiLLp5UdBRPuW', N'Tobey Maguire', CAST(N'2002-12-07' AS Date), N'Spider-Man is a 2002 American superhero film based on the Marvel Comics character of the same name. Directed by Sam Raimi from a screenplay by David Koepp, it is the first installment in the Spider-Man trilogy, and stars Tobey Maguire as the title character, alongside Willem Dafoe, Kirsten Dunst, James Franco, Cliff Robertson, and Rosemary Harris. The film centers on outcast teen genius Peter Parker, who develops spider-like superhuman abilities after being bitten by a genetically-altered spider.', N'https://www.youtube.com/embed/TYMMOjBUPMM', 242, 8, N'https://drive.google.com/uc?id=19SvTK5u42TXCdgUdTK_WpuLEaEeE0Vag')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P02', N'Spider man 2', N'Hanh Dong', N'https://drive.google.com/uc?id=1BX24qWrNRMly2GAoI3fhIdWsd5ysZatN', N'https://drive.google.com/uc?id=1cLaN9CcaQiHctzdeNIghQtqvssQENpkz', N'Tobey markview', CAST(N'2004-12-07' AS Date), N'Spider-Man 3 is a 2007 American superhero film based on the Marvel Comics character Spider-Man. It was directed by Sam Raimi from a screenplay by Raimi, his older brother Ivan and Alvin Sargent. It is the final installment in Raimi''s Spider-Man trilogy. The film stars Tobey Maguire as Peter Parker / Spider-Man, alongside Kirsten Dunst, James Franco, Thomas Haden Church, Topher Grace, Bryce Dallas Howard, James Cromwell, Rosemary Harris, J. K. Simmons and Matthew Gounder. Set shortly after the events of Spider-Man 2, as Peter Parker prepares for his future with Mary Jane Watson, he faces three more villains: Uncle Ben''s true killer, Flint Marko who becomes the Sandman after a freak accident; Harry Osborn, who is now aware of Peter''s identity and seeks to avenge his father; and Eddie Brock, a rival photographer who becomes Venom. Peter also faces his greatest challenge when he bonds with an extraterrestrial symbiote that augments his abilities but brings out his anger and other negative traits.', N'https://www.youtube.com/embed/1s9Yln0YwCw', 232, 9, N'https://drive.google.com/uc?id=19SvTK5u42TXCdgUdTK_WpuLEaEeE0Vag')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P03', N'Spider man 3', N'Hanh Dong', N'https://drive.google.com/uc?id=1yKN6VXoaVEXyFtl3KS2HrSJNMLlx4b2k', N'https://drive.google.com/uc?id=1KcuCQ701-IT9fXUtvzr76ADdczfg8Rv1', N'Tobey Maguire', CAST(N'2007-12-09' AS Date), N'Spider-Man 3 is a 2007 American superhero film based on the Marvel Comics character Spider-Man. It was directed by Sam Raimi from a screenplay by Raimi, his older brother Ivan and Alvin Sargent. It is the final installment in Raimi''s Spider-Man trilogy. The film stars Tobey Maguire as Peter Parker / Spider-Man, alongside Kirsten Dunst, James Franco, Thomas Haden Church, Topher Grace, Bryce Dallas Howard, James Cromwell, Rosemary Harris, J. K. Simmons and Matthew Gounder. Set shortly after the events of Spider-Man 2, as Peter Parker prepares for his future with Mary Jane Watson, he faces three more villains: Uncle Ben''s true killer, Flint Marko who becomes the Sandman after a freak accident; Harry Osborn, who is now aware of Peter''s identity and seeks to avenge his father; and Eddie Brock, a rival photographer who becomes Venom. Peter also faces his greatest challenge when he bonds with an extraterrestrial symbiote that augments his abilities but brings out his anger and other negative traits.', N'https://www.youtube.com/embed/wPosLpgMtTY', 12349, 8, N'https://drive.google.com/uc?id=19SvTK5u42TXCdgUdTK_WpuLEaEeE0Vag')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P04', N'kung fu hustle', N'He Huoc', N'https://drive.google.com/uc?id=1LPfPsl3_nvIKsuL55RbRYrc8eBcMcSVO', N'https://drive.google.com/uc?id=173LrgL_eiTtQFSGDRGt8PYXVtA7bhWua', N'Chau tinh tinh', CAST(N'2000-03-05' AS Date), N'Kung Fu Hustle (Chinese: ??, lit. Kung Fu) is a 2004 martial arts action-comedy film directed, produced, co-written by, and starring Stephen Chow. The film tells the story of a murderous neighborhood gang, a poor village with unlikely heroes, and an aspiring gangster''s fierce journey to find his true self. Eva Huang, Yuen Wah, Yuen Qiu, Danny Chan Kwok-kwan and Leung Siu-lung co-starred in prominent roles. The martial arts choreography is supervised by Yuen Woo-ping. It was a co-production between Hong Kong and Mainland Chinese companies, filmed in Shanghai.', N'https://www.youtube.com/embed/PRbPXbgsKyE', 17615, 7, N'https://drive.google.com/uc?id=1F2FkxwFjR94NMXuzkNGL49ipLFSX0cfB')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P05', N'God of Gamblers', N'He Huoc', N'https://drive.google.com/uc?id=1zHa9tqttMzbquaH7UM4UlgkKca3L51k4', N'https://drive.google.com/uc?id=1b8Nu8d7Do39hqkUJiM3tpC-DPLHe_rUp', N'Chau tinh tinh', CAST(N'1998-08-05' AS Date), N'Ko Chun (Chow Yun-fat) is a world-famous gambler, so renowned and talented at winning various games of chance that he is referred to as the "God of Gamblers". He keeps his identity secret from the public (and avoids photographs so his face is not recognized), but is known for three characteristics: his slicked-back hairstyle, his love of Feodora brand chocolate, and his jade pinky ring.', N'https://www.youtube.com/embed/hRH6m3IBXn0', 342, 6, N'https://drive.google.com/uc?id=1F2FkxwFjR94NMXuzkNGL49ipLFSX0cfB')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P06', N'Royal Tramp', N'He Huoc', N'https://drive.google.com/uc?id=1w2cOUSwFZ-9tj6SubvfIEbt9KbPU3L1c', N'https://drive.google.com/uc?id=1FGa8rTDSErkKWfE5ng3VnNSMoRxb-NUS', N'Chau Tinh Tinh', CAST(N'1998-01-02' AS Date), N'At the palace, The Emperor, wary of Ng Sam-kwai''s intentions, marries off the Princess to Ying-hung and assigns Siu-bo to be the Imperial Inspector General of the wedding march, so that he can keep his eyes on the general''s activities. This complicates Siu-bo''s relationship with Princess when she tells Siu-bo she''s pregnant with his child.

The One Arm Nun and her disciple, Ah Ko, later ambushes the procession. Fighting to a standstill with Lung-er, the assailants escape with Ying-hung and Siu-bo. However, Siu-bo garners some respect from her when he reveals his dual identity as a Heaven and Earth Society commander. Lung-er finally catches up to them with reinforcements at an inn but only manages to rescue Siu-bo. Having been saved by Ying-hung before, Ah Ko elopes with him amid the confusion.', N'https://www.youtube.com/embed/XnMo_5ovSGE', 231, 9, N'https://drive.google.com/uc?id=1F2FkxwFjR94NMXuzkNGL49ipLFSX0cfB')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P07', N'The Forbidden Kingdom', N'Vo Thuat', N'https://drive.google.com/uc?id=1x1TYCAzYThswaqTMv4tkTtnrGuKphoOt', N'https://drive.google.com/uc?id=1kdWelcjgstwXlTgdDCQW8oPmRks-hpCZ', N'Lee Lien Kiet', CAST(N'2002-01-05' AS Date), N'The Forbidden Kingdom (Chinese: ????: Gong Fu Zhi Wang (Mandarin) or Gung Fu Ji Wong (Cantonese) and translated King of Kung Fu (English); Working title: The J & J Project[5]) is a 2008 wuxia film written by John Fusco, and directed by Rob Minkoff, and starring Jackie Chan and Jet Li. Loosely based on the 16th century novel Journey to the West, it is the first film to co-star Jackie Chan and Jet Li. The action sequences were choreographed by Yuen Woo-ping.
The film is distributed in the United States through Lionsgate and The Weinstein Company,[6] and through The Huayi Brothers Film & Taihe Investment Company in China. It was released on DVD and Blu-ray in the US and Hong Kong on September 9, 2008 and the United Kingdom on November 17, 2008. Rotten Tomatoes'' critical consensus praises the fight scenes but says the film has too much filler. The Forbidden Kingdom grossed $128 million against a budget of $55 million.
', N'https://www.youtube.com/embed/qvuTYfTnGn4', 1251, 5, N'https://drive.google.com/uc?id=1OZFI8SmhZarNAtvrzEwUZwzfEvacwu6G')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P08', N'Duken Master', N'Vo Thuat', N'https://drive.google.com/uc?id=1X8F5A_HML45wpM4CNHfKozbpO-xYsdky', N'https://drive.google.com/uc?id=1S4Y7Q1HLlaA1PA5WzKhKpLT57CYmCwhd', N'Jacken Chan', CAST(N'1983-06-07' AS Date), N'Drunken Master (Chinese: ??; lit. ''drunken fist'') is a 1978 Hong Kong action comedy martial arts film directed by Yuen Woo-ping, and starring Jackie Chan, Yuen Siu-tien, and Hwang Jang-lee.[1] The film was a success at the Hong Kong box office, earning two and a half times the amount of Yuen''s and Chan''s previous film, Snake in the Eagle''s Shadow, which was also considered a successful film.[2][3]
It is an early example of the kung fu comedy genre, for which Jackie Chan became famous. The film popularised the Zui Quan ("drunken fist") fighting style. It was ranked number 3 on GamesRadar''s list of 50 greatest kung fu movies of all time.[4] It spawned an official sequel, Drunken Master II (1994), and several spin-offs.', N'https://www.youtube.com/embed/KQMNllz6aE0', 1531, 5, N'https://drive.google.com/uc?id=1a5HtybzO7mVC69M9ugr3yFtedrrKpefg')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P09', N'IP Man 4', N'Vo Thuat', N'https://drive.google.com/uc?id=10QnBGK-DucktPkMeGsXNDwgLD9O-71Sp', N'https://drive.google.com/uc?id=1LdcdC1ZlqjaiDdi8p_sfOlF2cdl9svFx', N'Chan Tu Dan', CAST(N'2019-08-09' AS Date), N'In 1964, following the death of his wife, Ip Man discovers he has throat cancer due to chronic smoking. After his rebellious son Ip Ching fights back against a school bully and is subsequently expelled, Ip Man decides to travel to San Francisco in order to look for study opportunities. He entrusts Ching to his friend, Fat Bo, and promises to call Ching every night.
Ip''s student, Bruce Lee, has upset the local martial arts community in San Francisco by opening a Wing Chun school, teaching non-Chinese people martial arts, and writing an English-language book on martial arts.[6] He discovers from his friend Liang Gen that because Ip is a foreigner, a referral letter from the Chinese Consolidated Benevolent Association is needed to enroll Ching into an American school. Grandmaster Wan Zhong-hua, the Association''s president, refuses to write the letter as Ip is unbothered by Lee''s actions, whereas the other grandmasters display open contempt. After a brief confrontation with Wan, resulting in a broken tabletop, Ip leaves.
', N'https://www.youtube.com/embed/dj7Rf1OvsVc', 991, 5, N'https://drive.google.com/uc?id=17x-Vr62eHgbGp4swOarFgFm6rzamJEKx')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P10', N'Kungfu Panda 1', N'Hoat Hinh', N'https://drive.google.com/uc?id=1oliVi0ksguR5RLWTe1ZZXbyN7a5L2Cl3', N'https://drive.google.com/uc?id=1PJHmuXwES8dRZUrWDYHGxqB-XYFsFz4x', N'JackBlack-Po', CAST(N'2006-12-11' AS Date), N'The franchise, set in a fantasy wuxia genre version of ancient China populated by anthropomorphic animals, features the adventures of Po Ping, a giant panda, who was improbably chosen as the prophesied Dragon Warrior. Although his status is initially doubted, Po proves himself worthy as he strives to fulfill his destiny and learn about his past with his new friends.

The film series has been highly acclaimed with its first two features being nominated for the Academy Award for Best Animated Feature as well as numerous Annie Awards while the television series has won 11 Emmy Awards. The first three films were the most financially successful animated feature film for their years[1] and the second is the second biggest worldwide box office success for a film directed solely by a woman (Jennifer Yuh Nelson), after Wonder Woman.', N'https://www.youtube.com/embed/PXi3Mv6KMzY', 1231, 5, N'https://drive.google.com/uc?id=1iAS9yT_JjYuZ50fNEl_iyejlp1jK2zzn')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P11', N'Kungfu Panda2', N'Hoat Hinh', N'https://drive.google.com/uc?id=1vcShSrnv-wa85LanLLK3OEACgpeGpPGP', N'https://drive.google.com/uc?id=1-4g_3lvyrCz9LZhNTzupIM3froCTBINR', N'JackBlack-Po', CAST(N'2009-07-09' AS Date), N'Kung Fu Panda 2 is a 2011 American computer-animated wuxia comedy film produced by DreamWorks Animation and distributed by Paramount Pictures. It is the sequel to Kung Fu Panda (2008) and the second installment in the Kung Fu Panda franchise. Directed by Jennifer Yuh Nelson (in her feature directorial debut), the film stars Jack Black, Angelina Jolie, Dustin Hoffman, Seth Rogen, Lucy Liu, David Cross, James Hong, and Jackie Chan reprising their character roles from the first film, with Gary Oldman, Michelle Yeoh, Danny McBride, Dennis Haysbert, Jean-Claude Van Damme, and Victor Garber voicing new characters.

In the film, Po and the Furious Five battle an evil white peacock ruler named Lord Shen, who has a powerful weapon that he plans to use to conquer China. Meanwhile, Po discovers a terrifying secret about his past, and discovers that Shen may have something to do with it. Compared to its predecessor, Kung Fu Panda 2 employs a much darker tone paired with a far more threatening antagonist in the form of Lord Shen, and tackles more difficult and complex themes, such as adoption.', N'https://www.youtube.com/embed/FQ63rqSRrEI', 1531, 5, N'https://drive.google.com/uc?id=1iAS9yT_JjYuZ50fNEl_iyejlp1jK2zzn')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P12', N'Kungfu Panda 3', N'Hoat Hinh', N'https://drive.google.com/uc?id=1dlyV51zHJEu3e-tJ8AWskXtqs3sB0ddy', N'https://drive.google.com/uc?id=15kSdB_IVVRzRyNU0pvO7dqwO7oIsyMV_', N'JackBlack-Po', CAST(N'2018-05-02' AS Date), N'Kung Fu Panda 3 is a 2016 computer-animated wuxia comedy film produced by DreamWorks Animation and distributed by 20th Century Fox worldwide and by Oriental DreamWorks in China. It is the third and final film in the Kung Fu Panda franchise and the sequel to Kung Fu Panda 2 (2011). In the film, Po enters the panda village and re-unites with his birth father and other pandas, but problems arise when a villainous undead warrior named Kai, returns to the mortal realm and steals chi from the kung fu masters, with the goal of ending Oogway''s legacy. To prevent Kai from taking chi from all kung fu masters and pandas, Po forms the army of pandas to battle Kai''s jade minions and Po must become a master of chi to defeat him and save his friends.

The film is directed by Jennifer Yuh Nelson and Alessandro Carloni and written by Jonathan Aibel and Glenn Berger. Jack Black, Dustin Hoffman, Angelina Jolie, Lucy Liu, Seth Rogen, David Cross, James Hong and Jackie Chan reprise their roles from the previous films with Randall Duk Kim reprising his role of Oogway from the first film. They are joined by Bryan Cranston (replacing Fred Tatasciore, who went on to voice Master Bear), J. K. Simmons and Kate Hudson in the roles of Li Shan, Kai, and Mei Mei, respectively.', N'https://www.youtube.com/embed/10r9ozshGVE', 3414, 5, N'https://drive.google.com/uc?id=1iAS9yT_JjYuZ50fNEl_iyejlp1jK2zzn')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P13', N'Dragon Ball Super', N'Phim Bo', N'https://drive.google.com/uc?id=1aPRVokgOEoGnUMb-G5MXty9q91X_TrQn', N'https://drive.google.com/uc?id=1FZnZo-zq3OeIPxjz9bK0__dXcAtR8GFf', N'GOKU', CAST(N'2016-05-07' AS Date), N'Dragon Ball Super (Japanese: ????????????, Hepburn: Doragon Boru Supa) is a Japanese manga series and anime television series. The series is a sequel to the original Dragon Ball manga, with its overall plot outline written by creator Akira Toriyama. The manga is illustrated by Toyotarou, with story and editing by Toriyama, and began serialization in Shueisha''s shonen manga magazine V Jump in June 2015. The anime was produced by Toei Animation, with individual episodes written by different screenwriters, and aired on Fuji TV from July 2015 to March 2018.

The series chronicles the adventures of Goku during the ten-year timeskip after the defeat of Majin Buu.[3] Following a retelling of the events of the films Battle of Gods (2013) and Resurrection ''F'' (2015), where Goku attains the powers of a god, he must learn to use this newly discovered powers under the gods of his universe.

A theatrical film sequel titled Dragon Ball Super: Broly was released in December 2018. Its English dub was released in January 2019.', N'https://www.youtube.com/embed/wuIbeQv3v7c', 20130, 5, N'https://drive.google.com/uc?id=168pT-lI1sWAgN0GJZx21cuEDSHAu4pRL')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P14', N'One Piece', N'Phim Bo', N'https://drive.google.com/uc?id=1B7cxR600AZXFG8aHotlq8529PGDrsDX1', N'https://drive.google.com/uc?id=1MoEfIBdphvNjGk3UlmIc1cAZZ_QLf1GI', N'Luffy', CAST(N'1999-09-05' AS Date), N'One Piece is a Japanese manga series written and illustrated by Eiichiro Oda. It has been serialized in Shueisha''s Weekly Shonen Jump magazine since July 1997, with its individual chapters compiled into 98 tankobon volumes as of February 2021. The story follows the adventures of Monkey D. Luffy, a boy whose body gained the properties of rubber after unintentionally eating a Devil Fruit. With his crew of pirates, named the Straw Hat Pirates, Luffy explores the Grand Line in search of the world''s ultimate treasure known as "One Piece" in order to become the next King of the Pirates.

The manga spawned a media franchise, having been adapted into a festival film produced by Production I.G, and an anime series produced by Toei Animation, which began broadcasting in Japan in 1999. Additionally, Toei has developed fourteen animated feature films, one original video animation and thirteen television specials. Several companies have developed various types of merchandising and media, such as a trading card game and numerous video games. The manga series was licensed for an English language release in North America and the United Kingdom by Viz Media and in Australia by Madman Entertainment. The anime series was licensed by 4Kids Entertainment for an English-language release in North America in 2004, before the license was dropped and subsequently acquired by Funimation in 2007.', N'https://www.youtube.com/embed/S8_YwFLCh4U', 18327, 7, N'https://drive.google.com/uc?id=1P4lTmE167n8mfhC1W4K0gzvNiorvqZDW')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P15', N'Tan Thuy Hu', N'Phim Bo', N'https://drive.google.com/uc?id=1sK1je0NUAgXoj1vfyd-iTFyiILpDM96Y', N'https://drive.google.com/uc?id=1b7e3x0lGikwYPjaacOuOzyWxUc6acEtM', N'Tong Giang', CAST(N'2012-11-12' AS Date), N'Water Margin (simplified Chinese: ???; traditional Chinese: ???; pinyin: Shuihu Zhuàn), also translated as Outlaws of the Marsh, Tale of the Marshes or All Men Are Brothers,[note 1] is a 14th-century Chinese novel attributed to Shi Nai''an. Considered one of the Four Great Classical Novels of Chinese literature, the novel is written in vernacular Chinese rather than Literary Chinese.[1]

The story, set in the Northern Song''s ending, tells of how a group of 108 outlaws gather at Mount Liang (or Liangshan Marsh) to form a sizable army before they are eventually granted amnesty by the government and sent on campaigns to resist foreign invaders (Liao) and suppress rebel forces (Fang La). It has introduced readers to many of the best-known characters in Chinese literature, such as Song Jiang, Wu Song, Lin Chong and Lu Zhishen.', N'https://www.youtube.com/embed/Zw1UraI20B8', 121, 4, N'https://drive.google.com/uc?id=1QmVS-B67Z0sruvpDEWDXZwnlJyW1jBvf')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P19', N'Do Rav Mon', N'hanh fong', N'https://drive.google.com/uc?id=1koWEsw9C2OcHah96YyipmJOb4DKkpIp1', N'https://drive.google.com/uc?id=16Ye_PGwSsT3-Q6q4LfxTxQ6pyyp9cCp9', N'DoravMon', CAST(N'2021-03-03' AS Date), N'Doraemon is a fictional character in the Japanese manga and anime series of the same name created by Fujiko Fujio, the pen name of writing team Hiroshi Fujimoto and Motoo Abiko. He is a male robotic cat that travels back in time from the 22nd century to aid a preteen boy named Nobita.', N'https://www.youtube.com/embed/-XJAOLcSECE', 165, 4, N'https://drive.google.com/uc?id=1B7AZXCoc57tp4HoaPOePDiGW1kqXKimr')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P20', N'Under world', N'Kinh Di', N'https://drive.google.com/uc?id=1zACSkTZfc9mUCH_w9qRJcB6lT9qlkBb5', N'https://drive.google.com/uc?id=13m0SKCtSs93i8LgQ9Oy6bBNMtzqKLT9L', N'kate beckinsale', CAST(N'2021-01-04' AS Date), N'Underworld is a series of action horror films created by Len Wiseman, Kevin Grevioux, and Danny McBride, that follows characters who are caught up in a war between vampires and werewolves. Most of the movies star Kate Beckinsale as the protagonist, Selene', N'https://www.youtube.com/embed/bt7UzQYKOXc', 322, 9, N'https://drive.google.com/uc?id=1yVk2iuplAMxjBxg4HXmXHYMr1MaTHv2s')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P21', N'Under world 2', N'Kinh Di', N'https://drive.google.com/uc?id=1g7u9Yy__9U4LG3Hr380gda61XZQU3u1b', N'https://drive.google.com/uc?id=13m0SKCtSs93i8LgQ9Oy6bBNMtzqKLT9L', N'kate beckinsale', CAST(N'2019-01-16' AS Date), N'Underworld is a series of action horror films created by Len Wiseman, Kevin Grevioux, and Danny McBride, that follows characters who are caught up in a war between vampires and werewolves. Most of the movies star Kate Beckinsale as the protagonist, Selene
Underworld is a series of action horror films created by Len Wiseman, Kevin Grevioux, and Danny McBride, that follows characters who are caught up in a war between vampires and werewolves. Most of the movies star Kate Beckinsale as the protagonist, Selene', N'https://www.youtube.com/embed/rKHL5PyAPzs', 14113, 8, N'https://drive.google.com/uc?id=1yVk2iuplAMxjBxg4HXmXHYMr1MaTHv2s')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P22', N'Lanh Tho Viet Nam', N'Phim Tai Lieu', N'https://drive.google.com/uc?id=1iCptp7UwFMTXpG9MqEkUL-5fqFttOHX7', N'https://drive.google.com/uc?id=1-USvrEtwrczQ9kOkiNsDJqX-nGdt1bWM', N'N/A', CAST(N'1990-06-12' AS Date), N'L?ch s? Vi?t Nam n?u tính t? lúc có m?t con ngu?i sinh s?ng thì dã có hàng v?n nam tru?c Công nguyên, còn tính t? khi co c?u nhà nu?c du?c hình thành thì m?i kho?ng t? 700 nam tru?c công nguyên.

Các nhà kh?o c? dã tìm th?y các di tích ch?ng minh loài ngu?i dã t?ng s?ng t?i Vi?t Nam t? th?i d?i d? dá cu thu?c n?n van hóa Tràng An, Ngu?m, Son Vi và Soi Nh?. Vào th?i k? d? dá m?i, n?n van hóa Hòa Bình – B?c Son t?i vùng này dã phát tri?n v? chan nuôi và nông nghi?p, d?c bi?t là k? thu?t tr?ng lúa nu?c. Nh?ng ngu?i Vi?t ti?n s? trên vùng châu th? sông H?ng – Van minh sông H?ng và sông Mã này dã khai hóa d?t d? tr?ng tr?t, t?o ra m?t h? th?ng dê di?u d? ch? ng? nu?c l?t c?a các sông, dào kênh d? ph?c v? cho vi?c tr?ng lúa và dã t?o nên n?n van minh lúa nu?c và van hóa làng xã

Truy?n thuy?t k? r?ng t? nam 2879 TCN, nhà nu?c Xích Qu? c?a ngu?i Vi?t dã hình thành, cùng th?i v?i truy?n thuy?t v? Tam Hoàng Ngu Ð? t?i Trung Qu?c. Tuy nhiên, dây ch? là truy?n thuy?t dân gian, các nghiên c?u kh?o c? hi?n chua tìm du?c b?ng ch?ng nào cho th?y nhà nu?c này t?ng t?n t?i.

Ð?n th?i k? d? s?t, vào kho?ng th? k? 8 TCN dã xu?t hi?n nhà nu?c d?u tiên c?a ngu?i Vi?t trên mi?n B?c Vi?t Nam ngày nay. Theo s? sách, dó là Nhà nu?c Van Lang c?a các vua Hùng. Th?i k? Vua Hùng du?c nhi?u ngu?i ghi nh?n là qu?c gia có t? ch?c d?u tiên c?a ngu?i Vi?t Nam, b?t d?u v?i truy?n thuy?t Con R?ng cháu Tiên mà ngu?i Vi?t Nam t? hào truy?n mi?ng t? d?i này qua d?i khác', N'https://www.youtube.com/embed/xQhs4anN4ko', 412, 8, N'https://drive.google.com/uc?id=1yeRXoAeDc2Mz1OxwTVMMEhNrAXqE-iMg')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P23', N'Bo Gia', N'tinh cam', N'https://drive.google.com/uc?id=1mTbmRed0F0Baeb5wXvPCURpoeVTs5F1R', N'https://drive.google.com/uc?id=1JJVvxwwoMf30cROSa-ev5OE7KKTgC0vS', N'Tran Thanh', CAST(N'2021-03-26' AS Date), N'he previous record was held two years ago by “Cua lai vo bau” (Flirt with pregnant wife again), which also starred Tran Thanh, with domestic ticket sales reaching VND191.8 billion. Action film “Hai Phuong” (Furie) collected up to VND200 billion, but the film was screened in the United States, Canada and China.

Released on March 5, “Old Father” has set new records for the fastest Vietnamese movie to reach ticket sales of VND100 billion and VND200 billion. The film collected VND100 billion in just four days after being released, beating the previous record of six days held by "Gai Gia Lam Chieu 3" (The Last Egg 3).', N'https://www.youtube.com/embed/jluSu8Rw6YE', 19879, 9, N'https://drive.google.com/uc?id=1eVgNgQO7ubQE_T08_ncOqKDu9nTdcPG-')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P25', N'Raya & the Last Drg', N'Hoat Hinh', N'https://drive.google.com/uc?id=1KuEi6vBi9kWjm1l32QQO5rAzEnv-2Ud0', N'https://drive.google.com/uc?id=1Cuij63PcA-AfzMxSY5d586OnwJep5mSy', N'Kelly Marie', CAST(N'2021-03-27' AS Date), N'Raya and the Last Dragon (/''ra?.?/ RYE-?) is a 2021 American computer-animated fantasy action-adventure film produced by Walt Disney Pictures and Walt Disney Animation Studios, and distributed by Walt Disney Studios Motion Pictures. The 59th film produced by the studio, it is directed by Don Hall and Carlos López Estrada, co-directed by Paul Briggs and John Ripa,[4] produced by Osnat Shurer and Peter Del Vecho, written by Qui Nguyen and Adele Lim, and music composed by James Newton Howard.', N'https://www.youtube.com/embed/orOj_tb-2sg', 18340, 8, N'https://drive.google.com/uc?id=1Fh5u_Honsav6wB70KJ4qQClW5iRerjfi')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P31', N'Justice League', N'hanh fong', N'https://drive.google.com/uc?id=1wz-Tmwa36dOiCSx8kBZjLi0GNz4S6qWI', N'https://drive.google.com/uc?id=1In8qAPytJkqGhj7vjV_kto5ZX49MJWME', N'Super Man siêu cấp vip pro', CAST(N'2021-03-25' AS Date), N'Fueled by his restored faith in humanity and inspired by Superman''s selfless act, Bruce Wayne enlists newfound ally Diana Prince to face an even greater threat. Together, Batman and Wonder Woman work quickly to recruit a team to stand against this newly awakened enemy', N'https://www.youtube.com/embed/7eon2nammV8', 17647, 9, N'https://drive.google.com/uc?id=1uPRo9xezPZo3rExDBU5kzk6OVdF_aesh')
INSERT [dbo].[Phim] ([IDP], [TenPhim], [TheLoai], [Poster], [Image], [DienVien], [timePost], [MoTa], [Trailer], [luotView], [Rate], [Anhdienvien]) VALUES (N'P434', N'Godzilla vs. Kong', N'hanh fong', N'https://drive.google.com/uc?id=1C3Jr8VB0EUkByxmSOhGkzuHpxxXoClky', N'https://drive.google.com/uc?id=1QjhNcUxI6z7hpvFB8zecwjB8LD24dsW8', N'Kong simple', CAST(N'2021-04-01' AS Date), N'Kong and his protectors undertake a perilous journey to find his true home. Along for the ride is Jia, an orphaned girl who has a unique and powerful bond with the mighty beast. However, they soon find themselves in the path of an enraged Godzilla as he cuts a swath of destruction across the globe. The initial confrontation between the two titans -- instigated by unseen forces -- is only the beginning of the mystery that lies deep within the core of the planet.', N'https://www.youtube.com/embed/odM92ap8_c0', 6, 9, N'https://drive.google.com/uc?id=1GAPNZIbPqf4GhCAzSCcKPLR-27lx1v7G')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P19', N'A01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P434', N'A01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P09', N'U01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P31', N'A01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P01', N'U0211')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P01', N'U01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P01', N'U02')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P02', N'U02')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P03', N'U02')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P04', N'U02')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P10', N'U04')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P12', N'U04')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P07', N'U04')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P21', N'A01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P434', N'U44')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P23', N'U01')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P23', N'U05')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P09', N'U05')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P19', N'U05')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P02', N'U05')
INSERT [dbo].[Uathich] ([IDP], [IDAC]) VALUES (N'P31', N'U01')
ALTER TABLE [dbo].[cacTap]  WITH CHECK ADD FOREIGN KEY([IDP])
REFERENCES [dbo].[Phim] ([IDP])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([IDP])
REFERENCES [dbo].[Phim] ([IDP])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([IDAC])
REFERENCES [dbo].[Account] ([IDAC])
GO
ALTER TABLE [dbo].[Uathich]  WITH CHECK ADD FOREIGN KEY([IDAC])
REFERENCES [dbo].[Account] ([IDAC])
GO
ALTER TABLE [dbo].[Uathich]  WITH CHECK ADD FOREIGN KEY([IDP])
REFERENCES [dbo].[Phim] ([IDP])
GO
USE [master]
GO
ALTER DATABASE [webPhimhhs] SET  READ_WRITE 
GO
