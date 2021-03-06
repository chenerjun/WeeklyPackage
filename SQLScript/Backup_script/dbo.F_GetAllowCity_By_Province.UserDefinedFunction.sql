USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetAllowCity_By_Province]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_GetAllowCity_By_Province]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_GetAllowCity_By_Province]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetAllowCity_By_Province]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_GetAllowCity_By_Province]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =======================================================================================
-- Author:		William Chen
-- Create date: Augest 2, 2016
-- Description:	Based on provinceID, find out allow access city list from Table Permission or CityLocation
-- if cityid = -1 in the table permission, means it allow access any city in this province, then get city list from table citylocation
-- otherwise, get specific cities from table permission 
-- =======================================================================================
CREATE FUNCTION [dbo].[F_GetAllowCity_By_Province] 
(
	-- Add the parameters for the function here
@ProvinceID int,
@token NVARCHAR(50)
)
RETURNS 
@allowcitylistByPid TABLE 
(
pid int,
cid int
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	 DECLARE @ACLID INT 
	 SELECT @ACLID = ACLID FROM AccessControlList WHERE ACLToken  = @TOKEN
	 DECLARE @C TABLE ( c INT) ;
	 INSERT INTO @C 
		SELECT  CityID FROM [dbo].[Permission] WHERE (ProvinceID = @ProvinceID)   AND  (ACLID = @aclid)     ORDER BY CityID ;

		DECLARE @vv int
		SELECT TOP(1) @VV = c FROM @C;

		IF  @VV = -1   --- ALLOW ACCESS ANY CITY IN THIS PROVINCE
			BEGIN
				INSERT INTO @allowcitylistByPid
				SELECT [ProvinceID], [CityId]  FROM [dbo].[CityLocation] WHERE  [ProvinceID] = @ProvinceID ORDER BY  PROVINCEID,CITYID
				RETURN
			END
		ELSE
			BEGIN
				INSERT INTO @allowcitylistByPid
				SELECT [ProvinceID], [CityId]  FROM  [dbo].[Permission]  WHERE ProvinceID = @ProvinceID    AND   (@ACLID = ACLID)   ORDER BY ProvinceID , CityID 
				RETURN
			END


	RETURN 
END
' 
END

GO
