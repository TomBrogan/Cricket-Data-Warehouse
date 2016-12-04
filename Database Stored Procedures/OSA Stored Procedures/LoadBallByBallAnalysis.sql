USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallAnalysis]    Script Date: 03/12/2016 15:20:23 ******/
DROP PROCEDURE [dbo].[LoadBallByBallAnalysis]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallAnalysis]    Script Date: 03/12/2016 15:20:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE proc [dbo].[LoadBallByBallAnalysis] 

@Url varchar(8000)

as

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

,LeadRow as (
select
rownum
, element
, Ball = lead(element,1) over(order by rownum)
, Comms = lead(element,4) over(order by rownum)
, LongComms = 
	lead(element,4) over(order by rownum)
	+ lead(element,5) over(order by rownum) 
	+ lead(element,6) over(order by rownum) 
from ElementClean
)

,CommsSelected as (
select
rownum
, element
, Ball = replace(Ball,'</div>','')
, Commentary = case when Comms like '%<span class="commsImportant">%' then LongComms else Comms end
from LeadRow
where element like '%<div class="commentary-overs">%'
)

,CommentaryTidy as (
select
rownum
, element
, Ball
, Commentary
, TidyCommentary =
	replace(	
		replace(
			replace(
				replace(
					replace(Commentary,'</p>','')
				, '<span class="commsImportant">','')
			, '</span>','')
		, char(10),'')
	,char(13),'')
from CommsSelected
)

insert into BallByBall
select
rownum
, @Url
, BallNum = Ball
, Bowler = left(TidyCommentary,charindex(' to ',TidyCommentary)-1)
, Batsman =
	substring(
		TidyCommentary
		,charindex(' to ',TidyCommentary)+4
		,charindex(',',TidyCommentary) - (charindex(' to ',TidyCommentary)+4)
	)
, Result =
	case
	when len(TidyCommentary) - len(replace(TidyCommentary,',','')) > 1
	then substring(
		TidyCommentary
		,charindex(',',TidyCommentary)+1
		,charindex(',',TidyCommentary,charindex(',',TidyCommentary)+1) - (charindex(',',TidyCommentary)+1)
		)
	when len(Commentary) - len(replace(Commentary,',','')) = 1
	then substring(TidyCommentary,charindex(',',TidyCommentary)+1,1000)
	else 'Unknown'
	end
, Commentary = replace(replace(TidyCommentary,',',', '),',  ',', ')
, NextComms = Commentary
from CommentaryTidy
where left(Ball,1) like '[0-9]'


update BallByBall
set Result = Result + ', OUT'
where Result not like '%OUT%'
and Url = @Url
and (Commentary like '% runs, OUT,%'
or Commentary like '% run, OUT,%'
or Commentary like '% bye, OUT,%'
or Commentary like '% byes, OUT,%'
or Commentary like '% ball, OUT,%'
or Commentary like '% balls, OUT'
or Commentary like '% runs, OUT'
or Commentary like '% run, OUT'
or Commentary like '% bye, OUT'
or Commentary like '% byes, OUT'
or Commentary like '% ball, OUT'
or Commentary like '% balls, OUT'
or Commentary like '% wide, OUT'
or Commentary like '% wides, OUT'
or Commentary like '% wide, OUT,%'
or Commentary like '% wides, OUT,%'
)




GO


