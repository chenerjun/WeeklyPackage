USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_SubCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_SubCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_SubCategory]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_SubCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_SubCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_SubCategory] AS' 
END
GO
-- =============================================
-- Author:		William Chen 
-- Create date: July 22, 2016
-- Description:	Get_all subcategory
-- Reversion: July 22, 2016
--            add paremeter @token, filte by access control list
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_SubCategory]
 @lang NVARCHAR(50) ='en',
 @token NVARCHAR(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @v int;
	SELECT TOP(1) @v = TopcategoryID FROM F_Get_Allow_TopCategory (@token);

	IF @v = 0  -- Allow access all topcategory
		BEGIN 
			SELECT s.SubCategoryID , 
			CASE @LANG WHEN 'fr' THEN s.SubCategory_fr  ELSE s.SubCategory END AS SubCategory ,
			CASE @LANG WHEN 'fr' THEN s.[SubCategoryDesc_fr] ELSE  s.[SubCategoryDesc] END AS [SubCategoryDesc] 
			FROM [dbo].[SubCategory] as s WHERE s.Active = 1  
			ORDER BY s.SubCategoryID
		END
	ELSE    -- BASE ON allowing topcategory , list out subcategory 
		BEGIN
			SELECT s.SubCategoryID , 
			CASE @LANG WHEN 'fr' THEN s.SubCategory_fr  ELSE s.SubCategory END AS SubCategory ,
			CASE @LANG WHEN 'fr' THEN s.[SubCategoryDesc_fr] ELSE  s.[SubCategoryDesc] END AS [SubCategoryDesc] 
			FROM [dbo].[SubCategory] as s JOIN [TopCategoryID_SubCategoryID] as ts on s.SubCategoryID = ts.SubCategoryID
			WHERE s.Active = 1  AND TS.TopCategoryID IN (SELECT * FROM F_Get_Allow_TopCategory (@token) )
			ORDER BY s.SubCategoryID
		END

END

GO
