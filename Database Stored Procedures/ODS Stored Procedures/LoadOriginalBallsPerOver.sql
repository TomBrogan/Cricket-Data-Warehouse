USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadOriginalBallsPerOver]    Script Date: 04/12/2016 09:24:23 ******/
DROP PROCEDURE [dbo].[LoadOriginalBallsPerOver]
GO

/****** Object:  StoredProcedure [dbo].[LoadOriginalBallsPerOver]    Script Date: 04/12/2016 09:24:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadOriginalBallsPerOver] as

truncate table BallsPerOver

insert into BallsPerOver
SELECT 'http://stats.espncricinfo.com/ci/engine/match/207334.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/208321.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/209929.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/209930.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/210366.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/210368.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/213347.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/213856.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/214009.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/215010.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/215253.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/215686.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/216055.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/216994.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/218383.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/218813.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/219062.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/219612.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/219613.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/221840.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/223889.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225255.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225256.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225257.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225258.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225264.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225265.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225266.html',6 UNION ALL
SELECT 'http://stats.espncricinfo.com/ci/engine/match/225443.html',6

GO


