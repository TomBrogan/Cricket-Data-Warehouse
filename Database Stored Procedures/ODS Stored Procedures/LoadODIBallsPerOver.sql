USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIBallsPerOver]    Script Date: 04/12/2016 09:25:01 ******/
DROP PROCEDURE [dbo].[LoadODIBallsPerOver]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIBallsPerOver]    Script Date: 04/12/2016 09:25:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadODIBallsPerOver] as

truncate table ODIBallsPerOver

insert into ODIBallsPerOver
SELECT 'http://www.espncricinfo.com/ci/engine/match/64148.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64149.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64150.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64151.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64152.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64153.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64154.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64155.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64156.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64157.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64158.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64160.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64161.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64162.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64168.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64169.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64170.html',8 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64171.html',8
GO


