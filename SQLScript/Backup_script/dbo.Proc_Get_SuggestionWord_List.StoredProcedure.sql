USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_SuggestionWord_List]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_SuggestionWord_List]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_SuggestionWord_List]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_SuggestionWord_List]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_SuggestionWord_List]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_SuggestionWord_List] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_SuggestionWord_List] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT [SuggestionWordID]
      ,[SuggestionWord]

  FROM [RAM].[dbo].[SuggestionWord]
END

GO
