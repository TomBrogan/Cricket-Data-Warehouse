USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimTeam]    Script Date: 04/12/2016 00:20:33 ******/
DROP TABLE [dbo].[DimTeam]
GO

/****** Object:  Table [dbo].[DimTeam]    Script Date: 04/12/2016 00:20:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimTeam](
	[DimTeamID] [int] IDENTITY(1,1) NOT NULL,
	[Team] [nvarchar](100) NULL,
 CONSTRAINT [PK_DimTeam] PRIMARY KEY CLUSTERED 
(
	[DimTeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


