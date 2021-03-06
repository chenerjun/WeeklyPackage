USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_TopCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_TopCategory]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_TopCategory]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_TopCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_TopCategory]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_TopCategory] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Get_TopCategory
-- REVERSION: July 22, 2016 added parameter @token, changed logic
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_TopCategory]
 @lang nvarchar(50) ='en',
 @token nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @V INT
	SELECT Top(1) @v = TopcategoryID FROM F_Get_Allow_TopCategory (@token) 
 
	 IF @v=0  -- allows to access all TopCategory 
		begin
			SELECT TopCategoryID , 
					CASE @lang WHEN 'fr' THEN TopCategory_fr ELSE TopCategory END AS TopCategory 
					FROM [dbo].[TopCategory] WHERE Active = 1 
		end
	ELSE 
		begin
				SELECT TopCategoryID , 
				CASE @lang WHEN 'fr' THEN TopCategory_fr ELSE TopCategory END AS TopCategory 
				FROM [dbo].[TopCategory] WHERE Active = 1  
				AND TopCategoryID in (select * FROM F_Get_Allow_TopCategory (@token) )
		end




 
  
END

GO
