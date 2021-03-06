USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getPWByCityIDCateID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPWByCityIDCateID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getPWByCityIDCateID]
GO
/****** Object:  StoredProcedure [dbo].[getPWByCityIDCateID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getPWByCityIDCateID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getPWByCityIDCateID] AS' 
END
GO
-- =============================================
-- Author:		William
-- Create date: <Create Date,,>
-- Description:	@num =0 ,select top 5 records;  @num <>0 ,select top all records
-- Description: @cid =0 select all cities ;    @cid <> 0 select all exactly city
-- Description: @lang ='en' select English records;   @lang ='fr' select French records;
-- =============================================
ALTER PROCEDURE [dbo].[getPWByCityIDCateID]
	-- Add the parameters for the stored procedure here
	@num int,
	@cid int,
	@cateID int,
	@lang varchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
if (@num =0)
		begin
			if (@cid = 0 )
				begin
					SELECT  top 10
						m.[ETLLoadID],k.KHPCategoryID,[PublicName],[AgencyDescription],[TaxonomyLevelNameID]
						,[PhysicalAddress],c.CityName,p.Province,[PhysicalCountry],UPPER([PhysicalPostalCode]) as PhysicalPostalCode
						,m.[Latitude],m.[Longitude],[HoursOfOperation],[Phone],[WebsiteAddress],[Eligibility],[DisabilitiesAccess],[FeeStructureSource],[ApplicationProcess]
						,[DocumentsRequired],[LanguagesOfferedList],[LanguageOfRecord],[WorkHours],[CustomEligibilitybyAge],m.[createdDate],kc.KHPCategory

					FROM [RAM].[dbo].[PhoneWeb] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
						left join  [dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
						left join  [dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
						left join [dbo].[KHPCategory] kc on k.KHPCategoryID = kc.KHPCategoryID
					WHERE   k.KHPCategoryID=@cateID  AND [LanguageOfRecord] = @lang
					order by m.[ETLLoadID]
				end
			else
				begin
					SELECT  top 10
						m.[ETLLoadID],k.KHPCategoryID,[PublicName],[AgencyDescription],[TaxonomyLevelNameID]
						,[PhysicalAddress],c.CityName,p.Province,[PhysicalCountry],UPPER([PhysicalPostalCode]) as PhysicalPostalCode
						,m.[Latitude],m.[Longitude],[HoursOfOperation],[Phone],[WebsiteAddress],[Eligibility],[DisabilitiesAccess],[FeeStructureSource],[ApplicationProcess]
						,[DocumentsRequired],[LanguagesOfferedList],[LanguageOfRecord],[WorkHours],[CustomEligibilitybyAge],m.[createdDate],kc.KHPCategory

					FROM [RAM].[dbo].[PhoneWeb] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
						left join  [dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
						left join  [dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
						left join [dbo].[KHPCategory] kc on k.KHPCategoryID = kc.KHPCategoryID
					WHERE   m.PhysicalCityID = @cid  AND k.KHPCategoryID=@cateID  AND [LanguageOfRecord] = @lang
					order by m.[ETLLoadID]
				end
		end
	else
		begin
			if (@cid = 0 )
				begin
					SELECT   
						m.[ETLLoadID],k.KHPCategoryID,[PublicName],[AgencyDescription],[TaxonomyLevelNameID]
						,[PhysicalAddress],c.CityName,p.Province,[PhysicalCountry],UPPER([PhysicalPostalCode]) as PhysicalPostalCode
						,m.[Latitude],m.[Longitude],[HoursOfOperation],[Phone],[WebsiteAddress],[Eligibility],[DisabilitiesAccess],[FeeStructureSource],[ApplicationProcess]
						,[DocumentsRequired],[LanguagesOfferedList],[LanguageOfRecord],[WorkHours],[CustomEligibilitybyAge],m.[createdDate],kc.KHPCategory

					FROM [RAM].[dbo].[PhoneWeb] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
						left join  [dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
						left join  [dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
						left join [dbo].[KHPCategory] kc on k.KHPCategoryID = kc.KHPCategoryID
					WHERE   k.KHPCategoryID=@cateID  AND [LanguageOfRecord] = @lang
					order by m.[ETLLoadID]
				end
			else
				begin
					SELECT   
						m.[ETLLoadID],k.KHPCategoryID,[PublicName],[AgencyDescription],[TaxonomyLevelNameID]
						,[PhysicalAddress],c.CityName,p.Province,[PhysicalCountry],UPPER([PhysicalPostalCode]) as PhysicalPostalCode
						,m.[Latitude],m.[Longitude],[HoursOfOperation],[Phone],[WebsiteAddress],[Eligibility],[DisabilitiesAccess],[FeeStructureSource],[ApplicationProcess]
						,[DocumentsRequired],[LanguagesOfferedList],[LanguageOfRecord],[WorkHours],[CustomEligibilitybyAge],m.[createdDate],kc.KHPCategory

					FROM [RAM].[dbo].[PhoneWeb] as m left join [RAM].[dbo].[CityLocation] as c on m.PhysicalCityID = c.CityId
						left join  [dbo].[Province] as p on m.PhysicalProvinceID = p.ProvinceID
						left join  [dbo].[ETLLoadIDAndKHPCategoryID] k on m.ETLLoadID = k.etlloadid  
						left join [dbo].[KHPCategory] kc on k.KHPCategoryID = kc.KHPCategoryID
					WHERE   m.PhysicalCityID = @cid  AND k.KHPCategoryID=@cateID  AND [LanguageOfRecord] = @lang
					order by m.[ETLLoadID]
				end
		end

END

GO
