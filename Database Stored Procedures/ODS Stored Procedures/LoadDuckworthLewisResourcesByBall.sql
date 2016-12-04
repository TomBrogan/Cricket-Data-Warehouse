USE [CricketRec]
GO

/****** Object:  StoredProcedure [dbo].[LoadDuckworthLewisResourcesByBall]    Script Date: 03/12/2016 17:24:13 ******/
DROP PROCEDURE [dbo].[LoadDuckworthLewisResourcesByBall]
GO

/****** Object:  StoredProcedure [dbo].[LoadDuckworthLewisResourcesByBall]    Script Date: 03/12/2016 17:24:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDuckworthLewisResourcesByBall] as

truncate table DuckworthLewisResourcesByBall;

with up as (
select OversLeft, WicketsLost = cast(Replace(WicketsLost,'W','') as INT), ResourcesRemaining
from CricketOSA.dbo.DuckworthLewisResources
unpivot
(ResourcesRemaining For WicketsLost in
	(W0,W1,W2,W3,W4,W5,W6,W7,W8,W9)
) as unpvt
)

,tst as (
select up.*
, ResourcesRemainingAtEnd = isnull(up2.ResourcesRemaining,0)
, Num
, BallsRemaining = 6 * (up.OversLeft - 1) + Num
, ResourcesRemainingEachBall = round(isnull(up2.ResourcesRemaining,0) + (1.0 * Num / 6.0) * (up.ResourcesRemaining - isnull(up2.ResourcesRemaining,0)),5)
from up
left join up up2
	on up.OversLeft = up2.OversLeft + 1
	and up.WicketsLost = up2.WicketsLost
cross join CricketOSA.dbo.Nums
where num <= 6
)

insert into DuckworthLewisResourcesByBall
select
BallsRemaining
, WicketsLost
, ResourcesRemaining = ResourcesRemainingEachBall
from tst 
order by WicketsLost, BallsRemaining Desc


GO


