USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[InitCap]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InitCap]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[InitCap]
GO
/****** Object:  UserDefinedFunction [dbo].[InitCap]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InitCap]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[InitCap] ( @InputString NVARCHAR(4000) ) 
RETURNS NVARCHAR(4000)
AS
BEGIN

DECLARE @Index          INT
DECLARE @Char           NCHAR(1)
DECLARE @PrevChar       NCHAR(1)
DECLARE @OutputString   NVARCHAR(255)

SET @OutputString = LOWER(@InputString)
SET @Index = 1

WHILE @Index <= LEN(@InputString)
BEGIN
    SET @Char     = SUBSTRING(@InputString, @Index, 1)
    SET @PrevChar = CASE WHEN @Index = 1 THEN '' ''
                         ELSE SUBSTRING(@InputString, @Index - 1, 1)
                    END

    IF @PrevChar IN ('' '', '';'', '':'', ''!'', ''?'', '','', ''.'', ''_'', ''-'', ''/'', ''&'', '''''''', ''('')
    BEGIN
        IF @PrevChar != '''''''' OR UPPER(@Char) != ''S''
            SET @OutputString = STUFF(@OutputString, @Index, 1, UPPER(@Char))
    END

    SET @Index = @Index + 1
END

RETURN @OutputString

END
' 
END

GO
