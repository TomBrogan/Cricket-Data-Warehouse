USE [CricketRec]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_IssueDetected]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_UpdatedReason]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_UpdatedFrom]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_InsertedFrom]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_BallCount]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Extras]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_BowlerWicket]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_BowlerConceded]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_BatsmanRuns]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_TeamWickets]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_TeamRuns]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Commentary]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Result]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Batsman]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Bowler]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_BallNum]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_BallNumInOver]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_OverNum]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Page]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Innings]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_MatchNum]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_Url]
GO

ALTER TABLE [dbo].[RecBallByBall] DROP CONSTRAINT [DF_RecBallByBall_RowNum]
GO

/****** Object:  Table [dbo].[RecBallByBall]    Script Date: 03/12/2016 23:58:08 ******/
DROP TABLE [dbo].[RecBallByBall]
GO

/****** Object:  Table [dbo].[RecBallByBall]    Script Date: 03/12/2016 23:58:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RecBallByBall](
	[RowNum] [bigint] NULL,
	[Url] [varchar](8000) NULL,
	[MatchNum] [int] NULL,
	[Innings] [int] NULL,
	[Page] [int] NULL,
	[OverNum] [int] NULL,
	[BallNumInOver] [int] NULL,
	[BallNum] [varchar](8000) NULL,
	[Bowler] [varchar](8000) NULL,
	[BowlerScorecardName] [varchar](8000) NULL,
	[Batsman] [varchar](8000) NULL,
	[BatsmanScorecardName] [varchar](8000) NULL,
	[Result] [varchar](8000) NULL,
	[Commentary] [varchar](8000) NULL,
	[TeamRuns] [int] NULL,
	[TeamWickets] [int] NULL,
	[BatsmanRuns] [int] NULL,
	[BowlerConceded] [int] NULL,
	[BowlerWicket] [int] NULL,
	[BatsmanWicket] [int] NULL,
	[Extras] [int] NULL,
	[Byes] [int] NULL,
	[LegByes] [int] NULL,
	[Wides] [int] NULL,
	[NoBalls] [int] NULL,
	[PenaltyRuns] [int] NULL,
	[BallCount] [int] NULL,
	[WicketsLost] [int] NULL,
	[NoBatsmenDuringWicket] [int] NULL,
	[NoBatsmenRunningTotal] [int] NULL,
	[BattingPartner] [varchar](800) NULL,
	[BatterDismissed] [varchar](50) NULL,
	[InsertedFrom] [varchar](800) NULL,
	[UpdatedFrom] [varchar](800) NULL,
	[UpdatedReason] [varchar](800) NULL,
	[IssueDetected] [varchar](1) NULL,
	[TotalRunsInOver] [int] NULL,
	[TotalRunsInInnings] [int] NULL,
	[BatsmanRunsInInnings] [int] NULL,
	[BowlerRunsInInnings] [int] NULL,
	[ScorecardTotal] [int] NULL,
	[ScorecardBatsmanTotal] [int] NULL,
	[ScorecardBowlerTotal] [int] NULL,
	[EndOfOverRunsInOver] [int] NULL,
	[OverByOverRunsInOver] [int] NULL,
	[InningsTotalMismatch] [varchar](2) NULL,
	[BattingTotalMismatch] [varchar](2) NULL,
	[BowlingTotalMismatch] [varchar](2) NULL,
	[OverRunsMismatch] [varchar](2) NULL,
	[BowlerWicketsToDate] [int] NULL,
	[BowlerRunsConcededToDate] [int] NULL,
	[BowlerDeliveriesToDate] [int] NULL,
	[BowlerAsAtStrikeRate] [numeric](18, 6) NULL,
	[BowlerAsAtEconomy] [numeric](18, 6) NULL,
	[BatterAsAtRunRate] [numeric](18, 6) NULL,
	[BatterAsAtDismissalRate] [numeric](18, 6) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_RowNum]  DEFAULT (NULL) FOR [RowNum]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Url]  DEFAULT (NULL) FOR [Url]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_MatchNum]  DEFAULT (NULL) FOR [MatchNum]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Innings]  DEFAULT (NULL) FOR [Innings]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Page]  DEFAULT (NULL) FOR [Page]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_OverNum]  DEFAULT (NULL) FOR [OverNum]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_BallNumInOver]  DEFAULT (NULL) FOR [BallNumInOver]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_BallNum]  DEFAULT (NULL) FOR [BallNum]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Bowler]  DEFAULT (NULL) FOR [Bowler]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Batsman]  DEFAULT (NULL) FOR [Batsman]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Result]  DEFAULT (NULL) FOR [Result]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Commentary]  DEFAULT (NULL) FOR [Commentary]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_TeamRuns]  DEFAULT (NULL) FOR [TeamRuns]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_TeamWickets]  DEFAULT (NULL) FOR [TeamWickets]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_BatsmanRuns]  DEFAULT (NULL) FOR [BatsmanRuns]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_BowlerConceded]  DEFAULT (NULL) FOR [BowlerConceded]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_BowlerWicket]  DEFAULT (NULL) FOR [BowlerWicket]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_Extras]  DEFAULT (NULL) FOR [Extras]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_BallCount]  DEFAULT (NULL) FOR [BallCount]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_InsertedFrom]  DEFAULT (NULL) FOR [InsertedFrom]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_UpdatedFrom]  DEFAULT (NULL) FOR [UpdatedFrom]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_UpdatedReason]  DEFAULT (NULL) FOR [UpdatedReason]
GO

ALTER TABLE [dbo].[RecBallByBall] ADD  CONSTRAINT [DF_RecBallByBall_IssueDetected]  DEFAULT (NULL) FOR [IssueDetected]
GO


