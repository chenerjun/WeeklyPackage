USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[relatedPS]    Script Date: 12/8/2015 11:53:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[relatedPS] 
(	
	-- Add the parameters for the function here
	@ETLLOADID int,
@ParentAgencyNum varchar(20)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	select   etlloadid  from RAMRAW 
		where ETLLOADID = @ETLLOADID and
			  parentagencynum = @ParentAgencyNum and 
			  RAMRAW.taxonomylevelnameid in (2,4) 
)
