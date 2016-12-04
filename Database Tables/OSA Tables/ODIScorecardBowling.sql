USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ODIScorecardBowling]    Script Date: 03/12/2016 16:01:14 ******/
DROP TABLE [dbo].[ODIScorecardBowling]
GO

/****** Object:  Table [dbo].[ODIScorecardBowling]    Script Date: 03/12/2016 16:01:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIScorecardBowling](
	[Url] [varchar](200) NOT NULL,
	[InningsNum] [int] NULL,
	[Title] [varchar](800) NULL,
	[rownum] [int] NULL,
	[PlayerUrl] [varchar](800) NULL,
	[Bowler] [varchar](200) NULL,
	[Overs] [varchar](200) NULL,
	[Maidens] [varchar](200) NULL,
	[Runs] [varchar](200) NULL,
	[Wickets] [varchar](200) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


