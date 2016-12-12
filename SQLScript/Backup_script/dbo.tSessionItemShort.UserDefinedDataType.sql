USE [RAM]
GO
/****** Object:  UserDefinedDataType [dbo].[tSessionItemShort]    Script Date: 11/24/2016 2:34:05 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'tSessionItemShort' AND ss.name = N'dbo')
DROP TYPE [dbo].[tSessionItemShort]
GO
/****** Object:  UserDefinedDataType [dbo].[tSessionItemShort]    Script Date: 11/24/2016 2:34:05 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'tSessionItemShort' AND ss.name = N'dbo')
CREATE TYPE [dbo].[tSessionItemShort] FROM [varbinary](7000) NULL
GO
