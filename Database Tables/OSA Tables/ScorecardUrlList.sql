USE [CricketOSA]
GO

/****** Object:  Table [dbo].[ScorecardUrlList]    Script Date: 03/12/2016 16:04:15 ******/
DROP TABLE [dbo].[ScorecardUrlList]
GO

/****** Object:  Table [dbo].[ScorecardUrlList]    Script Date: 03/12/2016 16:04:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ScorecardUrlList](
	[rownum] [bigint] NULL,
	[TestName] [varchar](800) NULL,
	[MatchNum] [bigint] NULL,
	[url] [varchar](800) NULL,
	[Result] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


