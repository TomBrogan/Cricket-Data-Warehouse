USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimPlayer]    Script Date: 04/12/2016 00:12:59 ******/
DROP PROCEDURE [dbo].[LoadDimPlayer]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimPlayer]    Script Date: 04/12/2016 00:12:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDimPlayer] as 

truncate table DimPlayer

insert into DimPlayer 
(PlayerUrl,
PlayerNum,
Name,
FullName,
Nickname,
Country,
Born,
BattingStyle,
BowlingStyle,
PlayingRole,
Height,
Education,
InANutshell)
select
PlayerUrl,
cast(replace(replace(PlayerUrl,'http://www.espncricinfo.com/ci/content/player/',''),'.html','') as int) as PlayerNum,
Name,
FullName,
Nickname,
Country,
Born,
BattingStyle,
BowlingStyle,
PlayingRole,
Height,
Education,
InANutshell
from CricketOSA.dbo.Player
order by PlayerNum


SET IDENTITY_INSERT dbo.DimPlayer ON;

insert into DimPlayer
(DimPlayerID,
PlayerUrl,
PlayerNum,
Name,
FullName,
Nickname,
Country,
Born,
BattingStyle,
BowlingStyle,
PlayingRole,
Height,
Education,
InANutshell)
select 
-1,
'Unknown',
-1,
'Unknown',
'Unknown', 
'Unknown',
'Unknown',
'Unknown',
'Unknown',
'Unknown', 
'Unknown',
'Unknown',
'Unknown',
'Unknown';

SET IDENTITY_INSERT dbo.DimPlayer OFF;









GO


