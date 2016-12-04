USE [CricketOSA]
GO

/****** Object:  Table [dbo].[PlayerTeamUrlList]    Script Date: 03/12/2016 16:01:44 ******/
DROP TABLE [dbo].[PlayerTeamUrlList]
GO

/****** Object:  Table [dbo].[PlayerTeamUrlList]    Script Date: 03/12/2016 16:01:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PlayerTeamUrlList](
	[rownum] [bigint] NULL,
	[TeamNumber] [bigint] NOT NULL,
	[TeamName] [varchar](200) NULL,
	[MatchFormat] [varchar](200) NULL,
	[TeamUrl] [varchar](2000) NULL,
	[Result] [varchar](200) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


