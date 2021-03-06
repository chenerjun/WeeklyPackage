USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_SubCategory_by_SId]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_SubCategory_by_SId]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_SubCategory_by_SId]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_SubCategory_by_SId]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_SubCategory_by_SId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_SubCategory_by_SId] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: <Create Date,,>
-- Description:	Get SubCategory by SID
-- Reversion: July 22, 2016
-- Add Paremeter @token
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_SubCategory_by_SId]
 @SID INT,
 @lang NVARCHAR (50) ='en',
 @token NVARCHAR (50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @v int
	SELECT TOP(1) @v = TopcategoryID FROM F_Get_Allow_TopCategory (@token) 
 
	IF @v = 0 -- Allow access all topcategory
			BEGIN
				SELECT S.SubCategoryID , 
				CASE @LANG WHEN 'fr' THEN S.SubCategory_fr  ELSE S.SubCategory END AS SubCategory ,
				CASE @LANG WHEN 'fr' THEN S.[SubCategoryDesc_fr] ELSE  S.[SubCategoryDesc] END AS [SubCategoryDesc] 
				FROM [dbo].[SubCategory] AS S WHERE S.SubCategoryID = @SID and S.Active = 1  
			END
		ELSE
			BEGIN
				SELECT S.SubCategoryID , 
				CASE @LANG WHEN 'fr' THEN S.SubCategory_fr  ELSE S.SubCategory END AS SubCategory ,
				CASE @LANG WHEN 'fr' THEN S.[SubCategoryDesc_fr] ELSE  S.[SubCategoryDesc] END AS [SubCategoryDesc] 
				FROM [dbo].[SubCategory] AS S JOIN [TopCategoryID_SubCategoryID] as ts on s.SubCategoryID = ts.SubCategoryID
				WHERE S.SubCategoryID = @SID 
				AND TS.TopCategoryID IN (SELECT * FROM F_Get_Allow_TopCategory (@token) )
				AND S.Active = 1 
			END

END

GO
