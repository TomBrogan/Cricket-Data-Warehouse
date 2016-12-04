USE [CricketDDS]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimDate]    Script Date: 04/12/2016 00:12:40 ******/
DROP PROCEDURE [dbo].[LoadDimDate]
GO

/****** Object:  StoredProcedure [dbo].[LoadDimDate]    Script Date: 04/12/2016 00:12:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[LoadDimDate] as 

/** Create Date Dimension Table **/
/* Create First numbers table for key generation */
CREATE TABLE Numbers_Small (Number INT);

INSERT INTO Numbers_Small
VALUES (0)
	,(1)
	,(2)
	,(3)
	,(4)
	,(5)
	,(6)
	,(7)
	,(8)
	,(9);

GO


