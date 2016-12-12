USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[relatedPS]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[relatedPS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[relatedPS]
GO
/****** Object:  UserDefinedFunction [dbo].[relatedPS]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[relatedPS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[relatedPS] 
(	
	-- Add the parameters for the function here
	@ETLLOADID int,
@ParentAgencyNum varchar(20)
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	select   etlloadid  from RAMRAW 
		where ETLLOADID = @ETLLOADID and
			  parentagencynum = @ParentAgencyNum and 
			  RAMRAW.taxonomylevelnameid in (2,4) 
)
' 
END

GO
