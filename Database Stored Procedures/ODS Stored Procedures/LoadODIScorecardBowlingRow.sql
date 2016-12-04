USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIScorecardBowlingRow]    Script Date: 03/12/2016 17:42:51 ******/
DROP PROCEDURE [dbo].[LoadODIScorecardBowlingRow]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIScorecardBowlingRow]    Script Date: 03/12/2016 17:42:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[LoadODIScorecardBowlingRow] as

truncate table ODIScorecardBowlingRow

insert into ODIScorecardBowlingRow
select
sb.Url,
u.ODIName,
InningsNum,
Title,
BowlingTeam = null,
BattingTeam = replace(replace(Title,' innings Bowling',''),' innings Bowling',''),
BowlingTeamAtHome = null,
BowlingPosition = row_number() over(partition by sb.Url, InningsNum order by rownum),
PlayerUrl = case when PlayerUrl like '%"%' then left(PlayerUrl, charindex('"',PlayerUrl)-1) else PlayerUrl end,
Bowler,
Surname =
	case
	when charindex(' ', Bowler) = 0 then Bowler
	else substring(Bowler, charindex(' ', Bowler) + 1, 1000) 
	end,
CommentaryName =
	case
	when charindex(' ', Bowler) = 0 then Bowler
	else substring(Bowler, charindex(' ', Bowler) + 1, 1000) 
	end,
Overs,
FullOvers =
	cast(
	case
	when Overs like '%.%'
	then Left(Overs,charindex('.',Overs)-1)
	else Overs
	end
	as int),
PartOver =
	cast(
	case
	when Overs like '%.%'
	then substring(Overs, charindex('.',Overs)+1, 1) 
	else 0
	end
	as int),
BallsPerOver = case when BallsPerOver is not null then BallsPerOver else 6 end,
Deliveries =
	(
	cast(
	case
	when Overs like '%.%'
	then Left(Overs,charindex('.',Overs)-1)
	else Overs
	end
	as int)
	*
	case when BallsPerOver is not null then BallsPerOver else 6 end
	)
	+
	cast(
	case
	when Overs like '%.%'
	then substring(Overs, charindex('.',Overs)+1, 1) 
	else 0
	end
	as int),
Maidens = cast(Maidens as int),
Runs = cast(Runs as int),
Wickets = cast(Wickets as int)
from cricketOSA.dbo.ODIScorecardBowling sb
left join cricketRec.dbo.ODIBallsPerOver bpo on bpo.Url = sb.Url
left join cricketOSA.dbo.ODIUrlList u on u.Url = sb.Url;

update s1
set CommentaryName = Bowler
from ODIScorecardBowlingRow s1
where exists (
	select 1
	from ODIScorecardBowlingRow s2
	where s1.Url = s2.Url
	and s1.InningsNum = s2.InningsNum
	and s1.Surname = s2.Surname
	and s1.PlayerUrl <> s2.PlayerUrl
	)


update s
set 
BowlingTeam =
	case 
	when BattingTeam = HomeTeam then Awayteam
	when BattingTeam = AwayTeam then HomeTeam
	end,
BowlingTeamAtHome =
	case 
	when BattingTeam = HomeTeam then 'N'
	when BattingTeam = AwayTeam then 'Y'
	end
from ODIScorecardBowlingRow s
join ODIMatch m on m.Url = s.Url




GO


