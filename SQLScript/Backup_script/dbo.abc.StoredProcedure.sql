USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[abc]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[abc]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[abc]
GO
/****** Object:  StoredProcedure [dbo].[abc]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[abc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[abc] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: Oct.27, 2015
-- Description:	demo 
-- =============================================
ALTER PROCEDURE [dbo].[abc] 
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 --- all RESOURCE ARROUND ME resource 
exec [dbo].[Proc_Get_All_RamResource]  

-- Bilingual research RESOURCE ARROUND ME  
exec [dbo].[Proc_Get_All_RamResource_by_Lang]
exec [dbo].[Proc_Get_All_RamResource_by_Lang]  @lang ='fr'

 --- all map resource 
exec [dbo].[Proc_Get_All_Pinned] 
exec [dbo].[Proc_Get_All_Pinned] @lang = 'fr'
 
 

-- search by top category 
exec [dbo].[Proc_Get_Resource_by_TopCategory]  @Topcategoryid  = 4   --  Health
exec [dbo].[Proc_Get_Resource_by_TopCategory] @Topcategoryid  = 3,   @lang = 'fr'  --Housing, Jobs & Legal Help


-- search by sub-category 
exec [dbo].[Proc_Get_Resource_by_SubCategory]   @SubCategoryID = 10     --  Medical Information  
exec [dbo].[Proc_Get_Resource_by_SubCategory]   @SubCategoryID = 8   ,  @lang ='fr'     -- LGBTQ Helplines 

 
 
 -- search by Top-category and sub-category 
exec [dbo].[Proc_Get_Resource_by_Top_and_SubCategory]  @Topcategoryid  = 4   ,  @SubCategoryID = 10    --  Health -->  Medical Information
exec [dbo].[Proc_Get_Resource_by_Top_and_SubCategory]  @Topcategoryid  = 5   ,  @SubCategoryID = 7  , @lang = 'fr'    -- LGBTQ  -->  LGBTQ Community Centres 

 

  -- search by  City 
exec [dbo].[Proc_Get_Resource_by_City] @CityID = 11135   --- Toronto
exec [dbo].[Proc_Get_Resource_by_City] @CityID = 11135  ,  @lang = 'fr'


  -- search by Province 
exec [dbo].[Proc_Get_Resource_by_Province]  @ProvinceID = 9    ---  Ontario
exec [dbo].[Proc_Get_Resource_by_Province]  @ProvinceID = 11 , @lang = 'fr'  ---  Québec

  -- search by city and  Province 
exec [dbo].[Proc_Get_Resource_by_Province_and_City] @CityID = 11135 ,  @ProvinceID = 9    -- Toronto, On
exec [dbo].[Proc_Get_Resource_by_Province_and_City] @CityID = 6366 ,  @ProvinceID = 11   --- Montréal, QC



----  location Increment search
exec [dbo].[Proc_Increment_Loaction_Search] @l='t'
exec [dbo].[Proc_Increment_Loaction_Search] @l='to'
exec [dbo].[Proc_Increment_Loaction_Search] @l='tor'
exec [dbo].[Proc_Increment_Loaction_Search] @l='toro'
exec [dbo].[Proc_Increment_Loaction_Search] @l='toron'

 





END

GO
