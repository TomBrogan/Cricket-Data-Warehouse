USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadOSAUpdate]    Script Date: 04/12/2016 09:25:25 ******/
DROP PROCEDURE [dbo].[LoadOSAUpdate]
GO

/****** Object:  StoredProcedure [dbo].[LoadOSAUpdate]    Script Date: 04/12/2016 09:25:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadOSAUpdate] as

truncate table OSAUpdate

insert into OSAUpdate
SELECT 'Batsman','Shoaib Malik',63948,3,'44.4',NULL UNION ALL
SELECT 'Batsman','Mohammad Sami',63948,3,'98.5',NULL UNION ALL
SELECT 'Batsman','Samuels',63959,4,'45.1',NULL UNION ALL
SELECT 'Batsman','Samuels',63959,4,'45.2',NULL UNION ALL
SELECT 'Batsman','Samuels',63959,4,'45.3',NULL UNION ALL
SELECT 'Batsman','Samuels',63959,4,'45.4',NULL UNION ALL
SELECT 'Batsman','Harbhajan Singh',63962,2,'110.3',NULL UNION ALL
SELECT 'Batsman','White',63963,1,'96.2',NULL UNION ALL
SELECT 'Batsman','Aminul Islam',63968,1,'4.1',NULL UNION ALL
SELECT 'Batsman','Aminul Islam',63968,1,'4.2',NULL UNION ALL
SELECT 'Batsman','Aminul Islam',63968,1,'9.6',NULL UNION ALL
SELECT 'Batsman','Aminul Islam',63968,1,'15.1',NULL UNION ALL
SELECT 'Batsman','Sanwar Hossain',63968,1,'38.3',NULL UNION ALL
SELECT 'Batsman','Sanwar Hossain',63968,1,'39.3',NULL UNION ALL
SELECT 'Batsman','Sanwar Hossain',63968,1,'40.1',NULL UNION ALL
SELECT 'Batsman','Sanwar Hossain',63968,1,'41.1',NULL UNION ALL
SELECT 'Batsman','Sanwar Hossain',63968,1,'41.2',NULL UNION ALL
SELECT 'Batsman','Vincent',63968,2,'32.4',NULL UNION ALL
SELECT 'Batsman','Vincent',63968,2,'32.5',NULL UNION ALL
SELECT 'Batsman','Fleming',63968,2,'52.4',NULL UNION ALL
SELECT 'Batsman','Gripper',63969,2,'1.1',NULL UNION ALL
SELECT 'Batsman','A Flower',63969,2,'36.6',NULL UNION ALL
SELECT 'Batsman','Friend',63969,2,'65.6',NULL UNION ALL
SELECT 'Batsman','Friend',63969,3,'18.2',NULL UNION ALL
SELECT 'Batsman','GW Flower',63970,1,'22.1',NULL UNION ALL
SELECT 'Batsman','GW Flower',63970,1,'22.2',NULL UNION ALL
SELECT 'Batsman','Jayasuriya',63970,2,'0.6',NULL UNION ALL
SELECT 'Batsman','Samaraweera',63971,1,'82.5',NULL UNION ALL
SELECT 'Batsman','Samaraweera',63971,1,'89.2',NULL UNION ALL
SELECT 'Batsman','Sanwar Hossain',63972,1,'41.2',NULL UNION ALL
SELECT 'Batsman','Mehrab Hossain',63973,1,'0.1',NULL UNION ALL
SELECT 'Batsman','Mehrab Hossain',63973,1,'0.2',NULL UNION ALL
SELECT 'Batsman','Mehrab Hossain',63973,1,'0.3',NULL UNION ALL
SELECT 'Batsman','Mehrab Hossain',63973,1,'0.4',NULL UNION ALL
SELECT 'Batsman','Mehrab Hossain',63973,1,'0.5',NULL UNION ALL
SELECT 'Batsman','Mehrab Hossain',63973,1,'0.6',NULL UNION ALL
SELECT 'Batsman','Aminul Islam',63973,1,'28.4',NULL UNION ALL
SELECT 'Batsman','Inzamam-ul-Haq',63973,2,'34.3',NULL UNION ALL
SELECT 'Batsman','Abdul Razzaq',63973,2,'74.4',NULL UNION ALL
SELECT 'Batsman','Saqlain Mushtaq',63973,2,'101.3',NULL UNION ALL
SELECT 'Batsman','Chanderpaul',63974,2,'60.6',NULL UNION ALL
SELECT 'Batsman','Cairns',63981,4,'86.2',NULL UNION ALL
SELECT 'Batsman','Giles',63983,2,'34.4',NULL UNION ALL
SELECT 'Batsman','Atapattu',63990,1,'64.1',NULL UNION ALL
SELECT 'Batsman','Vaughan',63990,2,'0.2',NULL UNION ALL
SELECT 'Batsman','Trescothick',63991,2,'0.5',NULL UNION ALL
SELECT 'Batsman','Caddick',64000,1,'142.4',NULL UNION ALL
SELECT 'Batsman','Srinath',64004,1,'162.4',NULL UNION ALL
SELECT 'Result','no run',573011,3,'55.6',NULL UNION ALL
SELECT 'Batsman','Atapattu',64056,3,'22.4',NULL UNION ALL
SELECT 'Result','1 run',573011,3,'56.1',NULL UNION ALL
SELECT 'Batsman','Gayle',64066,3,'4.3',NULL UNION ALL
SELECT 'Batsman','Gayle',64066,3,'4.4',NULL UNION ALL
SELECT 'Batsman','Gayle',64066,3,'4.5',NULL UNION ALL
SELECT 'Batsman','Gayle',64066,3,'4.6',NULL UNION ALL
SELECT 'Result','no run',64066,3,'99.6',NULL UNION ALL
SELECT 'Result','OUT',64066,3,'99.3',NULL UNION ALL
SELECT 'Result','OUT',64075,3,'72.2',NULL UNION ALL
SELECT 'Result','no run',64075,3,'72.6',NULL UNION ALL
SELECT 'Result','OUT',209929,1,'16.5',NULL UNION ALL
SELECT 'Result','no run',209929,1,'16.6',NULL UNION ALL
SELECT 'Result','OUT',63963,1,'96.1',NULL UNION ALL
SELECT 'Result','1 run',63963,1,'96.2',NULL UNION ALL
SELECT 'Result','no run',209929,3,'12.6',NULL UNION ALL
SELECT 'Result','1 run',668951,2,'136.3',NULL UNION ALL
SELECT 'Result','OUT',64075,1,'95.1',NULL UNION ALL
SELECT 'Batsman','Javed Omar',64122,4,'42.5',NULL UNION ALL
SELECT 'Result','no run',209929,1,'12.6',NULL UNION ALL
SELECT 'Result','OUT',209929,3,'12.1',NULL UNION ALL
SELECT 'Result','no run',64075,1,'95.6',NULL UNION ALL
SELECT 'Batsman','Mpofu',215253,3,'49.5',NULL
GO


