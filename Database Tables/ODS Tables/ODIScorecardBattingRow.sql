USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIScorecardBattingRow]    Script Date: 03/12/2016 23:57:53 ******/
DROP TABLE [dbo].[ODIScorecardBattingRow]
GO

/****** Object:  Table [dbo].[ODIScorecardBattingRow]    Script Date: 03/12/2016 23:57:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIScorecardBattingRow](
	[MatchUrl] [varchar](800) NULL,
	[ODIName] [varchar](8000) NULL,
	[InningsNum] [varchar](8000) NULL,
	[InningsName] [varchar](8000) NULL,
	[Team] [varchar](8000) NULL,
	[BowlingTeam] [varchar](8000) NOT NULL,
	[BattingOrder] [int] NULL,
	[PlayerName] [varchar](8000) NULL,
	[Surname] [varchar](8000) NULL,
	[PlayerUrl] [varchar](8000) NULL,
	[Dismissal] [varchar](8000) NULL,
	[DismissalName] [varchar](21) NULL,
	[DismissedCount] [int] NULL,
	[BowlerName] [varchar](1000) NULL,
	[FielderName] [varchar](8000) NULL,
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
	[WidesCountedAgainstBowler] [varchar](1) NOT NULL,
	[BallByBallDataAvailable] [varchar](1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


