USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Get_Allow_Province]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Get_Allow_Province]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_Get_Allow_Province]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Get_Allow_Province]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Get_Allow_Province]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		William Chen
-- Create date: July 21, 2016
-- Description:	According to access token to get the KHP authorised Province list
--              if the list is NULL, means did not authorise, 
--              if the ProvinceID = 0; means allow access all of Province.
-- =============================================
CREATE FUNCTION [dbo].[F_Get_Allow_Province]
(
	-- Add the parameters for the function here
 @token nvarchar(50)
)
RETURNS 
@AllowProvinceIDList TABLE 
(
	-- Add the column definitions for the TABLE variable here
ProvinceID int
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	INSERT INTO @AllowProvinceIDList
	SELECT DISTINCT p.ProvinceID   FROM [dbo].[Permission] as p 
				join [dbo].[AccessControlList] as acl  on p.aclid= acl.aclid  
		WHERE acl.acltoken = @token
		ORDER BY p.ProvinceID
	
	RETURN 
END
' 
END

GO
