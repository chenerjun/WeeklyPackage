USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Search_Resources_In_Radius]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Search_Resources_In_Radius]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Search_Resources_In_Radius]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Search_Resources_In_Radius]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Search_Resources_In_Radius]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Search_Resources_In_Radius] AS' 
END
GO
-- ==========================================================================================
-- Author:		William Chen
-- Create date: Feb.22, 2016
-- Description:	Find out resources located in Radius  and Start Lat/Long, look up Radius in KM
-- Reversion: Aug.11, 2016
--		Add parameter @token, it will get allowing access-TopCategory and access-city list , 
--		then return those resources in the radius and in the allowing Topcategory and allowing city list 
-- ==========================================================================================
ALTER PROCEDURE [dbo].[Proc_Search_Resources_In_Radius] 
@StartLatitude NUMERIC(18,10) = 43.654490,
@StartLongitude NUMERIC(18,10) = -79.387419,
@Radius NUMERIC(18,10) = 5.00 ,
@lang NVARCHAR(50) = N'en',
@token NVARCHAR(50) -- ='1CD59756-D237-4792-A1A4-65B32740C7AF'     --CAMH
-- declare @token NVARCHAR(50) ='9BB1408A-81DD-43D1-B621-83E2F71D2669'   --KHP
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 

 

----------------------------------------------------
--  search resources within  
----------------------------------------------------
SELECT distinct
				a.ETLLoadID
				, a.ResourceAgencyNum
				, Map
				, a.SubCategoryID
				, CASE @lang WHEN 'EN' THEN SC.SubCategory ELSE SC.SubCategory_fr END AS [SubCategory]
				, A.[TOPCategoryID]
				, CASE @lang WHEN 'EN' THEN TC.TopCategory ELSE TC.TopCategory_fr END AS [TopCategory]
				, A.[PublicName] AS [Name]
				, A.[PhysicalAddress]
				, A.[PhysicalAddressIsPrivate]
				, CASE C.CityName  	WHEN 'TBD' THEN '' ELSE C.CityName END AS [City]
				, CASE P.[Province]   WHEN 'OTHS' THEN '' WHEN 'Others' THEN '' ELSE P.[Province] END AS [Province]
				, REPLACE(ETL.TaxonomyTerm,'/',' ')  AS STerm
				, a.Latitude
				, a.Longitude
				, a.Phone
				, a.WebsiteAddress
FROM            RamResource AS a 
                    INNER JOIN    CityLocation AS c ON a.PhysicalCityID = c.CityId 
                    INNER JOIN     Province AS p ON a.PhysicalProvinceID = p.ProvinceID 
                    INNER JOIN     ETLLoad AS ETL ON a.ETLLoadID = ETL.ETLLoadID 
                    INNER JOIN     SubCategory AS SC ON SC.SubCategoryID = a.SubCategoryID 
                    INNER JOIN     TopCategory AS TC ON TC.TopCategoryID = a.TOPCategoryID 
					-- Return only those resources whose TopCategoryID is in the allowing TopCategory list
					INNER JOIN		F_Get_Allow_TopCategory (@token) AS ATC ON ATC.TopCategoryID = A.TOPCategoryID 
					-- Return only those resources whose PhysicalCityID is in the allowing City list
					INNER JOIN		F_Get_ALL_Allow_City  (@token)  AS ACID ON ACID.CityID = A.PhysicalCityID 

WHERE			[dbo].[fnCalcDistanceKM](@StartLatitude, @StartLongitude, a.Latitude, a.Longitude) < @Radius AND a.PhysicalCityID != 0   AND SC.Active = 1 AND TC.Active = 1 
ORDER BY         a.TOPCategoryID,  a.SubCategoryID, a.Map
			--a.PhysicalProvinceID, a.PhysicalCityID,
END

GO
