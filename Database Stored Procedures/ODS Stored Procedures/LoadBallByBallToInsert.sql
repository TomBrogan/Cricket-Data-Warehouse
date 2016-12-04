USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallToInsert]    Script Date: 04/12/2016 09:24:07 ******/
DROP PROCEDURE [dbo].[LoadBallByBallToInsert]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallToInsert]    Script Date: 04/12/2016 09:24:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadBallByBallToInsert] as

truncate table BallByBallToInsert

insert into BallByBallToInsert
SELECT 63939,2,NULL,'http://stats.espncricinfo.com/ci/engine/match/63939.html?innings=2;page=2;view=commentary','94.2','McGrath','Mullally','OUT',NULL,NULL UNION ALL
SELECT 63940,2,NULL,'http://stats.espncricinfo.com/ci/engine/match/63940.html?innings=2;page=3;view=commentary','118.2','Warne','Gough','OUT',NULL,NULL UNION ALL
SELECT 63940,3,NULL,'http://stats.espncricinfo.com/ci/engine/match/63940.html?innings=3;page=2;view=commentary','68.3','McGrath','Tufnell','OUT',NULL,NULL UNION ALL
SELECT 63943,2,NULL,'http://stats.espncricinfo.com/ci/engine/match/63943.html?innings=2;page=3;view=commentary','107.5','Srinath','Muralitharan','OUT',NULL,NULL UNION ALL
SELECT 63944,1,NULL,'http://stats.espncricinfo.com/ci/engine/match/63944.html?innings=1;page=2;view=commentary','78.3','Harvinder Singh','Vaas','OUT',NULL,NULL UNION ALL
SELECT 63944,3,NULL,'http://stats.espncricinfo.com/ci/engine/match/63944.html?innings=3;page=2;view=commentary','66.3','Harbhajan Singh','Muralitharan','OUT',NULL,NULL UNION ALL
SELECT 63945,3,NULL,'http://stats.espncricinfo.com/ci/engine/match/63945.html?innings=3;page=3;view=commentary','124.5','Muralitharan','Khan','OUT',NULL,NULL UNION ALL
SELECT 63947,1,NULL,'http://stats.espncricinfo.com/ci/engine/match/63947.html?innings=1;page=1;view=commentary','36.4','Muralitharan','Mohammad Ashraful','OUT',NULL,NULL UNION ALL
SELECT 63947,3,NULL,'http://stats.espncricinfo.com/ci/engine/match/63947.html?innings=3;page=3;view=commentary','101.3','Muralitharan','Mohammad Sharif','OUT',NULL,NULL UNION ALL
SELECT 63949,3,NULL,'http://stats.espncricinfo.com/ci/engine/match/63949.html?innings=3;page=4;view=commentary','171.5','Nel','Hondo','OUT',NULL,NULL

GO


