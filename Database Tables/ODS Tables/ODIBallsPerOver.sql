USE [CricketRec]
GO

/****** Object:  Table [dbo].[ODIBallsPerOver]    Script Date: 03/12/2016 23:57:23 ******/
DROP TABLE [dbo].[ODIBallsPerOver]
GO

/****** Object:  Table [dbo].[ODIBallsPerOver]    Script Date: 03/12/2016 23:57:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ODIBallsPerOver](
	[Url] [varchar](800) NOT NULL,
	[BallsPerOver] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


