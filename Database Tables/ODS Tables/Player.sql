USE [CricketRec]
GO

/****** Object:  Table [dbo].[Player]    Script Date: 03/12/2016 23:58:04 ******/
DROP TABLE [dbo].[Player]
GO

/****** Object:  Table [dbo].[Player]    Script Date: 03/12/2016 23:58:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Player](
	[PlayerID] [int] NOT NULL,
	[PlayerUrl] [varchar](8000) NULL,
	[Name] [varchar](8000) NULL,
	[Country] [varchar](8000) NULL,
	[FullName] [varchar](8000) NULL,
	[Born] [varchar](8000) NULL,
	[Nickname] [varchar](8000) NULL,
	[PlayingRole] [varchar](8000) NULL,
	[BattingStyle] [varchar](8000) NULL,
	[BowlingStyle] [varchar](8000) NULL,
	[Height] [varchar](8000) NULL,
	[Education] [varchar](8000) NULL,
	[InANutshell] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


