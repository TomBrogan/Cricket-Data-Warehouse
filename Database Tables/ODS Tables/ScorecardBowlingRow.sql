USE [CricketRec]
GO

/****** Object:  Table [dbo].[ScorecardBowlingRow]    Script Date: 03/12/2016 23:58:24 ******/
DROP TABLE [dbo].[ScorecardBowlingRow]
GO

/****** Object:  Table [dbo].[ScorecardBowlingRow]    Script Date: 03/12/2016 23:58:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ScorecardBowlingRow](
	[Url] [varchar](200) NOT NULL,
	[MatchNum] [int] NULL,
	[InningsNum] [int] NULL,
	[Title] [varchar](800) NULL,
	[BowlingTeam] [varchar](800) NULL,
	[BattingTeam] [varchar](800) NULL,
	[BowlingTeamAtHome] [varchar](2) NULL,
	[BowlingPosition] [int] NULL,
	[PlayerUrl] [varchar](800) NULL,
	[Bowler] [varchar](200) NULL,
	[Surname] [varchar](200) NULL,
	[CommentaryName] [varchar](200) NULL,
	[Overs] [varchar](200) NULL,
	[FullOvers] [int] NULL,
	[PartOver] [int] NULL,
	[BallsPerOver] [int] NULL,
	[Deliveries] [int] NULL,
	[Maidens] [int] NULL,
	[Runs] [int] NULL,
	[Wickets] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


