USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ACTCreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccessControlList] DROP CONSTRAINT [DF_Table_1_ACTCreateDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccessControlList_ACLActivity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccessControlList] DROP CONSTRAINT [DF_AccessControlList_ACLActivity]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccessControlList_ACLToken]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccessControlList] DROP CONSTRAINT [DF_AccessControlList_ACLToken]
END

GO
/****** Object:  Table [dbo].[AccessControlList]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND type in (N'U'))
DROP TABLE [dbo].[AccessControlList]
GO
/****** Object:  Table [dbo].[AccessControlList]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccessControlList]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccessControlList](
	[ACLID] [int] NOT NULL,
	[ACLName] [nvarchar](255) NULL,
	[ACLToken] [nvarchar](50) NULL,
	[ACLActivity] [bit] NULL,
	[ACLDesc] [nvarchar](1000) NULL,
	[ACLmodifiedDate] [datetime] NULL,
	[ACLCreatedDate] [datetime] NULL,
 CONSTRAINT [PK_AccessControlList] PRIMARY KEY CLUSTERED 
(
	[ACLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccessControlList_ACLToken]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccessControlList] ADD  CONSTRAINT [DF_AccessControlList_ACLToken]  DEFAULT (newid()) FOR [ACLToken]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccessControlList_ACLActivity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccessControlList] ADD  CONSTRAINT [DF_AccessControlList_ACLActivity]  DEFAULT ((1)) FOR [ACLActivity]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_ACTCreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccessControlList] ADD  CONSTRAINT [DF_Table_1_ACTCreateDate]  DEFAULT (getdate()) FOR [ACLCreatedDate]
END

GO
