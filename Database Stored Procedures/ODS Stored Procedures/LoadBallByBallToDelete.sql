USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallToDelete]    Script Date: 04/12/2016 09:24:03 ******/
DROP PROCEDURE [dbo].[LoadBallByBallToDelete]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallToDelete]    Script Date: 04/12/2016 09:24:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadBallByBallToDelete] as 

truncate table BallByBallToDelete

insert into BallByBallToDelete
SELECT 5464,'http://stats.espncricinfo.com/ci/engine/match/225266.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2574,'http://stats.espncricinfo.com/ci/engine/match/249223.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 8740,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4441,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=3;view=commentary' UNION ALL
SELECT 4955,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=3;view=commentary' UNION ALL
SELECT 6685,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 7777,'http://stats.espncricinfo.com/ci/engine/match/250665.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 2334,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 3692,'http://stats.espncricinfo.com/ci/engine/match/258462.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2317,'http://stats.espncricinfo.com/ci/engine/match/249193.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2322,'http://stats.espncricinfo.com/ci/engine/match/293479.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2328,'http://stats.espncricinfo.com/ci/engine/match/300443.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 2334,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 2334,'http://stats.espncricinfo.com/ci/engine/match/430883.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2335,'http://stats.espncricinfo.com/ci/engine/match/426414.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 2342,'http://stats.espncricinfo.com/ci/engine/match/531630.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2345,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 2348,'http://stats.espncricinfo.com/ci/engine/match/249193.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2354,'http://stats.espncricinfo.com/ci/engine/match/239922.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2356,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2365,'http://stats.espncricinfo.com/ci/engine/match/250665.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 2368,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2370,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 2392,'http://stats.espncricinfo.com/ci/engine/match/291353.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2401,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2417,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2419,'http://stats.espncricinfo.com/ci/engine/match/291353.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2430,'http://stats.espncricinfo.com/ci/engine/match/239025.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 2440,'http://stats.espncricinfo.com/ci/engine/match/291353.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2451,'http://stats.espncricinfo.com/ci/engine/match/239025.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 2469,'http://stats.espncricinfo.com/ci/engine/match/291353.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2478,'http://stats.espncricinfo.com/ci/engine/match/225257.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 2500,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 2546,'http://stats.espncricinfo.com/ci/engine/match/239920.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 2555,'http://stats.espncricinfo.com/ci/engine/match/323948.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2587,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2600,'http://stats.espncricinfo.com/ci/engine/match/351681.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 2642,'http://stats.espncricinfo.com/ci/engine/match/319132.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2712,'http://stats.espncricinfo.com/ci/engine/match/249225.html?innings=2;page=3;view=commentary' UNION ALL
SELECT 2725,'http://stats.espncricinfo.com/ci/engine/match/249223.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 2864,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 2890,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 3019,'http://stats.espncricinfo.com/ci/engine/match/386496.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 3039,'http://stats.espncricinfo.com/ci/engine/match/225255.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 3106,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 3126,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 3149,'http://stats.espncricinfo.com/ci/engine/match/345972.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 3152,'http://stats.espncricinfo.com/ci/engine/match/560929.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 3199,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 3263,'http://stats.espncricinfo.com/ci/engine/match/225266.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 3342,'http://stats.espncricinfo.com/ci/engine/match/343731.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 3532,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 3540,'http://stats.espncricinfo.com/ci/engine/match/345672.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 3555,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 3625,'http://stats.espncricinfo.com/ci/engine/match/690349.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 3708,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 3719,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 3799,'http://stats.espncricinfo.com/ci/engine/match/291351.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 3817,'http://stats.espncricinfo.com/ci/engine/match/291351.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 3829,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 3836,'http://stats.espncricinfo.com/ci/engine/match/291351.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 3837,'http://stats.espncricinfo.com/ci/engine/match/661681.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 3849,'http://stats.espncricinfo.com/ci/engine/match/250665.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 3866,'http://stats.espncricinfo.com/ci/engine/match/257766.html?innings=1;page=3;view=commentary' UNION ALL
SELECT 3903,'http://stats.espncricinfo.com/ci/engine/match/225264.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 3905,'http://stats.espncricinfo.com/ci/engine/match/406199.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 3915,'http://stats.espncricinfo.com/ci/engine/match/514034.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 3950,'http://stats.espncricinfo.com/ci/engine/match/520591.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 3972,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 3992,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4013,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4020,'http://stats.espncricinfo.com/ci/engine/match/518953.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 4034,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4040,'http://stats.espncricinfo.com/ci/engine/match/323948.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 4046,'http://stats.espncricinfo.com/ci/engine/match/659557.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 4050,'http://stats.espncricinfo.com/ci/engine/match/323948.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 4060,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4061,'http://stats.espncricinfo.com/ci/engine/match/323948.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 4104,'http://stats.espncricinfo.com/ci/engine/match/257766.html?innings=1;page=3;view=commentary' UNION ALL
SELECT 4155,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 4278,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4301,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4304,'http://stats.espncricinfo.com/ci/engine/match/258462.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4305,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4326,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4330,'http://stats.espncricinfo.com/ci/engine/match/249223.html?innings=1;page=4;view=commentary' UNION ALL
SELECT 4333,'http://stats.espncricinfo.com/ci/engine/match/258462.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4346,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4356,'http://stats.espncricinfo.com/ci/engine/match/225255.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4367,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4386,'http://stats.espncricinfo.com/ci/engine/match/249216.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 4387,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4398,'http://stats.espncricinfo.com/ci/engine/match/249216.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 4399,'http://stats.espncricinfo.com/ci/engine/match/565806.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4407,'http://stats.espncricinfo.com/ci/engine/match/345672.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 4446,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4453,'http://stats.espncricinfo.com/ci/engine/match/464531.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4483,'http://stats.espncricinfo.com/ci/engine/match/569245.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 4513,'http://stats.espncricinfo.com/ci/engine/match/343729.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 4540,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=3;view=commentary' UNION ALL
SELECT 4549,'http://stats.espncricinfo.com/ci/engine/match/239921.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 4556,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=3;view=commentary' UNION ALL
SELECT 4560,'http://stats.espncricinfo.com/ci/engine/match/239921.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 4573,'http://stats.espncricinfo.com/ci/engine/match/238168.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4587,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 4593,'http://stats.espncricinfo.com/ci/engine/match/386496.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 4594,'http://stats.espncricinfo.com/ci/engine/match/238168.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4600,'http://stats.espncricinfo.com/ci/engine/match/258462.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 4760,'http://stats.espncricinfo.com/ci/engine/match/366706.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 4790,'http://stats.espncricinfo.com/ci/engine/match/239025.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4805,'http://stats.espncricinfo.com/ci/engine/match/249193.html?innings=2;page=4;view=commentary' UNION ALL
SELECT 4811,'http://stats.espncricinfo.com/ci/engine/match/239025.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 4815,'http://stats.espncricinfo.com/ci/engine/match/239025.html?innings=2;page=3;view=commentary' UNION ALL
SELECT 4851,'http://stats.espncricinfo.com/ci/engine/match/249216.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 4901,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 4976,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 4997,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 5024,'http://stats.espncricinfo.com/ci/engine/match/257767.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5054,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 5081,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 5101,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 5111,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 5125,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 5137,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 5158,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 5428,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 5451,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 5456,'http://stats.espncricinfo.com/ci/engine/match/257766.html?innings=2;page=3;view=commentary' UNION ALL
SELECT 5465,'http://stats.espncricinfo.com/ci/engine/match/225258.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 5486,'http://stats.espncricinfo.com/ci/engine/match/225258.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 5493,'http://stats.espncricinfo.com/ci/engine/match/225266.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 5516,'http://stats.espncricinfo.com/ci/engine/match/225264.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 5523,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5589,'http://stats.espncricinfo.com/ci/engine/match/249222.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 5654,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5664,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5690,'http://stats.espncricinfo.com/ci/engine/match/520591.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 5700,'http://stats.espncricinfo.com/ci/engine/match/520591.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 5713,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5734,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5785,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5914,'http://stats.espncricinfo.com/ci/engine/match/225266.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5949,'http://stats.espncricinfo.com/ci/engine/match/239920.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 5980,'http://stats.espncricinfo.com/ci/engine/match/291352.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 6030,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 6145,'http://stats.espncricinfo.com/ci/engine/match/250666.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 6173,'http://stats.espncricinfo.com/ci/engine/match/239922.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 6231,'http://stats.espncricinfo.com/ci/engine/match/423780.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 6304,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 6326,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 6349,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 6380,'http://stats.espncricinfo.com/ci/engine/match/225266.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 6415,'http://stats.espncricinfo.com/ci/engine/match/565809.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 6436,'http://stats.espncricinfo.com/ci/engine/match/565809.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 6456,'http://stats.espncricinfo.com/ci/engine/match/565809.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 6477,'http://stats.espncricinfo.com/ci/engine/match/565809.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 6489,'http://stats.espncricinfo.com/ci/engine/match/456669.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 6491,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 6506,'http://stats.espncricinfo.com/ci/engine/match/249193.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 6524,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 6557,'http://stats.espncricinfo.com/ci/engine/match/249222.html?innings=1;page=3;view=commentary' UNION ALL
SELECT 6712,'http://stats.espncricinfo.com/ci/engine/match/225264.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 6731,'http://stats.espncricinfo.com/ci/engine/match/297807.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 6744,'http://stats.espncricinfo.com/ci/engine/match/297808.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 6745,'http://stats.espncricinfo.com/ci/engine/match/239920.html?innings=3;page=3;view=commentary' UNION ALL
SELECT 6757,'http://stats.espncricinfo.com/ci/engine/match/345672.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 6784,'http://stats.espncricinfo.com/ci/engine/match/249217.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 6803,'http://stats.espncricinfo.com/ci/engine/match/345672.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 6872,'http://stats.espncricinfo.com/ci/engine/match/251485.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 6914,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 6940,'http://stats.espncricinfo.com/ci/engine/match/518950.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 6963,'http://stats.espncricinfo.com/ci/engine/match/386496.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7016,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7049,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 7050,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 7185,'http://stats.espncricinfo.com/ci/engine/match/300443.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7197,'http://stats.espncricinfo.com/ci/engine/match/225264.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 7276,'http://stats.espncricinfo.com/ci/engine/match/239920.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7278,'http://stats.espncricinfo.com/ci/engine/match/239922.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 7288,'http://stats.espncricinfo.com/ci/engine/match/239922.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 7355,'http://stats.espncricinfo.com/ci/engine/match/225256.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7375,'http://stats.espncricinfo.com/ci/engine/match/225256.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7462,'http://stats.espncricinfo.com/ci/engine/match/406201.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7506,'http://stats.espncricinfo.com/ci/engine/match/225265.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7562,'http://stats.espncricinfo.com/ci/engine/match/249225.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 7599,'http://stats.espncricinfo.com/ci/engine/match/250667.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 7716,'http://stats.espncricinfo.com/ci/engine/match/343730.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7727,'http://stats.espncricinfo.com/ci/engine/match/343730.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7747,'http://stats.espncricinfo.com/ci/engine/match/225264.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7773,'http://stats.espncricinfo.com/ci/engine/match/257767.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 7794,'http://stats.espncricinfo.com/ci/engine/match/257767.html?innings=4;page=1;view=commentary' UNION ALL
SELECT 7928,'http://stats.espncricinfo.com/ci/engine/match/401071.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7940,'http://stats.espncricinfo.com/ci/engine/match/401071.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7953,'http://stats.espncricinfo.com/ci/engine/match/401071.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 7975,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 7997,'http://stats.espncricinfo.com/ci/engine/match/249226.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 8022,'http://stats.espncricinfo.com/ci/engine/match/297808.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8028,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8032,'http://stats.espncricinfo.com/ci/engine/match/297808.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8043,'http://stats.espncricinfo.com/ci/engine/match/297808.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8080,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8101,'http://stats.espncricinfo.com/ci/engine/match/297807.html?innings=2;page=2;view=commentary' UNION ALL
SELECT 8168,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8179,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8192,'http://stats.espncricinfo.com/ci/engine/match/249224.html?innings=4;page=2;view=commentary' UNION ALL
SELECT 8199,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8222,'http://stats.espncricinfo.com/ci/engine/match/249215.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8237,'http://stats.espncricinfo.com/ci/engine/match/520591.html?innings=1;page=1;view=commentary' UNION ALL
SELECT 8297,'http://stats.espncricinfo.com/ci/engine/match/249223.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 8308,'http://stats.espncricinfo.com/ci/engine/match/648673.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8320,'http://stats.espncricinfo.com/ci/engine/match/648673.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8333,'http://stats.espncricinfo.com/ci/engine/match/648673.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8345,'http://stats.espncricinfo.com/ci/engine/match/648673.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 8357,'http://stats.espncricinfo.com/ci/engine/match/648673.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 7362,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7403,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7444,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7485,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7528,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7300,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7331,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 7341,'http://stats.espncricinfo.com/ci/engine/match/63935.html?innings=3;page=1;view=commentary' UNION ALL
SELECT 6628,'http://stats.espncricinfo.com/ci/engine/match/63941.html?innings=2;page=1;view=commentary' UNION ALL
SELECT 2580,'http://stats.espncricinfo.com/ci/engine/match/351681.html?innings=3;page=2;view=commentary' UNION ALL
SELECT 5711,'http://stats.espncricinfo.com/ci/engine/match/352661.html?innings=1;page=2;view=commentary' UNION ALL
SELECT 5732,'http://stats.espncricinfo.com/ci/engine/match/352661.html?innings=1;page=2;view=commentary'


GO


