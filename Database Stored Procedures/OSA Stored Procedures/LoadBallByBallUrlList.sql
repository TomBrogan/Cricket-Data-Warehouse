USE [CricketOSA]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallUrlList]    Script Date: 03/12/2016 15:20:28 ******/
DROP PROCEDURE [dbo].[LoadBallByBallUrlList]
GO

/****** Object:  StoredProcedure [dbo].[LoadBallByBallUrlList]    Script Date: 03/12/2016 15:20:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[LoadBallByBallUrlList] as

declare @maxrownum int
select @maxrownum = max(rownum) from BallByBallUrlList

insert into BallByBallUrlList
select 
rownum = @maxrownum + row_number() over(order by Url, innings.num, pages.num)
, [Root] = Url
, TestName
, MatchNum
, Innings = innings.num
, Pages = pages.num
, Url = url
+ '?innings=' 
+ cast(innings.num as varchar(1))
+ ';page='
+ cast(pages.num as varchar(1))
+ ';view=commentary'
, Result = 'Waiting'
from ScorecardUrlList
join nums as innings on innings.num <= 4
join nums as pages on pages.num <= 6
where Url not in (select [Root] from BallByBallUrlList)




GO


