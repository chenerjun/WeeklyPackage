USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[getCategoriesFR]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getCategoriesFR]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[getCategoriesFR]
GO
/****** Object:  StoredProcedure [dbo].[getCategoriesFR]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getCategoriesFR]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[getCategoriesFR] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[getCategoriesFR] 
	-- Add the parameters for the stored procedure here
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        KHPCategoryID, KHPCategoryFr, ImageSrc
FROM            KHPCategory
WHERE        (KHPCategoryID < 100)
END

GO
