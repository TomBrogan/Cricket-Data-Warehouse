USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallToUpdateResult]    Script Date: 04/12/2016 09:24:11 ******/
DROP PROCEDURE [dbo].[LoadBallByBallToUpdateResult]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallToUpdateResult]    Script Date: 04/12/2016 09:24:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadBallByBallToUpdateResult] as

truncate table BallByBallToUpdateResult

insert into BallByBallToUpdateResult
SELECT 5022,'http://stats.espncricinfo.com/ci/engine/match/428749.html?innings=4;page=1;view=commentary','1 run, 5 pen','Penalty Runs' UNION ALL
SELECT 5792,'http://stats.espncricinfo.com/ci/engine/match/441826.html?innings=3;page=3;view=commentary','1 run, 5 pen','Penalty Runs' UNION ALL
SELECT 7888,'http://stats.espncricinfo.com/ci/engine/match/690349.html?innings=1;page=3;view=commentary','1 wide, 5 pen','Penalty Runs' UNION ALL
SELECT 2923,'http://stats.espncricinfo.com/ci/engine/match/225258.html?innings=3;page=2;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 4849,'http://stats.espncricinfo.com/ci/engine/match/225265.html?innings=2;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 5414,'http://stats.espncricinfo.com/ci/engine/match/226361.html?innings=2;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 4750,'http://stats.espncricinfo.com/ci/engine/match/226362.html?innings=2;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 5957,'http://stats.espncricinfo.com/ci/engine/match/238217.html?innings=1;page=2;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 6846,'http://stats.espncricinfo.com/ci/engine/match/239921.html?innings=3;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 5251,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=2;page=2;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 3064,'http://stats.espncricinfo.com/ci/engine/match/258461.html?innings=3;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 6723,'http://stats.espncricinfo.com/ci/engine/match/299005.html?innings=1;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 5363,'http://stats.espncricinfo.com/ci/engine/match/319141.html?innings=3;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 5785,'http://stats.espncricinfo.com/ci/engine/match/345672.html?innings=2;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 7416,'http://stats.espncricinfo.com/ci/engine/match/345672.html?innings=3;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 2920,'http://stats.espncricinfo.com/ci/engine/match/351683.html?innings=4;page=3;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 6236,'http://stats.espncricinfo.com/ci/engine/match/387572.html?innings=3;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 3534,'http://stats.espncricinfo.com/ci/engine/match/423778.html?innings=3;page=2;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 4197,'http://stats.espncricinfo.com/ci/engine/match/423780.html?innings=3;page=1;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 4199,'http://stats.espncricinfo.com/ci/engine/match/64132.html?innings=1;page=2;view=commentary','no run, 5 pen','Penalty Runs' UNION ALL
SELECT 2785,'http://stats.espncricinfo.com/ci/engine/match/215010.html?innings=1;page=1;view=commentary','(no ball) FOUR','Update Result' UNION ALL
SELECT 4437,'http://stats.espncricinfo.com/ci/engine/match/226362.html?innings=3;page=1;view=commentary','(no ball) FOUR','Update Result' UNION ALL
SELECT 6174,'http://stats.espncricinfo.com/ci/engine/match/226372.html?innings=3;page=1;view=commentary','1 no ball','Update Result' UNION ALL
SELECT 3124,'http://stats.espncricinfo.com/ci/engine/match/216994.html?innings=1;page=2;view=commentary','1 run','Update Result' UNION ALL
SELECT 7773,'http://stats.espncricinfo.com/ci/engine/match/64023.html?innings=3;page=1;view=commentary','1 run','Update Result' UNION ALL
SELECT 7619,'http://stats.espncricinfo.com/ci/engine/match/215686.html?innings=4;page=1;view=commentary','4 runs','Update Result' UNION ALL
SELECT 2528,'http://stats.espncricinfo.com/ci/engine/match/215010.html?innings=2;page=1;view=commentary','5 runs','Update Result' UNION ALL
SELECT 6398,'http://stats.espncricinfo.com/ci/engine/match/63932.html?innings=1;page=2;view=commentary','FOUR','Update Result' UNION ALL
SELECT 3615,'http://stats.espncricinfo.com/ci/engine/match/520591.html?innings=1;page=3;view=commentary','no run','Update Result'


GO


