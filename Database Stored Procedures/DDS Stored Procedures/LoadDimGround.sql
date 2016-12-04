USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimGround]    Script Date: 04/12/2016 00:12:46 ******/
DROP PROCEDURE [dbo].[LoadDimGround]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimGround]    Script Date: 04/12/2016 00:12:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[LoadDimGround] as


truncate table DimGround

insert into DimGround (GroundName, GroundUrl, GroundCountry, Location, OtherNames, Established, Capacity, Floodlights, EndNames, PlayingArea, NamedAfter, OtherSports, Curator, HomeTeams)
select distinct
GroundName
, GroundUrl = Url
, GroundCountry = Country
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
from CricketRec.dbo.Ground


SET IDENTITY_INSERT dbo.DimGround ON;

insert into DimGround (DimGroundID, GroundName, GroundUrl, GroundCountry, Location, OtherNames, Established, Capacity, Floodlights, EndNames, PlayingArea, NamedAfter, OtherSports, Curator, HomeTeams)
select -1, 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown', 'Unknown';

SET IDENTITY_INSERT dbo.DimGround OFF;

GO


