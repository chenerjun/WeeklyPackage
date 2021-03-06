USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getMapByCategories]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getMapByCategories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getMapByCategories]
GO
/****** Object:  StoredProcedure [dbo].[getMapByCategories]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getMapByCategories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getMapByCategories] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getMapByCategories] 
	-- Add the parameters for the stored procedure here
@c1 varchar(5) = '0',
@c2 varchar(5) = '0',
@c3 varchar(5) = '0',
@c4 varchar(5) = '0',
@c5 varchar(5) = '0',
@c6 varchar(5) = '0',
@c7 varchar(5) = '0',
@c8 varchar(5) = '0',
@c9 varchar(5) = '0' 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
 SELECT DISTINCT
		m.[ETLLoadID]
	  ,k.KHPCategoryID
      ,[PublicName]
      ,[AgencyDescription]
      ,[TaxonomyLevelNameID]
      ,[PhysicalAddress]
      ,c.CityName
      ,p.Province
      ,[PhysicalCountry]
      ,UPPER([PhysicalPostalCode]) as PhysicalPostalCode
      ,m.[Latitude]
      ,m.[Longitude]
      ,[HoursOfOperation]
      ,[Phone]
      ,[WebsiteAddress]
      ,[Eligibility]
      ,[DisabilitiesAccess]
      ,[FeeStructureSource]
      ,[ApplicationProcess]
      ,[DocumentsRequired]
      ,[LanguagesOfferedList]
      ,[LanguageOfRecord]
      ,[WorkHours]
      ,[CustomEligibilitybyAge]
 
  FROM [RAM].[dbo].[Map] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
  left join [RAM].[dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
  left join [RAM].[dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
  where  ( k.KHPCategoryID = convert(int,@c1) or
  k.KHPCategoryID = convert(int,@c2) or
  k.KHPCategoryID = convert(int,@c3) or
  k.KHPCategoryID = convert(int,@c4) or
  k.KHPCategoryID = convert(int,@c5) or
  k.KHPCategoryID = convert(int,@c6) or
  k.KHPCategoryID = convert(int,@c7) or
  k.KHPCategoryID = convert(int,@c8) or 
  k.KHPCategoryID = convert(int,@c9))
  order by m.[ETLLoadID]
END

GO
