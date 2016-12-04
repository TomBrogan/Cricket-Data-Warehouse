USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIMatch]    Script Date: 03/12/2016 17:32:25 ******/
DROP PROCEDURE [dbo].[LoadODIMatch]
GO

/****** Object:  StoredProcedure [dbo].[LoadODIMatch]    Script Date: 03/12/2016 17:32:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE proc [dbo].[LoadODIMatch] as 

truncate table CricketRec.dbo.ODIMatch;

with DateParts as (
select
m.Url,
s.ODIName,
SeriesText,
SeriesName =
	case
	when patindex('% - %', SeriesText) = 0 then SeriesText
	else Left(SeriesText,patindex('% - %', SeriesText) - 1)
	end,
HomeTeam,
AwayTeam,
m.Result,
HomeAwayResult =
	case
	when m.result like '% won by %'
	then 
		case
		when Left(m.Result, patindex('% won by %', m.Result) - 1) = HomeTeam
		then 'Home win'
		when Left(m.Result, patindex('% won by %', m.Result) - 1) = AwayTeam
		then 'Away win'
		else 'Unknown'
		end
	else m.Result
	end,
Ground,
GroundUrl,
MatchDate,
DayNum =
	left(MatchDate, patindex('%[a-z]%',MatchDate) - 1),
StartMonth =
case
when MatchDate like '%January%' then 'January'
when MatchDate like '%February%' then 'February'
when MatchDate like '%March%' then 'March'
when MatchDate like '%April%' then 'April'
when MatchDate like '%May%' then 'May'
when MatchDate like '%June%' then 'June'
when MatchDate like '%July%' then 'July'
when MatchDate like '%August%' then 'August'
when MatchDate like '%September%' then 'September'
when MatchDate like '%October%' then 'October'
when MatchDate like '%November%' then 'November'
when MatchDate like '%December%' then 'December'
end,
StartMonthNum =
case
when MatchDate like '%January%' then '01'
when MatchDate like '%February%' then '02'
when MatchDate like '%March%' then '03'
when MatchDate like '%April%' then '04'
when MatchDate like '%May%' then '05'
when MatchDate like '%June%' then '06'
when MatchDate like '%July%' then '07'
when MatchDate like '%August%' then '08'
when MatchDate like '%September%' then '09'
when MatchDate like '%October%' then '10'
when MatchDate like '%November%' then '11'
when MatchDate like '%December%' then '12'
end,
case
when charindex('(',replace(replace(MatchDate,'- day/night match ',''),'- night match ','')) <> 0 
then substring(MatchDate,charindex('(',replace(replace(MatchDate,'- day/night match ',''),'- night match ','')) - 5,4)
else null
end as StartYear,
TossResult,
TossWinningTeam =
	case
	when charindex(',',TossResult) <= 1
	then TossResult
	else ltrim(left(TossResult,charindex(',',TossResult) - 1))
	end,
TossDecision =
	replace(substring(TossResult,patindex('%chose to%',TossResult) + 9,1000),'<br>',''),
PlayerOfTheMatch,
OversPerTeam = cast(left(right(MatchDate,14),2) as int),
TimeOfDay =
	case
	when MatchDate like '%day/night match%' then 'Day/night'
	when MatchDate like '%night match%' then 'Night'
	else 'Day'
	end
from CricketOSA.dbo.ODIMatch m
join CricketOSA.dbo.ODIUrlList s
	on m.Url = s.Url
)

insert into ODIMatch
select
Url,
ODIName,
SeriesText,
SeriesName,
HomeTeam,
AwayTeam,
Result,
HomeAwayResult,
Ground,
GroundUrl,
MatchDate,
DayNum = case when DayNum like '%,%' then left(DayNum,charindex(',',DayNum)-1) else DayNum End,
StartMonth,
StartMonthNum,
StartYear,
DimMatchStartDateKey =
	cast(
	StartYear
	+ StartMonthNum
	+	right('0' + replace(replace(rtrim(ltrim(
			case when DayNum like '%,%' then left(DayNum,charindex(',',DayNum)-1) else DayNum End
		)),char(10),''),char(13),''),2)
	as int),
TossResult,
TossWinningTeam,
TossDecision,
PlayerOfTheMatch,
OversPerTeam,
TimeOfDay
from DateParts






GO


