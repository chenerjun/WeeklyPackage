USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Coverage]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Coverage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_Coverage]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Coverage]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Coverage]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[F_Coverage] 
(
	-- Add the parameters for the function here
@id  bigint
)
RETURNS 
 @T_Coverage TABLE 
(
  ID int,
  Coverage varchar(100)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	
	 --待分拆的字符串 
declare @s   varchar(max);
select @s=Coverage from  [dbo].[TaxonomyRAW]   where ETLLOadID = @id;
--- remove last ";" or "space"
  Select @s = SUBSTRING(@s, 0, LEN(@s))
--- select @s=''LH-2700.6500''
 select @s =  REPLACE(@s,''*'','';'') ;
  --数据分隔符
 DECLARE @splitlen int;
 SET @splitlen=LEN('';''+''a'')-2;

 

 
 WHILE CHARINDEX('';'',@s)>0
 BEGIN

	if (not exists (select Coverage from @T_Coverage where Coverage =   LEFT(@s,CHARINDEX('';'',@s)-1)))
		INSERT into  @T_Coverage  (id, Coverage) VALUES( @ID, LEFT(@s,CHARINDEX('';'',@s)-1) )  ;
 
	SET @s=RTRIM(LTRIM(STUFF(@s,1,CHARINDEX('';'',@s)+@splitlen,'''')));
 
 END;

 if ( not exists (select Coverage from  @T_Coverage where Coverage = @s) )
 INSERT into  @T_Coverage  (ID, Coverage) VALUES(@ID, @s);


 
 

	RETURN 
END
' 
END

GO
