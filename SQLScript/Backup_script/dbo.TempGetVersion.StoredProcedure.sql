USE [RAM]
GO
/****** Object:  StoredProcedure [dbo].[TempGetVersion]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TempGetVersion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[TempGetVersion]
GO
/****** Object:  StoredProcedure [dbo].[TempGetVersion]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TempGetVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[TempGetVersion] AS' 
END
GO

/*****************************************************************************/

ALTER PROCEDURE [dbo].[TempGetVersion]
    @ver      char(10) OUTPUT
AS
    SELECT @ver = "2"
    RETURN 0
GO
