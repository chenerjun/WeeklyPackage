USE [RAM]
GO
/****** Object:  FullTextCatalog [Keyword]    Script Date: 12/8/2016 9:19:28 PM ******/
GO
IF  EXISTS (SELECT * FROM sysfulltextcatalogs ftc WHERE ftc.name = N'Keyword')
DROP FULLTEXT CATALOG [Keyword]
GO
/****** Object:  FullTextCatalog [Keyword]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sysfulltextcatalogs ftc WHERE ftc.name = N'Keyword')
CREATE FULLTEXT CATALOG [Keyword]WITH ACCENT_SENSITIVITY = ON

GO
