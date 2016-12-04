USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIBallByBallToDelete]    Script Date: 04/12/2016 09:24:57 ******/
DROP PROCEDURE [dbo].[LoadODIBallByBallToDelete]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIBallByBallToDelete]    Script Date: 04/12/2016 09:24:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadODIBallByBallToDelete] as

truncate table ODIBallByBallToDelete

insert into ODIBallByBallToDelete
SELECT 'http://www.espncricinfo.com/ci/engine/match/225245.html?innings=1;view=commentary',1288 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/225245.html?innings=1;view=commentary',2833 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/225245.html?innings=1;view=commentary',4864 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/225247.html?innings=2;view=commentary',1175 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/225249.html?innings=1;view=commentary',2603 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/225249.html?innings=1;view=commentary',3680 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239916.html?innings=1;view=commentary',3685 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239916.html?innings=1;view=commentary',4506 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239916.html?innings=1;view=commentary',4539 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239916.html?innings=2;view=commentary',2025 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239916.html?innings=2;view=commentary',2041 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239916.html?innings=2;view=commentary',3388 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239918.html?innings=1;view=commentary',2224 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239918.html?innings=1;view=commentary',2551 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/239919.html?innings=1;view=commentary',3249 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247458.html?innings=1;view=commentary',812 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247458.html?innings=1;view=commentary',2689 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247476.html?innings=1;view=commentary',1931 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247477.html?innings=2;view=commentary',4178 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247490.html?innings=2;view=commentary',867 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247490.html?innings=2;view=commentary',884 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247492.html?innings=1;view=commentary',3571 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247494.html?innings=2;view=commentary',4642 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247502.html?innings=1;view=commentary',1489 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247502.html?innings=1;view=commentary',1514 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247502.html?innings=1;view=commentary',3683 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247502.html?innings=1;view=commentary',3700 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247502.html?innings=1;view=commentary',3733 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/247502.html?innings=2;view=commentary',3303 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249211.html?innings=1;view=commentary',1190 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249212.html?innings=2;view=commentary',1337 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249212.html?innings=2;view=commentary',1354 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249214.html?innings=1;view=commentary',4301 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',2395 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',2463 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',2480 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',2704 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',3909 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',4011 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',4578 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=1;view=commentary',4599 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=2;view=commentary',597 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=2;view=commentary',616 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=2;view=commentary',2303 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=2;view=commentary',2695 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249229.html?innings=2;view=commentary',2711 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249230.html?innings=2;view=commentary',4712 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249230.html?innings=2;view=commentary',4731 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249232.html?innings=1;view=commentary',2650 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249232.html?innings=1;view=commentary',2675 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249232.html?innings=1;view=commentary',4544 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249233.html?innings=1;view=commentary',669 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249236.html?innings=1;view=commentary',4516 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249236.html?innings=1;view=commentary',4533 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',1040 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',1154 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',1522 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',1828 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',2658 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',2833 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',3652 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',3845 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',4367 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',4472 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=1;view=commentary',4578 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=2;view=commentary',1399 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=2;view=commentary',1991 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249237.html?innings=2;view=commentary',2113 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249741.html?innings=1;view=commentary',964 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249741.html?innings=2;view=commentary',1141 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249741.html?innings=2;view=commentary',1723 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249741.html?innings=2;view=commentary',1748 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=1;view=commentary',2729 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=1;view=commentary',2746 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=2;view=commentary',2218 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=2;view=commentary',2685 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=2;view=commentary',3635 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=2;view=commentary',3651 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249742.html?innings=2;view=commentary',3668 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249743.html?innings=1;view=commentary',2010 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249743.html?innings=1;view=commentary',2027 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249743.html?innings=1;view=commentary',2308 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249743.html?innings=1;view=commentary',2430 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249744.html?innings=1;view=commentary',699 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249744.html?innings=1;view=commentary',857 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249744.html?innings=1;view=commentary',1155 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=1;view=commentary',3050 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=1;view=commentary',3151 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=1;view=commentary',4421 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=1;view=commentary',4611 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=1;view=commentary',4636 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=2;view=commentary',588 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=2;view=commentary',2791 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249747.html?innings=2;view=commentary',5099 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249748.html?innings=2;view=commentary',5062 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249749.html?innings=1;view=commentary',2128 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249749.html?innings=1;view=commentary',2372 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249751.html?innings=1;view=commentary',1129 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249751.html?innings=2;view=commentary',3315 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249751.html?innings=2;view=commentary',3703 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249752.html?innings=1;view=commentary',2592 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249752.html?innings=2;view=commentary',483 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249752.html?innings=2;view=commentary',3410 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249753.html?innings=1;view=commentary',606 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249753.html?innings=1;view=commentary',1591 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249754.html?innings=1;view=commentary',4705 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249754.html?innings=1;view=commentary',4893 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249754.html?innings=2;view=commentary',454 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249755.html?innings=1;view=commentary',2511 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249755.html?innings=2;view=commentary',2010 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249755.html?innings=2;view=commentary',3364 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249756.html?innings=1;view=commentary',5010 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249756.html?innings=2;view=commentary',2287 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249757.html?innings=1;view=commentary',4084 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249757.html?innings=1;view=commentary',4288 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249757.html?innings=2;view=commentary',3521 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/249758.html?innings=2;view=commentary',2961 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/250668.html?innings=2;view=commentary',3835 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/250668.html?innings=2;view=commentary',3852 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/250668.html?innings=2;view=commentary',3868 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/250669.html?innings=1;view=commentary',1381 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/250671.html?innings=1;view=commentary',1436 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/250671.html?innings=1;view=commentary',1452 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/251490.html?innings=1;view=commentary',4621 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/251492.html?innings=1;view=commentary',883 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256606.html?innings=1;view=commentary',1071 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256606.html?innings=1;view=commentary',1104 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256606.html?innings=1;view=commentary',1121 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256606.html?innings=1;view=commentary',2300 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256606.html?innings=2;view=commentary',1306 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256607.html?innings=1;view=commentary',4531 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256607.html?innings=2;view=commentary',550 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256610.html?innings=1;view=commentary',1457 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256610.html?innings=2;view=commentary',1065 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256610.html?innings=2;view=commentary',1742 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256610.html?innings=2;view=commentary',4436 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256610.html?innings=2;view=commentary',4533 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256612.html?innings=1;view=commentary',939 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256614.html?innings=1;view=commentary',3202 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256614.html?innings=1;view=commentary',4669 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/256615.html?innings=1;view=commentary',3379 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/257772.html?innings=1;view=commentary',2478 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/257772.html?innings=1;view=commentary',4508 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/258473.html?innings=1;view=commentary',2033 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/258475.html?innings=1;view=commentary',2090 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/258475.html?innings=2;view=commentary',1502 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/258477.html?innings=1;view=commentary',3904 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/258477.html?innings=2;view=commentary',1388 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/259385.html?innings=2;view=commentary',562 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267706.html?innings=2;view=commentary',4440 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267708.html?innings=1;view=commentary',594 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267708.html?innings=1;view=commentary',613 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267708.html?innings=1;view=commentary',3322 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267708.html?innings=1;view=commentary',3339 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267708.html?innings=1;view=commentary',3355 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267708.html?innings=2;view=commentary',3015 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267709.html?innings=2;view=commentary',2782 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267713.html?innings=1;view=commentary',3442 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267713.html?innings=2;view=commentary',3281 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267715.html?innings=1;view=commentary',3458 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/267715.html?innings=2;view=commentary',3377 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/289107.html?innings=2;view=commentary',1999 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/293504.html?innings=1;view=commentary',1961 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/293506.html?innings=1;view=commentary',1664 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/293506.html?innings=1;view=commentary',4800 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/293506.html?innings=2;view=commentary',795 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/293506.html?innings=2;view=commentary',1450 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/296916.html?innings=1;view=commentary',2916 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/297802.html?innings=2;view=commentary',3560 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/297803.html?innings=1;view=commentary',1632 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/297804.html?innings=1;view=commentary',1690 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/297804.html?innings=1;view=commentary',4217 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/298808.html?innings=1;view=commentary',3434 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/298808.html?innings=1;view=commentary',3459 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/299008.html?innings=1;view=commentary',3254 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/299009.html?innings=1;view=commentary',2950 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/317580.html?innings=1;view=commentary',3537 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/319146.html?innings=1;view=commentary',3220 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/323949.html?innings=2;view=commentary',1382 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/325801.html?innings=1;view=commentary',4095 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/325804.html?innings=1;view=commentary',3381 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/335347.html?innings=1;view=commentary',3939 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/335347.html?innings=2;view=commentary',2410 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/335351.html?innings=1;view=commentary',3512 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/335634.html?innings=1;view=commentary',1581 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/336201.html?innings=1;view=commentary',730 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/345469.html?innings=1;view=commentary',3032 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/345470.html?innings=1;view=commentary',1678 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/345471.html?innings=1;view=commentary',1396 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/345471.html?innings=2;view=commentary',1389 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/350046.html?innings=1;view=commentary',1982 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/350048.html?innings=2;view=commentary',2815 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/350479.html?innings=2;view=commentary',3104 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/360800.html?innings=2;view=commentary',679 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/361043.html?innings=2;view=commentary',1377 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/361045.html?innings=1;view=commentary',3337 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/366341.html?innings=1;view=commentary',4830 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/366341.html?innings=2;view=commentary',3054 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/377313.html?innings=1;view=commentary',1901 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/377313.html?innings=2;view=commentary',1771 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/401075.html?innings=1;view=commentary',1443 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/401075.html?innings=1;view=commentary',2698 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/403380.html?innings=1;view=commentary',1530 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/403380.html?innings=1;view=commentary',3390 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/403383.html?innings=1;view=commentary',3794 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/416237.html?innings=1;view=commentary',3676 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/416237.html?innings=2;view=commentary',4149 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/422629.html?innings=1;view=commentary',1568 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423783.html?innings=1;view=commentary',2185 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423783.html?innings=1;view=commentary',3095 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423783.html?innings=1;view=commentary',3655 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423784.html?innings=1;view=commentary',1280 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423784.html?innings=2;view=commentary',2566 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423785.html?innings=1;view=commentary',2506 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423785.html?innings=1;view=commentary',5209 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423785.html?innings=2;view=commentary',2376 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423785.html?innings=2;view=commentary',2475 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/423785.html?innings=2;view=commentary',3431 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/426406.html?innings=1;view=commentary',5175 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/426420.html?innings=1;view=commentary',5019 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/426720.html?innings=1;view=commentary',2730 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/426720.html?innings=2;view=commentary',1366 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/430508.html?innings=1;view=commentary',3271 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/430508.html?innings=1;view=commentary',3304 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/430508.html?innings=1;view=commentary',3329 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/433587.html?innings=1;view=commentary',1920 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/439140.html?innings=1;view=commentary',2807 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/439140.html?innings=1;view=commentary',2823 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450370.html?innings=1;view=commentary',700 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450370.html?innings=1;view=commentary',5182 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450370.html?innings=2;view=commentary',1436 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450370.html?innings=2;view=commentary',4528 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450375.html?innings=1;view=commentary',493 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450375.html?innings=1;view=commentary',1629 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450375.html?innings=1;view=commentary',4113 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450375.html?innings=1;view=commentary',5093 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450375.html?innings=2;view=commentary',1336 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450377.html?innings=1;view=commentary',4863 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',737 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',1277 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',2133 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',2363 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',2652 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',3003 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',4543 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',4716 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450381.html?innings=1;view=commentary',5242 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450384.html?innings=1;view=commentary',5003 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450386.html?innings=1;view=commentary',5072 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450501.html?innings=1;view=commentary',454 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/450501.html?innings=2;view=commentary',1399 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/452149.html?innings=1;view=commentary',1573 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/452149.html?innings=1;view=commentary',1590 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/452149.html?innings=1;view=commentary',1610 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/452151.html?innings=1;view=commentary',2969 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/461566.html?innings=1;view=commentary',2916 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/463153.html?innings=1;view=commentary',1226 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/464717.html?innings=1;view=commentary',2086 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/473925.html?innings=1;view=commentary',1503 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/473925.html?innings=2;view=commentary',2966 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/476596.html?innings=2;view=commentary',3175 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/489213.html?innings=1;view=commentary',3490 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/489215.html?innings=1;view=commentary',3069 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/503365.html?innings=1;view=commentary',2012 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/518960.html?innings=1;view=commentary',2089 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',854 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',1067 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',1275 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',1385 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',1493 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',2286 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',2590 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',4075 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',4298 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',4833 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',4941 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',5047 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=1;view=commentary',5155 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',1190 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',1401 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',1507 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',1821 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',1927 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',2044 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',2731 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',3420 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520593.html?innings=2;view=commentary',4613 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',554 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',874 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',1399 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',1598 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',1704 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',2006 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',2133 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',2534 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',2642 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',4051 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',4945 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=1;view=commentary',5599 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=2;view=commentary',1068 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=2;view=commentary',1201 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=2;view=commentary',1589 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=2;view=commentary',2091 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/520594.html?innings=2;view=commentary',2405 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/567358.html?innings=2;view=commentary',1300 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64731.html?innings=1;view=commentary',3038 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64833.html?innings=1;view=commentary',956 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64853.html?innings=2;view=commentary',472 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64858.html?innings=1;view=commentary',977 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64892.html?innings=2;view=commentary',1176 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/64943.html?innings=2;view=commentary',1233 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/66186.html?innings=2;view=commentary',2211 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/661891.html?innings=1;view=commentary',3400 UNION ALL
SELECT 'http://www.espncricinfo.com/ci/engine/match/66384.html?innings=1;view=commentary',4023

GO


