USE [CricketDDS]
GO

/****** Object:  Table [dbo].[DimBattingPosition]    Script Date: 04/12/2016 00:19:56 ******/
DROP TABLE [dbo].[DimBattingPosition]
GO

/****** Object:  Table [dbo].[DimBattingPosition]    Script Date: 04/12/2016 00:19:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBattingPosition](
	[DimBattingPositionID] [int] IDENTITY(1,1) NOT NULL,
	[BattingPosition] [int] NULL,
 CONSTRAINT [PK_DimBattingPosition] PRIMARY KEY CLUSTERED 
(
	[DimBattingPositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


