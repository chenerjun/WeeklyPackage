USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLWeb_ACLWebCreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLWeb] DROP CONSTRAINT [DF_ACLWeb_ACLWebCreatedDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLWeb_ACLWebActivity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLWeb] DROP CONSTRAINT [DF_ACLWeb_ACLWebActivity]
END

GO
/****** Object:  Table [dbo].[ACLWeb]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACLWeb]') AND type in (N'U'))
DROP TABLE [dbo].[ACLWeb]
GO
/****** Object:  Table [dbo].[ACLWeb]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACLWeb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACLWeb](
	[ACLWebID] [int] NOT NULL,
	[ACLID] [int] NULL,
	[ACLWeb] [nvarchar](255) NULL,
	[ACLWebActivity] [bit] NULL,
	[ACLWebDesc] [nvarchar](255) NULL,
	[ACLWebModifiedDate] [datetime] NULL,
	[ACLWebCreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ACLWeb] PRIMARY KEY CLUSTERED 
(
	[ACLWebID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLWeb_ACLWebActivity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLWeb] ADD  CONSTRAINT [DF_ACLWeb_ACLWebActivity]  DEFAULT ((1)) FOR [ACLWebActivity]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLWeb_ACLWebCreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLWeb] ADD  CONSTRAINT [DF_ACLWeb_ACLWebCreatedDate]  DEFAULT (getdate()) FOR [ACLWebCreatedDate]
END

GO
