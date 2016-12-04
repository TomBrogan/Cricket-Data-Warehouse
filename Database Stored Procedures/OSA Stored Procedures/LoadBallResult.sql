USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallResult]    Script Date: 03/12/2016 16:25:18 ******/
DROP PROCEDURE [dbo].[LoadBallResult]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallResult]    Script Date: 03/12/2016 16:25:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadBallResult] as

insert into DimBallResult
SELECT '5 runs',5,0,5,5,0,0,0,0,0,0,0,1 UNION ALL
SELECT '1 bye',1,0,0,0,0,1,1,0,0,0,0,1 UNION ALL
SELECT '2 byes',2,0,0,0,0,2,2,0,0,0,0,1 UNION ALL
SELECT '3 byes',3,0,0,0,0,3,3,0,0,0,0,1 UNION ALL
SELECT '(no ball) 1 run',2,0,1,2,0,1,0,0,0,1,0,0 UNION ALL
SELECT '(no ball) 2 runs',3,0,2,3,0,1,0,0,0,1,0,0 UNION ALL
SELECT '(no ball) 3 runs',4,0,3,4,0,1,0,0,0,1,0,0 UNION ALL
SELECT '(no ball) SIX',7,0,6,7,0,1,0,0,0,1,0,0 UNION ALL
SELECT '6 runs',6,0,6,6,0,0,0,0,0,0,0,1 UNION ALL
SELECT '5 no balls',5,0,0,5,0,5,0,0,0,5,0,0 UNION ALL
SELECT '(no ball) 4 runs',5,0,4,5,0,1,0,0,0,1,0,0 UNION ALL
SELECT '3 runs, OUT',3,1,3,3,0,0,0,0,0,0,0,1 UNION ALL
SELECT '2 runs, OUT',2,1,2,2,0,0,0,0,0,0,0,1 UNION ALL
SELECT '3 leg byes',3,0,0,0,0,3,0,3,0,0,0,1 UNION ALL
SELECT '2 wides',2,0,0,2,0,2,0,0,2,0,0,0 UNION ALL
SELECT '5 byes',5,0,0,0,0,5,5,0,0,0,0,1 UNION ALL
SELECT '(no ball) 5 runs',6,0,5,6,0,1,0,0,0,1,0,0 UNION ALL
SELECT '(no ball) 2 runs, OUT',3,1,2,3,0,1,0,0,0,1,0,0 UNION ALL
SELECT '4 wides',4,0,0,4,0,4,0,0,4,0,0,0 UNION ALL
SELECT '3 no balls',3,0,0,3,0,3,0,0,0,3,0,0 UNION ALL
SELECT '2 no balls',2,0,0,2,0,2,0,0,0,2,0,0 UNION ALL
SELECT '3 wides',3,0,0,3,0,3,0,0,3,0,0,0 UNION ALL
SELECT '(no ball) 1 run, OUT',2,1,1,2,0,1,0,0,0,1,0,0 UNION ALL
SELECT '5 leg byes',5,0,0,0,0,5,0,5,0,0,0,1 UNION ALL
SELECT '2 leg byes, OUT',2,1,0,0,0,2,0,2,0,0,0,1 UNION ALL
SELECT '1 leg bye, OUT',1,1,0,0,0,1,0,1,0,0,0,1 UNION ALL
SELECT '1 no ball, OUT',1,1,0,1,0,1,0,0,0,1,0,0 UNION ALL
SELECT 'no run, 5 pen',5,0,0,0,0,5,0,0,0,0,5,1 UNION ALL
SELECT '1 run, 5 pen',6,0,1,1,0,5,0,0,0,0,5,1 UNION ALL
SELECT '1 wide, 5 pen',6,0,0,1,0,6,0,0,1,0,5,0 UNION ALL
SELECT '(no ball) FOUR',5,0,4,5,0,1,0,0,0,1,0,0 UNION ALL
SELECT '1 leg bye',1,0,0,0,0,1,0,1,0,0,0,1 UNION ALL
SELECT '1 no ball',1,0,0,1,0,1,0,0,0,1,0,0 UNION ALL
SELECT '1 run',1,0,1,1,0,0,0,0,0,0,0,1 UNION ALL
SELECT '1 run, OUT',1,1,1,1,0,0,0,0,0,0,0,1 UNION ALL
SELECT '1 wide',1,0,0,1,0,1,0,0,1,0,0,0 UNION ALL
SELECT '2 leg byes',2,0,0,0,0,2,0,2,0,0,0,1 UNION ALL
SELECT '2 runs',2,0,2,2,0,0,0,0,0,0,0,1 UNION ALL
SELECT '3 runs',3,0,3,3,0,0,0,0,0,0,0,1 UNION ALL
SELECT '4 byes',4,0,0,0,0,4,4,0,0,0,0,1 UNION ALL
SELECT '4 leg byes',4,0,0,0,0,4,0,4,0,0,0,1 UNION ALL
SELECT '4 runs',4,0,4,4,0,0,0,0,0,0,0,1 UNION ALL
SELECT 'FOUR',4,0,4,4,0,0,0,0,0,0,0,1 UNION ALL
SELECT 'no run',0,0,0,0,0,0,0,0,0,0,0,1 UNION ALL
SELECT 'OUT',0,1,0,0,1,0,0,0,0,0,0,1 UNION ALL
SELECT 'SIX',6,0,6,6,0,0,0,0,0,0,0,1 UNION ALL
SELECT 'Unknown',0,0,0,0,0,0,0,0,0,0,0,1 UNION ALL
SELECT '5 wides',5,0,0,5,0,5,0,0,5,0,0,0 UNION ALL
SELECT '7 runs',7,0,7,7,0,0,0,0,0,0,0,1

GO


