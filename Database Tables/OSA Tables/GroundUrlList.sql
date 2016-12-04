USE [CricketOSA]
GO

/****** Object:  Table [dbo].[GroundUrlList]    Script Date: 03/12/2016 16:00:06 ******/
DROP TABLE [dbo].[GroundUrlList]
GO

/****** Object:  Table [dbo].[GroundUrlList]    Script Date: 03/12/2016 16:00:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GroundUrlList](
	[Rownum] [int] IDENTITY(1,1) NOT NULL,
	[GroundUrl] [varchar](800) NOT NULL,
	[GroundNum] [varchar](50) NULL,
	[Result] [varchar](7) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


