USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Increment_Loaction_Search]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Increment_Loaction_Search]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Increment_Loaction_Search]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Increment_Loaction_Search]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Increment_Loaction_Search]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Increment_Loaction_Search] AS' 
END
GO
-- ===============================================================================
-- Author:		WILLIAM CHEN
-- Create date: Nov. 26, 2015
-- Description:	Loaction Increment search for auto-complete
-- Revision: on Feb.5, 2016
-- changed search table from [dbo].[CityLocation] to [dbo].[SuggestionWord]    --- Will do 
-- ===============================================================================
ALTER PROCEDURE [dbo].[Proc_Increment_Loaction_Search]
	-- Add the parameters for the stored procedure here
@L nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT TOP (30) c.cityid, c.ProvinceID, c.[CityName]+ ', '+ p.ProvinceAlias AS Location  
FROM [dbo].[CityLocation] AS c join province AS p ON c.ProvinceID = p.ProvinceID
WHERE p.ProvinceID < 15 and c.[CityName] like ''+ @L+'%'
ORDER BY c.[CityName], p.ProvinceAlias


END

GO
