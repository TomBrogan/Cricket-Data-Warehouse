USE [CricketOSA]
GO

/****** Object:  Table [dbo].[HTMLByRow]    Script Date: 03/12/2016 16:00:16 ******/
DROP TABLE [dbo].[HTMLByRow]
GO

/****** Object:  Table [dbo].[HTMLByRow]    Script Date: 03/12/2016 16:00:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HTMLByRow](
	[RowId] [int] IDENTITY(1,1) NOT NULL,
	[RowHTML] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


