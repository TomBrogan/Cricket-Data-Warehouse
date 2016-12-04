USE [CricketOSA]
GO

/****** Object:  Table [dbo].[Ground]    Script Date: 03/12/2016 16:00:03 ******/
DROP TABLE [dbo].[Ground]
GO

/****** Object:  Table [dbo].[Ground]    Script Date: 03/12/2016 16:00:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Ground](
	[Url] [varchar](8000) NULL,
	[GroundName] [varchar](8000) NULL,
	[Country] [varchar](8000) NULL,
	[Location] [varchar](8000) NULL,
	[OtherNames] [varchar](8000) NULL,
	[Established] [varchar](8000) NULL,
	[Capacity] [varchar](8000) NULL,
	[Floodlights] [varchar](8000) NULL,
	[EndNames] [varchar](8000) NULL,
	[PlayingArea] [varchar](8000) NULL,
	[NamedAfter] [varchar](8000) NULL,
	[OtherSports] [varchar](8000) NULL,
	[Curator] [varchar](8000) NULL,
	[HomeTeams] [varchar](8000) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


