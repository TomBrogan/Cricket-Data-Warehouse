USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimPlayer]    Script Date: 04/12/2016 00:20:18 ******/
DROP TABLE [dbo].[DimPlayer]
GO

/****** Object:  Table [dbo].[DimPlayer]    Script Date: 04/12/2016 00:20:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DimPlayer](
	[DimPlayerID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerUrl] [varchar](8000) NULL,
	[PlayerNum] [int] NULL,
	[Name] [varchar](8000) NULL,
	[FullName] [varchar](8000) NULL,
	[Nickname] [varchar](8000) NULL,
	[Country] [varchar](8000) NULL,
	[Born] [varchar](8000) NULL,
	[BattingStyle] [varchar](8000) NULL,
	[BowlingStyle] [varchar](8000) NULL,
	[PlayingRole] [varchar](8000) NULL,
	[Height] [varchar](8000) NULL,
	[Education] [varchar](8000) NULL,
	[InANutshell] [varchar](8000) NULL,
 CONSTRAINT [PK_DimPlayer] PRIMARY KEY CLUSTERED 
(
	[DimPlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


