USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_All_Pinned]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_All_Pinned]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_All_Pinned]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_All_Pinned]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_All_Pinned]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_All_Pinned] AS' 
END
GO

-- =============================================
-- Author:		William Chen
-- Create date: Oct. 20 2015
-- Description:	Distinct all can be pinned resources 
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_All_Pinned]
@lang nvarchar(10) = 'en'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT [ETLLoadID]
      ,[ResourceAgencyNum]
      ,[Map]
      ,m.[SubCategoryID]
	  ,SubCategory = CASE @lang
			  WHEN 'fr' THEN s.SubCategory_fr
			  ELSE s.SubCategory
	  END
      ,M.[TopCategoryID]
	  ,TopCategory = CASE @lang
			  WHEN 'fr' THEN T.[TopCategory_fr]
			  ELSE T.TopCategory
	  END
      ,[PublicName]
      ,[AgencyDescription]
      ,[PhysicalAddress]
      ,[PhysicalCityID]
      ,[PhysicalCity]
      ,[PhysicalProvinceID]
      ,[PhysicalProvince]
      ,[PhysicalCountry]
      ,[PhysicalPostalCode]
      ,[Latitude]
      ,[Longitude]
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
  FROM [RAM].[dbo].[Map] as m JOIN  [dbo].[SubCategory] as s on m.SubCategoryID = s.SubCategoryID 
  JOIN [dbo].[TopCategory] as t on t.TopCategoryID = m.TopCategoryID
WHERE LanguageOfRecord = @lang and s.Active = 1 and t.Active = 1
ORDER BY [ETLLoadID]
END


GO
