USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_KEYTaxonomyTerm]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_KEYTaxonomyTerm]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_KEYTaxonomyTerm]
GO
/****** Object:  UserDefinedFunction [dbo].[F_KEYTaxonomyTerm]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_KEYTaxonomyTerm]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		william chen
-- Create date: Nov.5, 2015
-- Description:	pivot  TaxonomyTerm column into rows
-- =============================================
CREATE FUNCTION [dbo].[F_KEYTaxonomyTerm] 
(
	-- Add the parameters for the function here
@id  int
)
RETURNS 
 @T_KEYWORD TABLE 
(
  ID int,
  KEYWORD nvarchar(100)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	
	 --  @s 待分拆的字符串 
DECLARE @s   varchar(max);
select @s=[TaxonomyTerm] from  [dbo].[ETLLOAD]   where ETLLOadID = @id;
--- remove last ";" or "space"
  Select @s = SUBSTRING(@s, 0, LEN(@s)+1)
--- "*" convert to ";"
 select @s =  REPLACE(@s,''*'','';'') ;
 --- "-" convert to ";"
 select @s =  REPLACE(@s,''-'','';'') ;
  --- " " space convert to ";"
 select @s =  REPLACE(@s,'' '','';'') ;
   --- "/" convert to ";"
 select @s =  REPLACE(@s,''/'','';'') ;
  --数据分隔符
 DECLARE @splitlen int;
 SET @splitlen=LEN('';''+''a'')-2;

 

 
 WHILE CHARINDEX('';'',@s)>0
 BEGIN

	if (not exists (select KEYWORD from @T_KEYWORD where KEYWORD =   LEFT(@s,CHARINDEX('';'',@s)-1)))
		INSERT into  @T_KEYWORD  (id, KEYWORD) VALUES( @ID, LEFT(@s,CHARINDEX('';'',@s)-1) )  ;
 
	SET @s=RTRIM(LTRIM(STUFF(@s,1,CHARINDEX('';'',@s)+@splitlen,'''')));
 
 END;

 if ( not exists (select KEYWORD from  @T_KEYWORD where KEYWORD = @s) )
 INSERT into  @T_KEYWORD  (ID, KEYWORD) VALUES(@ID, @s);


 
 

	RETURN 
END
' 
END

GO
