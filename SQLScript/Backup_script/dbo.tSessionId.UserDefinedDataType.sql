USE [RAM]
GO
/****** Object:  UserDefinedDataType [dbo].[tSessionId]    Script Date: 11/24/2016 2:34:05 PM ******/
IF  EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'tSessionId' AND ss.name = N'dbo')
DROP TYPE [dbo].[tSessionId]
GO
/****** Object:  UserDefinedDataType [dbo].[tSessionId]    Script Date: 11/24/2016 2:34:05 PM ******/
IF NOT EXISTS (SELECT * FROM sys.types st JOIN sys.schemas ss ON st.schema_id = ss.schema_id WHERE st.name = N'tSessionId' AND ss.name = N'dbo')
CREATE TYPE [dbo].[tSessionId] FROM [nvarchar](88) NOT NULL
GO
