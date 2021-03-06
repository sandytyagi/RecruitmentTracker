USE [master]
GO
/****** Object:  Database [RecruitmentTracker]    Script Date: 11/13/2018 10:50:33 PM ******/
CREATE DATABASE [RecruitmentTracker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecruitmentTracker', FILENAME = N'C:\Users\sktyagi\RecruitmentTracker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecruitmentTracker_log', FILENAME = N'C:\Users\sktyagi\RecruitmentTracker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RecruitmentTracker] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecruitmentTracker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecruitmentTracker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecruitmentTracker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecruitmentTracker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecruitmentTracker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecruitmentTracker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RecruitmentTracker] SET  MULTI_USER 
GO
ALTER DATABASE [RecruitmentTracker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecruitmentTracker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecruitmentTracker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecruitmentTracker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecruitmentTracker] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecruitmentTracker] SET QUERY_STORE = OFF
GO
USE [RecruitmentTracker]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RecruitmentTracker]
GO
/****** Object:  Table [dbo].[Candidate_details]    Script Date: 11/13/2018 10:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate_details](
	[Candidate_Id] [int] NOT NULL,
	[Full_Name] [nvarchar](200) NOT NULL,
	[Phone] [numeric](12, 0) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Qualification] [nvarchar](300) NOT NULL,
	[Experience] [float] NOT NULL,
 CONSTRAINT [PK_Candidate_details] PRIMARY KEY CLUSTERED 
(
	[Candidate_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate_Status]    Script Date: 11/13/2018 10:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate_Status](
	[Candidate_Status_Id] [int] NOT NULL,
	[Candidate_Id] [int] NOT NULL,
	[Round1] [int] NULL,
	[Rouund1_Feedback] [nvarchar](2000) NULL,
	[Round2] [int] NULL,
	[Round2_Feedback] [nvarchar](2000) NULL,
	[Round3] [int] NULL,
	[Round3_Feedback] [nvarchar](2000) NULL,
	[Round4] [int] NULL,
	[Round4_Feedback] [nvarchar](2000) NULL,
	[Round5] [int] NULL,
	[Round5_Feedback] [nvarchar](2000) NULL,
	[Round6] [int] NULL,
	[Round6_Feedback] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Candidate_Status] PRIMARY KEY CLUSTERED 
(
	[Candidate_Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/13/2018 10:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] NOT NULL,
	[Status_Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/13/2018 10:50:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Users_Id] [int] NOT NULL,
	[User_Name] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[User_Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Users_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Candidate_details] ([Candidate_Id], [Full_Name], [Phone], [Email], [Qualification], [Experience]) VALUES (1, N'Candidate1', CAST(1234567890 AS Numeric(12, 0)), N'abc@ab.com', N'abc', 2)
INSERT [dbo].[Candidate_details] ([Candidate_Id], [Full_Name], [Phone], [Email], [Qualification], [Experience]) VALUES (2, N'Candidate2', CAST(987654321 AS Numeric(12, 0)), N'abc1@ab.com', N'abc1', 2.5)
INSERT [dbo].[Candidate_Status] ([Candidate_Status_Id], [Candidate_Id], [Round1], [Rouund1_Feedback], [Round2], [Round2_Feedback], [Round3], [Round3_Feedback], [Round4], [Round4_Feedback], [Round5], [Round5_Feedback], [Round6], [Round6_Feedback]) VALUES (1, 1, 2, N'Candidate has passed tech test.', 4, N'', 4, NULL, 4, NULL, 4, NULL, 4, NULL)
INSERT [dbo].[Candidate_Status] ([Candidate_Status_Id], [Candidate_Id], [Round1], [Rouund1_Feedback], [Round2], [Round2_Feedback], [Round3], [Round3_Feedback], [Round4], [Round4_Feedback], [Round5], [Round5_Feedback], [Round6], [Round6_Feedback]) VALUES (2, 2, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL, 5, NULL)
INSERT [dbo].[Status] ([Status_Id], [Status_Description]) VALUES (1, N'NA')
INSERT [dbo].[Status] ([Status_Id], [Status_Description]) VALUES (2, N'Pass')
INSERT [dbo].[Status] ([Status_Id], [Status_Description]) VALUES (3, N'Failed')
INSERT [dbo].[Status] ([Status_Id], [Status_Description]) VALUES (4, N'Pending')
INSERT [dbo].[Status] ([Status_Id], [Status_Description]) VALUES (5, N'Not Started')
INSERT [dbo].[Users] ([Users_Id], [User_Name], [Password], [User_Type]) VALUES (1, N'User', N'1234', N'Admin')
ALTER TABLE [dbo].[Candidate_Status] ADD  CONSTRAINT [DF_Candidate_Status_Round1]  DEFAULT ((5)) FOR [Round1]
GO
ALTER TABLE [dbo].[Candidate_Status] ADD  CONSTRAINT [DF_Candidate_Status_Round2]  DEFAULT ((5)) FOR [Round2]
GO
ALTER TABLE [dbo].[Candidate_Status] ADD  CONSTRAINT [DF_Candidate_Status_Round3]  DEFAULT ((5)) FOR [Round3]
GO
ALTER TABLE [dbo].[Candidate_Status] ADD  CONSTRAINT [DF_Candidate_Status_Round4]  DEFAULT ((5)) FOR [Round4]
GO
ALTER TABLE [dbo].[Candidate_Status] ADD  CONSTRAINT [DF_Candidate_Status_Round5]  DEFAULT ((5)) FOR [Round5]
GO
ALTER TABLE [dbo].[Candidate_Status] ADD  CONSTRAINT [DF_Candidate_Status_Round6]  DEFAULT ((5)) FOR [Round6]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Candidate_Status_Candidate_details] FOREIGN KEY([Candidate_Id])
REFERENCES [dbo].[Candidate_details] ([Candidate_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Candidate_Status_Candidate_details]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Round1_Status_Candidate_Status] FOREIGN KEY([Round1])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Round1_Status_Candidate_Status]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Round2_Status_Candidate_Status] FOREIGN KEY([Round2])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Round2_Status_Candidate_Status]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Round3_Status_Candidate_Status] FOREIGN KEY([Round3])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Round3_Status_Candidate_Status]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Round4_Status_Candidate_Status] FOREIGN KEY([Round4])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Round4_Status_Candidate_Status]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Round5_Status_Candidate_Status] FOREIGN KEY([Round5])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Round5_Status_Candidate_Status]
GO
ALTER TABLE [dbo].[Candidate_Status]  WITH CHECK ADD  CONSTRAINT [FK_Round6_Status_Candidate_Status] FOREIGN KEY([Round6])
REFERENCES [dbo].[Status] ([Status_Id])
GO
ALTER TABLE [dbo].[Candidate_Status] CHECK CONSTRAINT [FK_Round6_Status_Candidate_Status]
GO
USE [master]
GO
ALTER DATABASE [RecruitmentTracker] SET  READ_WRITE 
GO
