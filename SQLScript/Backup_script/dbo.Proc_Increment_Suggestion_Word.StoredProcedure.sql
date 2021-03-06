USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Increment_Suggestion_Word]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Increment_Suggestion_Word]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Increment_Suggestion_Word]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Increment_Suggestion_Word]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Increment_Suggestion_Word]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Increment_Suggestion_Word] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: Feb. 18, 2016
-- Description:	Increment get suggestion word
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Increment_Suggestion_Word]
	-- Add the parameters for the stored procedure here
 @L NVARCHAR (255)
AS
BEGIN
　
	SET NOCOUNT ON;

SELECT TOP(10)  [SuggestionWordID], [SuggestionWord]   
	FROM  [dbo].[SuggestionWord]    
	WHERE [SuggestionWord] LIKE ''+ @L+'%'


END
　

GO
