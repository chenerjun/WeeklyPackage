USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getAllMapEN]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllMapEN]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getAllMapEN]
GO
/****** Object:  StoredProcedure [dbo].[getAllMapEN]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getAllMapEN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getAllMapEN] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: <Create Date,,>
-- version trace: 2015-06-18
-- Description:	get all English resource, including one who belongs to multiple class etc.
-- =============================================
ALTER PROCEDURE [dbo].[getAllMapEN] 
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
	  ,kc.KHPCategory
  FROM [RAM].[dbo].[Map] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
  left join  [dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
  left join  [dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
  left join [dbo].[KHPCategory] kc on k.KHPCategoryID = kc.KHPCategoryID
  WHERE [LanguageOfRecord] != 'fr'
  order by m.[ETLLoadID]
END

GO
