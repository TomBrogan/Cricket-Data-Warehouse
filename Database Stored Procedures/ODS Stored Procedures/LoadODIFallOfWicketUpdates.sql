USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIFallOfWicketUpdates]    Script Date: 04/12/2016 09:25:17 ******/
DROP PROCEDURE [dbo].[LoadODIFallOfWicketUpdates]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIFallOfWicketUpdates]    Script Date: 04/12/2016 09:25:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[LoadODIFallOfWicketUpdates] as

truncate table ODIFallOfWicketUpdates

insert into ODIFallOfWicketUpdates
SELECT 'ODI # 1293',2,4,6 UNION ALL
SELECT 'ODI # 1411',2,1,8 UNION ALL
SELECT 'ODI # 1427',1,1,4 UNION ALL
SELECT 'ODI # 2247',1,5,5 UNION ALL
SELECT 'ODI # 2448',2,3,6 UNION ALL
SELECT 'ODI # 2712',2,1,5 UNION ALL
SELECT 'ODI # 2980',2,2,7 UNION ALL
SELECT 'ODI # 2982',1,6,8 UNION ALL
SELECT 'ODI # 3047',1,4,4 UNION ALL
SELECT 'ODI # 3136',1,1,3 UNION ALL
SELECT 'ODI # 3357',1,1,2
GO


