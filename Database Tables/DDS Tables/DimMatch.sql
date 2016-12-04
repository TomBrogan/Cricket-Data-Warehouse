USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimMatch]    Script Date: 04/12/2016 00:20:11 ******/
DROP TABLE [dbo].[DimMatch]
GO

/****** Object:  Table [dbo].[DimMatch]    Script Date: 04/12/2016 00:20:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimMatch](
	[DimMatchID] [int] IDENTITY(1,1) NOT NULL,
	[MatchUrl] [nvarchar](800) NULL,
	[MatchNum] [int] NULL,
	[MatchName] [nvarchar](800) NULL,
	[TestName] [nvarchar](800) NULL,
	[TestNum] [int] NULL,
	[ODIName] [nvarchar](800) NULL,
	[ODINum] [int] NULL,
	[MatchDates] [nvarchar](800) NULL,
	[HomeTeam] [nvarchar](800) NULL,
	[AwayTeam] [nvarchar](800) NULL,
	[TossResult] [nvarchar](800) NULL,
	[CommentaryAvailable] [nvarchar](10) NULL,
	[OversPerTeam] [int] NULL,
	[TimeOfDay] [nvarchar](800) NULL,
 CONSTRAINT [PK_DimMatch] PRIMARY KEY CLUSTERED 
(
	[DimMatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


