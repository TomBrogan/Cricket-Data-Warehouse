USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIMatch]    Script Date: 03/12/2016 23:57:37 ******/
DROP TABLE [dbo].[ODIMatch]
GO

/****** Object:  Table [dbo].[ODIMatch]    Script Date: 03/12/2016 23:57:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIMatch](
	[Url] [varchar](800) NOT NULL,
	[ODIName] [varchar](8000) NULL,
	[SeriesText] [varchar](800) NULL,
	[SeriesName] [varchar](800) NULL,
	[HomeTeam] [varchar](800) NULL,
	[AwayTeam] [varchar](800) NULL,
	[Result] [varchar](800) NULL,
	[HomeAwayResult] [varchar](800) NULL,
	[Ground] [varchar](800) NULL,
	[GroundUrl] [varchar](800) NULL,
	[MatchDate] [varchar](800) NULL,
	[DayNum] [varchar](800) NULL,
	[StartMonth] [varchar](9) NULL,
	[StartMonthNum] [varchar](2) NULL,
	[StartYear] [varchar](4) NULL,
	[DimMatchStartDateKey] [int] NULL,
	[TossResult] [varchar](800) NULL,
	[TossWinningTeam] [varchar](800) NULL,
	[TossDecision] [varchar](8000) NULL,
	[PlayerOfTheMatch] [varchar](800) NULL,
	[OversPerTeam] [int] NULL,
	[TimeOfDay] [varchar](9) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


