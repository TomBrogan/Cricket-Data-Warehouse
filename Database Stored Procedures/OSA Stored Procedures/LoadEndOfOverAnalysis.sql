USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadEndOfOverAnalysis]    Script Date: 03/12/2016 15:20:38 ******/
DROP PROCEDURE [dbo].[LoadEndOfOverAnalysis]
GO

/****** Object:  StoredProcedure [dbo].[LoadEndOfOverAnalysis]    Script Date: 03/12/2016 15:20:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE Proc [dbo].[LoadEndOfOverAnalysis] 

@Url varchar(800)

as

delete from EndOfOverAnalysis where Url = @Url;

with ElementClean as (
select
rownum,
element
from SingleElement
where element <> '>'
)

,LeadCols as (
select
rownum,
element as OverNum,
lead(element,1,0) over(order by rownum) as OverResult,
lead(element,2,0) over(order by rownum) as Score,
lead(element,9,0) over(order by rownum) as BatsmanOnStrike,
lead(element,11,0) over(order by rownum) as BatsmanOnStrikeScore,
lead(element,25,0) over(order by rownum) as CurrentBowler,
lead(element,27,0) over(order by rownum) as CurrentBowlerAnalysis,
lead(element,15,0) over(order by rownum) as BatsmanOffStrike,
lead(element,17,0) over(order by rownum) as BatsmanOffStrikeScore,
lead(element,31,0) over(order by rownum) as OtherBowler,
lead(element,33,0) over(order by rownum) as OtherBowlerAnalysis
from ElementClean
)

insert into EndOfOverAnalysis
select
rownum,
@Url,
case when charindex('<',OverNum) > 0 then left(OverNum,charindex('<',OverNum)-1) else OverNum end as OverNum,
 case when charindex('<',OverResult) > 0 then left(OverResult,charindex('<',OverResult)-1) else OverResult end as OverResult,
 case when charindex('<',Score) > 0 then left(Score,charindex('<',Score)-1) else Score end as Score,
 case when charindex('<',BatsmanOnStrike) > 0 then left(BatsmanOnStrike,charindex('<',BatsmanOnStrike)-1) else BatsmanOnStrike end as BatsmanOnStrike,
 case when charindex('<',BatsmanOnStrikeScore) > 0 then left(BatsmanOnStrikeScore,charindex('<',BatsmanOnStrikeScore)-1) else BatsmanOnStrikeScore end as BatsmanOnStrikeScore,
 case when charindex('<',CurrentBowler) > 0 then left(CurrentBowler,charindex('<',CurrentBowler)-1) else CurrentBowler end as CurrentBowler,
 case when charindex('<',CurrentBowlerAnalysis) > 0 then left(CurrentBowlerAnalysis,charindex('<',CurrentBowlerAnalysis)-1) else CurrentBowlerAnalysis end as CurrentBowlerAnalysis,
 case when charindex('<',BatsmanOffStrike) > 0 then left(BatsmanOffStrike,charindex('<',BatsmanOffStrike)-1) else BatsmanOffStrike end as BatsmanOffStrike,
 case when charindex('<',BatsmanOffStrikeScore) > 0 then left(BatsmanOffStrikeScore,charindex('<',BatsmanOffStrikeScore)-1) else BatsmanOffStrikeScore end as BatsmanOffStrikeScore,
 case when charindex('<',OtherBowler) > 0 then left(OtherBowler,charindex('<',OtherBowler)-1) else OtherBowler end as OtherBowler,
 case when charindex('<',OtherBowlerAnalysis) > 0 then left(OtherBowlerAnalysis,charindex('<',OtherBowlerAnalysis)-1) else OtherBowlerAnalysis end as OtherBowlerAnalysis
 from Leadcols
where OverNum like 'End of Over%';



GO


