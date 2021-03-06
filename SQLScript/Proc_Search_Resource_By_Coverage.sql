USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Search_Resource_By_Coverage]    Script Date: 8/29/2016 12:26:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================================================================================================
-- Author:		William Chen
-- Create date: Aug.29, 2016
-- Description:	Accounting to access to token, get resource by its coverage, and filter by language.  
-- =======================================================================================================================================
ALTER PROCEDURE [dbo].[Proc_Search_Resource_By_Coverage] 
 @s nvarchar (255)  ,
 @lang nvarchar(50)  ,
 @token nvarchar(50)  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



	Set @s = LTRIM(RTRIM(@s))  ;




SELECT			DISTINCT
				a.etlloadid
				, a. coverage 
				, a.ResourceAgencyNum
				, Map
				, A.[SubCategoryID]
				, CASE @lang WHEN 'EN' THEN SC.SubCategory ELSE SC.SubCategory_fr END AS [SubCategory]
				, A.[TOPCategoryID]
				, CASE @lang WHEN 'EN' THEN TC.TopCategory ELSE TC.TopCategory_fr END AS [TopCategory]
				, A.[PublicName] AS [Name]
				, A.[PhysicalAddress]
				, A.PhysicalAddressIsPrivate 
				, CASE C.CityName  	WHEN 'TBD' THEN '' ELSE C.CityName END AS [City]
				, CASE P.[Province]   WHEN 'OTHS' THEN '' WHEN 'Others' THEN '' ELSE P.[Province] END AS [Province]
				, REPLACE(ETL.TaxonomyTerm,'/',' ')  AS STerm
				, a.Latitude
				, a.Longitude
				, a.Phone
				, a.WebsiteAddress
FROM ramresource as a  
					-- Return only those resources whose TopCategoryID is in the allowing TopCategory list
					JOIN		F_Get_Allow_TopCategory (@token) AS ATC ON ATC.TopCategoryID = A.TOPCategoryID 
					-- Return only those resources whose PhysicalCityID is in the allowing City list
					JOIN		F_Get_ALL_Allow_City  (@token)  AS ACID ON ACID.CityID = A.PhysicalCityID 
		 
					JOIN [dbo].[SubCategory] AS SC	ON SC.[SubCategoryID] = A.SubCategoryID
					JOIN [dbo].[TopCategory] AS TC	ON TC.TopCategoryID = A.TOPCategoryID
					INNER JOIN  CityLocation AS c   ON a.PhysicalCityID = c.CityId 
					INNER JOIN  Province     AS p   ON a.PhysicalProvinceID = p.ProvinceID 
					INNER JOIN  ETLLoad      AS ETL ON a.ETLLoadID = ETL.ETLLoadID 
					CROSS APPLY 	( 
										select 　   f.id,  f.KEYWORD   from   F_Splite_Coverage_into_word   (a.etlloadid )  as f  
									)  AS K	
WHERE   a.LanguageOfRecord = @lang     
		AND		SC.Active = 1   
		AND		TC.Active = 1   
		AND		K.KEYWORD  like   ''   + @s  +   '%'  +  ''  
ORDER BY  a.TOPCategoryID,  a.SubCategoryID, a.Map



END
