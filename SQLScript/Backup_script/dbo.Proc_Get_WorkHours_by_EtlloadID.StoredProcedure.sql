USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_WorkHours_by_EtlloadID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_WorkHours_by_EtlloadID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Proc_Get_WorkHours_by_EtlloadID]
GO
/****** Object:  StoredProcedure [dbo].[Proc_Get_WorkHours_by_EtlloadID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proc_Get_WorkHours_by_EtlloadID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Proc_Get_WorkHours_by_EtlloadID] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Proc_Get_WorkHours_by_EtlloadID]
	-- Add the parameters for the stored procedure here
@ETLLOADID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT
       [ETLLoadID]
      ,[WorkHour]
  FROM [RAM].[dbo].[WorkHour] WHERE [ETLLoadID] = @ETLLOADID
END

GO
