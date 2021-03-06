USE [RAM]
GO
/****** Object:  UserDefinedFunction [dbo].[InitCap]    Script Date: 10/28/2016 3:50:53 PM ******/
--------------------------------------------------------
-- 
-- Get every first letter of string upcase
-- Example: @a = 'abc d fgh ijk' ; 
-- print  [dbo].[InitCap] (@a);
-- the result in 'Abc D Fgh Ijk'
--------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[InitCap] ( @InputString NVARCHAR(4000) ) 
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
    SET @PrevChar = CASE WHEN @Index = 1 THEN ' '
                         ELSE SUBSTRING(@InputString, @Index - 1, 1)
                    END

    IF @PrevChar IN (' ', ';', ':', '!', '?', ',', '.', '_', '-', '/', '&', '''', '(')
    BEGIN
        IF @PrevChar != '''' OR UPPER(@Char) != 'S'
            SET @OutputString = STUFF(@OutputString, @Index, 1, UPPER(@Char))
    END

    SET @Index = @Index + 1
END

RETURN @OutputString

END
