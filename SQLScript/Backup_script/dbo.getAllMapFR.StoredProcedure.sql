USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getAllMapFR]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllMapFR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllMapFR]
GO
/****** Object:  StoredProcedure [dbo].[getAllMapFR]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllMapFR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getAllMapFR] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: <Create Date,,>
-- version trace: 2015-06-18
-- Description:	get all French resource, including one who belongs to multiple class etc.
-- =============================================
ALTER PROCEDURE [dbo].[getAllMapFR] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT m.[ETLLoadID]
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
		,m.[createdDate]
		,kc.KHPCategoryFr
  FROM [RAM].[dbo].[Map] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
  left join  [dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
  left join  [dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
  left join [dbo].[KHPCategory] kc on k.KHPCategoryID = kc.KHPCategoryID
  WHERE [LanguageOfRecord] = 'fr'
  order by m.[ETLLoadID]
END

GO
