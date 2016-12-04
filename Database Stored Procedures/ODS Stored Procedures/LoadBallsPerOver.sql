USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallsPerOver]    Script Date: 03/12/2016 17:23:14 ******/
DROP PROCEDURE [dbo].[LoadBallsPerOver]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallsPerOver]    Script Date: 03/12/2016 17:23:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadBallsPerOver] as

insert into BallsPerOver
select
Url
, 6
from Match
where Url not in (select Url from BallsPerOver)

GO


