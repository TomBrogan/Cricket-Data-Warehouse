USE [CricketRec]
GO

/****** Object:  Table [dbo].[ScorecardBattingRow]    Script Date: 03/12/2016 23:58:19 ******/
DROP TABLE [dbo].[ScorecardBattingRow]
GO

/****** Object:  Table [dbo].[ScorecardBattingRow]    Script Date: 03/12/2016 23:58:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ScorecardBattingRow](
	[MatchUrl] [varchar](800) NULL,
	[MatchNum] [int] NULL,
	[InningsNum] [int] NULL,
	[InningsName] [varchar](8000) NULL,
	[Team] [varchar](8000) NULL,
	[BowlingTeam] [varchar](8000) NULL,
	[BattingOrder] [int] NULL,
	[PlayerName] [varchar](8000) NULL,
	[Surname] [varchar](8000) NULL,
	[PlayerUrl] [varchar](8000) NULL,
	[Dismissal] [varchar](8000) NULL,
	[DismissalName] [varchar](500) NULL,
	[DismissedCount] [int] NULL,
	[BowlerName] [varchar](500) NULL,
	[FielderName] [varchar](500) NULL,
	[RunsScored] [int] NULL,
	[MinutesBatted] [int] NULL,
	[BallsFaced] [int] NULL,
	[BoundaryFours] [int] NULL,
	[BoundarySixes] [int] NULL,
	[UseFullName] [varchar](1) NOT NULL,
	[CommentaryName] [varchar](8000) NULL,
	[Byes] [int] NULL,
	[LegByes] [int] NULL,
	[Wides] [int] NULL,
	[NoBalls] [int] NULL,
	[PenaltyRuns] [int] NULL,
	[WidesCountedAgainstBowler] [varchar](2) NULL,
	[BallByBallDataAvailable] [varchar](2) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


