USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[F_taxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_taxonomyCode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[F_taxonomyCode]
GO
/****** Object:  UserDefinedFunction [dbo].[F_taxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_taxonomyCode]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	pivot taxonomyCode 
-- =============================================
CREATE FUNCTION [dbo].[F_taxonomyCode] 
(
	-- Add the parameters for the function here
@id  bigint
)
RETURNS 
 @T_TaxonomyCode TABLE 
(
  ID int,
  TaxonomyCode varchar(100)
)
AS
BEGIN
	-- Fill the table variable with the rows for your result set
	
	 --待分拆的字符串 
declare @s   varchar(max);
select @s= [TaxonomyCodes] from  [dbo].[ProgramRAW]  where ETLLOadID = @id;
--- select @s=''LH-2700.6500''
 select @s =  REPLACE(@s,''*'','';'') ;
  --数据分隔符
 DECLARE @splitlen int;
 SET @splitlen=LEN('';''+''a'')-2;

 

 
 WHILE CHARINDEX('';'',@s)>0
 BEGIN

	if (not exists (select [TaxonomyCode] from @T_TaxonomyCode where [TaxonomyCode] =   LEFT(@s,CHARINDEX('';'',@s)-1)))
		INSERT into  @T_TaxonomyCode  (id,[TaxonomyCode] ) VALUES( @ID, LEFT(@s,CHARINDEX('';'',@s)-1) )  ;
 
	SET @s=RTRIM(LTRIM(STUFF(@s,1,CHARINDEX('';'',@s)+@splitlen,'''')));
 
 END;

 if ( not exists (select [TaxonomyCode] from @T_TaxonomyCode where [TaxonomyCode] = @s) )
 INSERT into @T_TaxonomyCode  (ID,[TaxonomyCode]) VALUES(@ID,@s);


 
--MERGE [ETLLoadidAndTaxonomyID] AS T
--USING (select @id,  k.KHPTaxonomyID   from @T_TaxonomyCode  as t join [dbo].[KHPTaxonomy] as k on k.KHPTaxonomyCode = t.TaxonomyCode
--				where k.KHPCategoryID is not null) AS S (id,[KHPTaxonomyID] )
--ON (T. ETLLOADID=@id AND T.KHPTaxonomyid =  S.KHPTaxonomyID )
--WHEN NOT MATCHED BY TARGET
--    THEN INSERT([etlloadid],[KHPTaxonomyID]) VALUES(S.id, S.KHPTaxonomyID);

	RETURN 
END
' 
END

GO
