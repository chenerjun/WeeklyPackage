USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Get_Allow_TopCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Get_Allow_TopCategory]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_Get_Allow_TopCategory]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Get_Allow_TopCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Get_Allow_TopCategory]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- ==========================================================================================
-- Author:		William Chen
-- Create date: July 21, 2016
-- Description:	According to access token to get the KHP authorised topcategory list
--              if the list is NULL, means did not authorise, 
--              if the topcategoryID = 0; means allow access all of category list.
-- ==========================================================================================
CREATE FUNCTION [dbo].[F_Get_Allow_TopCategory]
(
	-- Add the parameters for the function here
 @token nvarchar(50)
)
RETURNS 
@AllowTopCategoryIDList TABLE 
(
	-- Add the column definitions for the TABLE variable here
TopCategoryID int
)
AS
BEGIN


-----------------------------------------------
--  Process allow accessing TopCategory List
-----------------------------------------------
DECLARE @V INT;
SELECT TOP (1) @V =  p.TopCategoryID  FROM Permission  as p 
				JOIN AccessControlList AS a ON a.ACLID  = p.ACLID 
	WHERE a.ACLToken = @token
	ORDER BY p.TopCategoryID;



IF @V=0
	BEGIN -- allow access all of TopCategories
		INSERT INTO @AllowTopCategoryIDList
			SELECT TopCategoryID FROM [dbo].[TopCategory] WHERE [Active] = 1
	END
ELSE  -- allow access specific TopCategories 
	BEGIN
		INSERT INTO @AllowTopCategoryIDList
		SELECT DISTINCT p.TopCategoryID AS [TopCategoryID] FROM Permission  as p 
				JOIN AccessControlList AS a ON a.ACLID  = p.ACLID 
		WHERE a.ACLToken = @token
		ORDER BY p.TopCategoryID
	END


	-- Fill the table variable with the rows for your result set
	--INSERT INTO @AllowTopCategoryIDList
	--SELECT DISTINCT p.topcategoryid   FROM [dbo].[Permission] as p 
	--			join [dbo].[AccessControlList] as acl  on p.aclid= acl.aclid  
	--	WHERE acl.acltoken = @token
	--	ORDER BY p.topcategoryid
	
	RETURN 
END
' 
END

GO
