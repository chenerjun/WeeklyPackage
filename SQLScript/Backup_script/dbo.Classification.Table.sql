USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_classification_createdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Classification] DROP CONSTRAINT [DF_classification_createdate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Classification_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Classification] DROP CONSTRAINT [DF_Classification_Active]
END

GO
/****** Object:  Table [dbo].[Classification]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classification]') AND type in (N'U'))
DROP TABLE [dbo].[Classification]
GO
/****** Object:  Table [dbo].[Classification]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Classification]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Classification](
	[classificationID] [int] NOT NULL,
	[classification] [nvarchar](50) NOT NULL,
	[Desc] [nvarchar](255) NULL,
	[Active] [bit] NOT NULL,
	[type] [nvarchar](50) NULL,
	[ChangedDate] [datetime] NULL,
	[createdate] [datetime] NOT NULL,
 CONSTRAINT [PK_classification] PRIMARY KEY CLUSTERED 
(
	[classificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Classification_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Classification] ADD  CONSTRAINT [DF_Classification_Active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_classification_createdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Classification] ADD  CONSTRAINT [DF_classification_createdate]  DEFAULT (getdate()) FOR [createdate]
END

GO
