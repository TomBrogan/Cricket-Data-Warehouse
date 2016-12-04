USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadGround]    Script Date: 03/12/2016 17:26:53 ******/
DROP PROCEDURE [dbo].[LoadGround]
GO

/****** Object:  StoredProcedure [dbo].[LoadGround]    Script Date: 03/12/2016 17:26:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadGround] as 

truncate table Ground

insert into Ground
select
Url
, GroundName
, Country
, Location
, OtherNames
, Established
, Capacity
, Floodlights
, EndNames
, PlayingArea
, NamedAfter
, OtherSports
, Curator
, HomeTeams
from CricketOSA.dbo.Ground

GO


