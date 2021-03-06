USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: Nov.17, 2016
-- Description:	Modifying table [dbo].[TopCategoryID_SubCategoryID]
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Insert_Update_Table_TopCategoryID_SubCategoryID]
	-- Add the parameters for the stored procedure here
@Tid int,
@SID INT,
@active bit = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
IF EXISTS ( SELECT [TopCategoryID_SubCategoryID] FROM [RAM].[dbo].[TopCategoryID_SubCategoryID]  
WHERE [TopCategoryID] = @Tid  AND [SubCategoryID] = @SID)
	BEGIN
		UPDATE [RAM].[dbo].[TopCategoryID_SubCategoryID] SET
			[Active] = @active,
			[ChangedDate] = GETDATE()
		WHERE [TopCategoryID] = @TID  AND [SubCategoryID] = @SID
	END
ELSE
	BEGIN
		INSERT INTO  [RAM].[dbo].[TopCategoryID_SubCategoryID]
		([TopCategoryID],[SubCategoryID],[Active],[ChangedDate])
		VALUES
		(@Tid,  @Sid ,  @active  , getdate())
	END

END

GO
