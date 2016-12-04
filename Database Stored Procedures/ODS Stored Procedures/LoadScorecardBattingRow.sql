USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadScorecardBattingRow]    Script Date: 03/12/2016 17:54:48 ******/
DROP PROCEDURE [dbo].[LoadScorecardBattingRow]
GO

/****** Object:  StoredProcedure [dbo].[LoadScorecardBattingRow]    Script Date: 03/12/2016 17:54:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










--exec [LoadScorecardBattingRow]



CREATE proc [dbo].[LoadScorecardBattingRow] as 

truncate table CricketRec.dbo.ScorecardBattingRow;

with surnames as (
select 
Url as MatchUrl,
cast(replace(replace(Url,'http://stats.espncricinfo.com/ci/engine/match/',''),'.html','') as int) as MatchNum,
InningsNum,
Title as InningsName,
replace(replace(Title,' 1st innings',''),' 2nd innings','') as Team,
BattingOrder,
Name as PlayerName,
case 
when charindex(' ', Name) = 0 then Name
else substring(Name, charindex(' ', Name) + 1, 1000) 
end as Surname,
PlayerUrl,
--cast(replace(replace(PlayerUrl,'www.espncricinfo.com/ci/content/player/',''),'.html','') as int) as PlayerNum,
Dismissal,
case
when Dismissal like 'b %' then 'Bowled'
when Dismissal like ' b %' then 'Bowled'
when Dismissal like 'c %' then 'Caught'
when Dismissal like 'lbw %' then 'LBW'
when Dismissal like 'st %' then 'Stumped'
when Dismissal like 'run out%' then 'Run Out'
when Dismissal like 'hit wicket%' then 'Hit Wicket'
when Dismissal like 'handled the ball%' then 'Handled the Ball'
when Dismissal like 'obstructing the field%' then 'Obstructing the Field'
when Dismissal like 'not out%' then 'Not Out'
when Dismissal in ('retired hurt','retired not out','retired ill') then 'Retired (Not Out)'
when Dismissal = 'retired out' then 'Retired (Out)'
when Dismissal in ('absent ill','absent hurt') then 'Absent'
end as DismissalName,
case 
when Dismissal like 'b %' then substring(Dismissal,3,1000)
when Dismissal like '% b %' then substring(Dismissal,patindex('% b %',Dismissal) + 3,1000)
else null
end as BowlerName,
case 
when Dismissal like 'st %' then replace(substring(Dismissal,4,patindex('% b %',Dismissal) - 4),'&dagger;','')
when Dismissal like 'c %' 
then replace(replace(substring(Dismissal,3,patindex('% b %',Dismissal) - 3),'&dagger;',''),'&amp;',substring(Dismissal,patindex('% b %',Dismissal) + 3,1000))
end as FielderName,
cast(RunsScored as int) as RunsScored,
case 
when col1 = 'M' and Name not in ('Total', 'Extras') and Details1 <> '' then cast(Details1 as int)
when col2 = 'M' and Name not in ('Total', 'Extras') and Details2 <> '' then cast(Details2 as int)
when col3 = 'M' and Name not in ('Total', 'Extras') and Details3 <> '' then cast(Details3 as int)
when col4 = 'M' and Name not in ('Total', 'Extras') and Details4 <> '' then cast(Details4 as int)
else null
end as MinutesBatted,
case 
when col1 = 'B' and Name not in ('Total', 'Extras') and Details1 <> '' then cast(Details1 as int)
when col2 = 'B' and Name not in ('Total', 'Extras') and Details2 <> '' then cast(Details2 as int)
when col3 = 'B' and Name not in ('Total', 'Extras') and Details3 <> '' then cast(Details3 as int)
when col4 = 'B' and Name not in ('Total', 'Extras') and Details4 <> '' then cast(Details4 as int)
else null
end as BallsFaced,
case 
when col1 = '4s' and Name not in ('Total', 'Extras') and Details1 <> '' then cast(Details1 as int)
when col2 = '4s' and Name not in ('Total', 'Extras') and Details2 <> '' then cast(Details2 as int)
when col3 = '4s' and Name not in ('Total', 'Extras') and Details3 <> '' then cast(Details3 as int)
when col4 = '4s' and Name not in ('Total', 'Extras') and Details4 <> '' then cast(Details4 as int)
else null
end as BoundaryFours,
case 
when col1 = '6s' and Name not in ('Total', 'Extras') and Details1 <> '' then cast(Details1 as int)
when col2 = '6s' and Name not in ('Total', 'Extras') and Details2 <> '' then cast(Details2 as int)
when col3 = '6s' and Name not in ('Total', 'Extras') and Details3 <> '' then cast(Details3 as int)
when col4 = '6s' and Name not in ('Total', 'Extras') and Details4 <> '' then cast(Details4 as int)
else null
end as BoundarySixes 
from CricketOSA.dbo.Scorecard
where Name <> 'Total'
)

insert into CricketRec.dbo.ScorecardBattingRow
select distinct 
s1.[MatchUrl] 
,s1.[MatchNum]
,s1.[InningsNum]
,s1.[InningsName]
,s1.[Team]
,'Unknown'
,s1.[BattingOrder]
,s1.[PlayerName]
,s1.[Surname]
,s1.[PlayerUrl]
,s1.[Dismissal]
,s1.[DismissalName]
,DismissedCount =
	case 
	when s1.DismissalName in 
		('Bowled','Caught','LBW','Stumped','Run Out','Hit Wicket','Handled the Ball','Obstructing the Field','Retired (Out)')
	then 1
	when s1.DismissalName in ('Absent','Not Out', 'Retired (Not Out)') then 0
	end
,s1.[BowlerName]
,s1.[FielderName]
,s1.[RunsScored]
,s1.[MinutesBatted]
,s1.[BallsFaced]
,s1.[BoundaryFours]
,s1.[BoundarySixes]
,case when s2.PlayerName is not null then 'Y' else 'N' end as UseFullName
,case when s2.PlayerName is not null then s1.PlayerName else s1.Surname end as CommentaryName
, Byes =
case when s1.playername = 'Extras' then
	cast(
	case
	when s1.Dismissal like '(b %'
	then
		case
		when charindex(',',s1.Dismissal) <> 0 then replace(left(s1.Dismissal,charindex(',',s1.Dismissal)-1),'(b ','')
		else replace(left(s1.Dismissal,charindex(')',s1.Dismissal)-1),'(b ','')
		end
	else 0
	end
	as int)
end
, LegByes =
case when s1.playername = 'Extras' then
	cast(
	case
	when s1.Dismissal like '%lb%'
	then replace
		(
			substring
			(
			s1.Dismissal,
			charindex('lb',s1.Dismissal),
				case
				when charindex(',',s1.Dismissal, charindex('lb',s1.Dismissal)) <> 0
				then charindex(',',s1.Dismissal, charindex('lb',s1.Dismissal)) - charindex('lb',s1.Dismissal)
				else charindex(')',s1.Dismissal, charindex('lb',s1.Dismissal)) - charindex('lb',s1.Dismissal)
				end
			)
		,'lb ',''
		)
	else 0
	end
	as int)
end
, Wides =
case when s1.playername = 'Extras' then
	cast(
	case
	when s1.Dismissal like '%w%'
	then replace
		(
			substring
			(
			s1.Dismissal,
			charindex('w',s1.Dismissal),
				case
				when charindex(',',s1.Dismissal, charindex('w',s1.Dismissal)) <> 0
				then charindex(',',s1.Dismissal, charindex('w',s1.Dismissal)) - charindex('w',s1.Dismissal)
				else charindex(')',s1.Dismissal, charindex('w',s1.Dismissal)) - charindex('w',s1.Dismissal)
				end
			)
		,'w ',''
		)
	else 0
	end
	as int)
end
, NoBalls =
case when s1.playername = 'Extras' then
	cast(
	case
	when s1.Dismissal like '%nb%'
	then replace
		(
			substring
			(
			s1.Dismissal,
			charindex('nb',s1.Dismissal),
				case
				when charindex(',',s1.Dismissal, charindex('nb',s1.Dismissal)) <> 0
				then charindex(',',s1.Dismissal, charindex('nb',s1.Dismissal)) - charindex('nb',s1.Dismissal)
				else charindex(')',s1.Dismissal, charindex('nb',s1.Dismissal)) - charindex('nb',s1.Dismissal)
				end
			)
		,'nb ',''
		)
	else 0
	end
	as int)
end
, PenaltyRuns =
case when s1.playername = 'Extras' then
	cast(
	case
	when s1.Dismissal like '%pen%'
	then replace
		(
			substring
			(
			s1.Dismissal,
			charindex('pen',s1.Dismissal),
				case
				when charindex(',',s1.Dismissal, charindex('pen',s1.Dismissal)) <> 0
				then charindex(',',s1.Dismissal, charindex('pen',s1.Dismissal)) - charindex('pen',s1.Dismissal)
				else charindex(')',s1.Dismissal, charindex('pen',s1.Dismissal)) - charindex('pen',s1.Dismissal)
				end
			)
		,'pen ',''
		)
	else 0
	end
	as int)
end
, WidesCountedAgainstBowler = 
	case
	when cast(replace(TestName, 'Test #','') as int) < 961 then 'N'
	when cast(replace(TestName, 'Test #','') as int) between 989 and 994 then 'N'
	when cast(replace(TestName, 'Test #','') as int) in (975,976,977,978,980,981,982,984,985) then 'N'
	else 'Y'
	end
, BallByBallDataAvailable = 'N'
from surnames s1
left join surnames s2 
on s1.MatchUrl = s2.MatchUrl 
and s1.InningsName = s2.InningsName 
and s1.Surname = s2.Surname
and s1.PlayerUrl <> s2.PlayerUrl
left join CricketOSA.dbo.ScorecardUrlList su on su.url = s1.MatchUrl


update CricketRec.dbo.ScorecardBattingRow
set BallByBallDataAvailable = 'Y'
where MatchNum in (
select 
distinct
replace(left(Url,patindex('%.html%',Url) - 1), 'http://stats.espncricinfo.com/ci/engine/match/','')
from CricketOSA.dbo.BallByBall
);



with AddBowlingTeam as (
select
case when Team = HomeTeam then AwayTeam else HomeTeam end as BowlingTeamCalc, BowlingTeam
from CricketRec.dbo.ScorecardBattingRow	s
join Match m on s.MatchUrl = m.Url
)
update AddBowlingTeam set BowlingTeam = BowlingTeamCalc





GO


