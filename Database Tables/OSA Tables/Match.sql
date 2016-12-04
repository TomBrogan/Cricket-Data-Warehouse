USE [CricketOSA]
GO

/****** Object:  Table [dbo].[Match]    Script Date: 03/12/2016 16:00:21 ******/
DROP TABLE [dbo].[Match]
GO

/****** Object:  Table [dbo].[Match]    Script Date: 03/12/2016 16:00:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Match](
	[Url] [varchar](800) NULL,
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


