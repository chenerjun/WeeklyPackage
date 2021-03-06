USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[z_useless_GetResourceByCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_useless_GetResourceByCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[z_useless_GetResourceByCategory]
GO
/****** Object:  StoredProcedure [dbo].[z_useless_GetResourceByCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[z_useless_GetResourceByCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[z_useless_GetResourceByCategory] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[z_useless_GetResourceByCategory] 
	-- Add the parameters for the stored procedure here
@categories varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
declare @SQLQuery nvarchar(2000);
set @SQLQuery =
N'SELECT  distinct      n.ETLLoadID  , n.Map, n.PublicName, n.AgencyDescription, n.PhysicalAddress, c.CityName, p.Province, n.PhysicalCountry, n.PhysicalPostalCode, n.Latitude, n.Longitude, 
                         n.HoursOfOperation, n.Phone, n.WebsiteAddress, n.Eligibility, n.DisabilitiesAccess, n.FeeStructureSource, n.ApplicationProcess, n.DocumentsRequired, n.LanguagesOfferedList, n.LanguageOfRecord, 
                         n.WorkHours, n.CustomEligibilitybyAge, n.changedDate, n.createdDate
FROM            NewRam AS n LEFT JOIN
                         CityLocation AS c ON n.PhysicalCityID = c.CityId LEFT JOIN
                         Province AS p ON n.PhysicalProvinceID = p.ProvinceID  JOIN
                             (SELECT        etlloadid
                               FROM            ETLLoadIDAndKHPCategoryID
                               WHERE        KHPCategoryID IN ('+   @categories   +N')) AS e ON n.ETLLoadID = e.etlloadid
order by n.ETLLoadID'  ;
 

--execute (@SQLQuery);
EXECUTE sp_executesql @SQLQuery

END

GO
