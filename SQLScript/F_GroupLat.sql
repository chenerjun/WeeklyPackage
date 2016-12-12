USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GroupLat]    Script Date: 12/8/2015 11:49:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER FUNCTION [dbo].[F_GroupLat] 
(	
@lat numeric (18,10)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
select ROW_NUMBER() over (order by  latitude) as rownumber, Etlloadid, latitude,Longitude  from map where Latitude = @lat
)
