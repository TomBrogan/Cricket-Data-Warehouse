USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimGround]    Script Date: 04/12/2016 00:20:05 ******/
DROP TABLE [dbo].[DimGround]
GO

/****** Object:  Table [dbo].[DimGround]    Script Date: 04/12/2016 00:20:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DimGround](
	[DimGroundID] [int] IDENTITY(1,1) NOT NULL,
	[GroundName] [varchar](8000) NULL,
	[GroundUrl] [varchar](8000) NULL,
	[GroundCountry] [varchar](8000) NULL,
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
	[HomeTeams] [varchar](8000) NULL,
 CONSTRAINT [PK_DimGround] PRIMARY KEY CLUSTERED 
(
	[DimGroundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


