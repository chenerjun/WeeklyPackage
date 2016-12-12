USE [RAM]
GO
/****** Object:  User [RAMUser]    Script Date: 11/27/2016 9:37:32 PM ******/
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RAMUser')
DROP USER [RAMUser]
GO
/****** Object:  User [RAMUser]    Script Date: 11/27/2016 9:37:32 PM ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RAMUser')
CREATE USER [RAMUser] FOR LOGIN [RAMUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [RAMUser]
GO
