USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcDistanceKM]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCalcDistanceKM]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[fnCalcDistanceKM]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcDistanceKM]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fnCalcDistanceKM]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[fnCalcDistanceKM](
@lat1 NUMERIC(18,10), 
@lon1 NUMERIC(18,10),
@lat2 NUMERIC(18,10),  
@lon2 NUMERIC(18,10))
RETURNS NUMERIC(18,10) 
AS
BEGIN

    RETURN ACOS(SIN(PI()*@lat1/180.0)*SIN(PI()*@lat2/180.0)+COS(PI()*@lat1/180.0)*COS(PI()*@lat2/180.0)*COS(PI()*@lon2/180.0-PI()*@lon1/180.0))*6371
END' 
END

GO
