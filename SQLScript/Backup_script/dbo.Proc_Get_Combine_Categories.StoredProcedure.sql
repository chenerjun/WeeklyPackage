USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_Combine_Categories]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_Combine_Categories]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_Combine_Categories]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_Combine_Categories]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_Combine_Categories]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_Combine_Categories] AS' 
END
GO
-- =============================================
-- Author:		William Chen
-- Create date: Nov.28, 2015
-- Description:	Get Combine Categories
-- revision: Feb.20, 2016
-- cancel all tempary table, add [CombinID] in select clause  
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_Combine_Categories]
@lang NVARCHAR(20) = N'en'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
--	SELECT [CategoryID]
--		, CASE @LANG WHEN 'FR' THEN [Category_fr] ELSE [Category] END AS Category
--	INTO #Tmp
--	FROM [dbo].[Combine_Categories];


--	--Using PARSENAME 
 
--	 SELECT [CategoryID], 
--		   PARSENAME(REPLACE([CategoryID],'-','.'),2) T, 
--		   PARSENAME(REPLACE([CategoryID],'-','.'),1) S ,
--		   Category
--	into #Tmp1
--	FROM #Tmp



--select 
--[CategoryID], T, S,
--category
--from #tmp1




SELECT [CombinID], [CategoryID], [TID], [SID], category
from 
(
	 SELECT [CombinID], [CategoryID], 
		   PARSENAME(REPLACE([CategoryID],'-','.'),2) [TID], 
		   PARSENAME(REPLACE([CategoryID],'-','.'),1) [SID],
		   Category
	  FROM (SELECT [CombinID], [CategoryID] , CASE @LANG WHEN 'FR' THEN [Category_fr] ELSE [Category] END AS Category FROM [dbo].[Combine_Categories]) AS T1 
) AS T2



END

GO
