USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIMatch]    Script Date: 03/12/2016 16:01:07 ******/
DROP TABLE [dbo].[ODIMatch]
GO

/****** Object:  Table [dbo].[ODIMatch]    Script Date: 03/12/2016 16:01:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIMatch](
	[Url] [varchar](800) NOT NULL,
	[SeriesText] [varchar](800) NULL,
	[HomeTeam] [varchar](800) NULL,
	[AwayTeam] [varchar](800) NULL,
	[Result] [varchar](800) NULL,
	[Ground] [varchar](800) NULL,
	[GroundUrl] [varchar](800) NULL,
	[MatchDate] [varchar](800) NULL,
	[TossResult] [varchar](800) NULL,
	[PlayerOfTheMatch] [varchar](800) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


