USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_Splite_TaxonomyTerm]    Script Date: 12/8/2015 11:51:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		william chen
-- Create date: Nov.5, 2015
-- Description:	splite TaxonomyTerm column into a rows by semicolon
-- =============================================
CREATE FUNCTION [dbo].[F_Splite_TaxonomyTerm] 
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
select @s=[TaxonomyTerm] from [dbo].[KeyWords] where [TaxonomyTerm] = @words;
--- remove last ";" or "space"
  Select @s = SUBSTRING(@s, 0, LEN(@s)+1)
--- "*" convert to ";"
 select @s =  REPLACE(@s,'*',';') ;
 --- "-" convert to ";"
 select @s =  REPLACE(@s,'-',';') ;
  --- " " space convert to ";"
 -- select @s =  REPLACE(@s,' ',';') ;
   --- "/" convert to ";"
 select @s =  REPLACE(@s,'/',';') ;
  --数据分隔符
 DECLARE @splitlen int;
 SET @splitlen=LEN(';'+'a')-2;

 

 
 WHILE CHARINDEX(';',@s)>0
 BEGIN

	if (not exists (select KEYWORD from @T_KEYWORD where KEYWORD =   LEFT(@s,CHARINDEX(';',@s)-1) ) AND LEN(@s) >1  )
		INSERT into  @T_KEYWORD  (KEYWORD) VALUES(LEFT(@s,CHARINDEX(';',@s)-1) )  ;
 
	SET @s=RTRIM(LTRIM(STUFF(@s,1,CHARINDEX(';',@s)+@splitlen,'')));
 
 END;

 if ( not exists (select KEYWORD from  @T_KEYWORD where KEYWORD = @s) AND LEN(@s) >1 )
 INSERT into  @T_KEYWORD  (KEYWORD) VALUES( @s);


 
 

	RETURN 
END
