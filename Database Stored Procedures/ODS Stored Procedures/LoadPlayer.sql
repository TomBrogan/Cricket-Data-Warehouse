USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayer]    Script Date: 03/12/2016 17:44:40 ******/
DROP PROCEDURE [dbo].[LoadPlayer]
GO

/****** Object:  StoredProcedure [dbo].[LoadPlayer]    Script Date: 03/12/2016 17:44:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadPlayer] as 

truncate table Player

insert into Player
select
PlayerID
, PlayerUrl
, Name
, Country
, FullName
, Born
, Nickname
, PlayingRole
, BattingStyle
, BowlingStyle
, Height
, Education
, InANutshell
from CricketOSA.dbo.Player


GO


