USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLIP_ACLIPCreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLIP] DROP CONSTRAINT [DF_ACLIP_ACLIPCreatedDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLIP_ACLIPActivity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLIP] DROP CONSTRAINT [DF_ACLIP_ACLIPActivity]
END

GO
/****** Object:  Table [dbo].[ACLIP]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACLIP]') AND type in (N'U'))
DROP TABLE [dbo].[ACLIP]
GO
/****** Object:  Table [dbo].[ACLIP]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACLIP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACLIP](
	[ACLIPID] [int] NOT NULL,
	[ACLID] [int] NULL,
	[ACLIP] [nvarchar](50) NULL,
	[ACLIPActivity] [bit] NULL,
	[ACLIPDesc] [nvarchar](255) NULL,
	[ACLIPModifiedDate] [datetime] NULL,
	[ACLIPCreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ACLIP] PRIMARY KEY CLUSTERED 
(
	[ACLIPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLIP_ACLIPActivity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLIP] ADD  CONSTRAINT [DF_ACLIP_ACLIPActivity]  DEFAULT ((1)) FOR [ACLIPActivity]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ACLIP_ACLIPCreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACLIP] ADD  CONSTRAINT [DF_ACLIP_ACLIPCreatedDate]  DEFAULT (getdate()) FOR [ACLIPCreatedDate]
END

GO
