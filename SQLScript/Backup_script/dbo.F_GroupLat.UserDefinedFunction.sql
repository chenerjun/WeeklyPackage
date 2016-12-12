USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GroupLat]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_GroupLat]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_GroupLat]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GroupLat]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_GroupLat]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create FUNCTION [dbo].[F_GroupLat] 
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
' 
END

GO
