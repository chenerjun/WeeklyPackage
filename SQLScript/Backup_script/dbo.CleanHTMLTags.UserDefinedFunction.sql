USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[CleanHTMLTags]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanHTMLTags]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[CleanHTMLTags]
GO
/****** Object:  UserDefinedFunction [dbo].[CleanHTMLTags]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CleanHTMLTags]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[CleanHTMLTags] (@HTMLText VARCHAR(MAX),@ReplaceChar char(1))
RETURNS VARCHAR(MAX)
AS
BEGIN
DECLARE @Start INT
DECLARE @End INT
DECLARE @Length INT
SET @Start = CHARINDEX(''<'',@HTMLText) SET @End = CHARINDEX(''>'',@HTMLText,
    CHARINDEX(''<'',@HTMLText)) SET @Length = (@End - @Start) + 1 
    WHILE @Start > 0 AND @End > 0 AND @Length > 0
BEGIN
IF (UPPER(SUBSTRING(@HTMLText, @Start, 4)) <> '''') AND (UPPER(SUBSTRING(@HTMLText, @Start, 5)) <> '''')
begin
SET @HTMLText = RTRIM(LTRIM(STUFF(@HTMLText,@Start,@Length,@ReplaceChar)));
end
ELSE
SET @Length = 0;
SET @Start = CHARINDEX(''<'',@HTMLText, @End-@Length) 
    SET @End = CHARINDEX(''>'',@HTMLText,CHARINDEX(''<'',@HTMLText, @Start))
SET @Length = (@End - @Start) + 1
END
RETURN isnull(RTRIM(LTRIM(@HTMLText)) ,'''')
END' 
END

GO
