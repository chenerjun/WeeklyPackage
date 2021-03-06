USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Splite_TaxonomyTermS]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Splite_TaxonomyTermS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_Splite_TaxonomyTermS]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Splite_TaxonomyTermS]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_Splite_TaxonomyTermS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		william chen
-- Create date: Nov.5, 2015
-- Description:	splite TaxonomyTermS column into a rows by semicolon
-- =============================================
CREATE FUNCTION [dbo].[F_Splite_TaxonomyTermS] 
(
	-- Add the parameters for the function here
@words  NVARCHAR(500) 
)
RETURNS 
 @T_KEYWORD TABLE 
(
  ID int,
  KEYWORD nvarchar(500)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	
	 --  @s 待分拆的字符串 
DECLARE @s   NVARCHAR(4000);
select @s=[TaxonomyTermS] from [dbo].[KeyWords] where [TaxonomyTermS] = @words;
--- remove last ";" or "space"
  Select @s = SUBSTRING(@s, 0, LEN(@s)+1)
--- "*" convert to ";"
 select @s =  REPLACE(@s,''*'','';'') ;
 --- "-" convert to ";"
 select @s =  REPLACE(@s,''-'','';'') ;
  --- " " space convert to ";"
 -- select @s =  REPLACE(@s,'' '','';'') ;
   --- "/" convert to ";"
 select @s =  REPLACE(@s,''/'','';'') ;
  --数据分隔符
 DECLARE @splitlen int;
 SET @splitlen=LEN('';''+''a'')-2;

 

 
 WHILE CHARINDEX('';'',@s)>0
 BEGIN

	if (not exists (select KEYWORD from @T_KEYWORD where KEYWORD =   LEFT(@s,CHARINDEX('';'',@s)-1) ) AND LEN(@s) >1  )
		INSERT into  @T_KEYWORD  (KEYWORD) VALUES(LEFT(@s,CHARINDEX('';'',@s)-1) )  ;
 
	SET @s=RTRIM(LTRIM(STUFF(@s,1,CHARINDEX('';'',@s)+@splitlen,'''')));
 
 END;

 if ( not exists (select KEYWORD from  @T_KEYWORD where KEYWORD = @s) AND LEN(@s) >1 )
 INSERT into  @T_KEYWORD  (KEYWORD) VALUES( @s);


 
 

	RETURN 
END
' 
END

GO
