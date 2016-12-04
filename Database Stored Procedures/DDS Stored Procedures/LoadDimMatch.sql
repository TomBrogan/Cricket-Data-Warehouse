USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimMatch]    Script Date: 04/12/2016 00:12:52 ******/
DROP PROCEDURE [dbo].[LoadDimMatch]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimMatch]    Script Date: 04/12/2016 00:12:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--exec [LoadDimMatch]



CREATE proc [dbo].[LoadDimMatch] as

truncate table DimMatch

insert into DimMatch (MatchUrl, MatchNum, MatchName, TestName, TestNum, MatchDates, HomeTeam, AwayTeam, TossResult, CommentaryAvailable)
select distinct
m.Url as MatchUrl,
s.MatchNum,
m.SeriesText as MatchName,
s.TestName as TestName,
cast(replace(replace(s.TestName, 'Test # ',''),' - Live','') as int) as TestNum,
m.MatchDate as MatchDates,
m.HomeTeam,
m.AwayTeam,
replace(TossResult,'<br>','') as TossResult,
CommentaryAvailable =
	case
	when b.MatchNum is null then 'N'
	Else 'Y'
	end
from CricketOSA.dbo.Match m
join CricketOSA.dbo.ScorecardUrlList s on s.url = m.Url
left join 
	(select distinct MatchNum 
	from CricketOSA.dbo.UrlList	u
	join CricketOSA.dbo.BallByBall bb 
	on bb.url = u.url) b
		on b.MatchNum = s.MatchNum

insert into DimMatch (MatchUrl, MatchName, ODIName, ODINum, MatchDates, HomeTeam, AwayTeam, TossResult, CommentaryAvailable, OversPerTeam, TimeOfDay)
select distinct
m.Url as MatchUrl,
m.SeriesText as MatchName,
s.ODIName as ODIName,
cast(replace(s.ODIName, 'ODI # ','') as int) as ODINum,
m.MatchDate as MatchDates,
m.HomeTeam,
m.AwayTeam,
replace(TossResult,'<br>','') as TossResult,
CommentaryAvailable =
	case
	when b.ODIName is null then 'N'
	Else 'Y'
	end,
m.OversPerTeam,
m.TimeOfDay
from CricketRec.dbo.ODIMatch m
join CricketOSA.dbo.ODIUrlList s on s.url = m.Url
left join 
	(select distinct ODIName 
	from CricketOSA.dbo.ODIBallByBallUrlList	u
	join CricketOSA.dbo.ODIBallByBall bb 
	on bb.url = u.url) b
		on b.ODIName = s.ODIName


SET IDENTITY_INSERT dbo.DimMatch ON;

insert into DimMatch (DimMatchID, MatchUrl, MatchNum, MatchName, TestName, TestNum, MatchDates, TossResult, CommentaryAvailable)
select -1, 'Unknown', -1, 'Unknown', 'Unknown', -1, 'Unknown', 'Unknown', 'UNK';

SET IDENTITY_INSERT dbo.DimMatch OFF;






GO


