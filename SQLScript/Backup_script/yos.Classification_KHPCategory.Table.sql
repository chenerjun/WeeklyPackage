USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_Classification_KHPCategory_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]'))
ALTER TABLE [yos].[Classification_KHPCategory] DROP CONSTRAINT [FK_Classification_KHPCategory_KHPCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_Classification_KHPCategory_Classification]') AND parent_object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]'))
ALTER TABLE [yos].[Classification_KHPCategory] DROP CONSTRAINT [FK_Classification_KHPCategory_Classification]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Classification_KHPCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[Classification_KHPCategory] DROP CONSTRAINT [DF_Classification_KHPCategory_CreatedDate]
END

GO
/****** Object:  Table [yos].[Classification_KHPCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]') AND type in (N'U'))
DROP TABLE [yos].[Classification_KHPCategory]
GO
/****** Object:  Table [yos].[Classification_KHPCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[Classification_KHPCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[classificationID] [int] NOT NULL,
	[KHPCategoryID] [int] NOT NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Classification_KHPCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Classification_KHPCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[Classification_KHPCategory] ADD  CONSTRAINT [DF_Classification_KHPCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_Classification_KHPCategory_Classification]') AND parent_object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]'))
ALTER TABLE [yos].[Classification_KHPCategory]  WITH CHECK ADD  CONSTRAINT [FK_Classification_KHPCategory_Classification] FOREIGN KEY([classificationID])
REFERENCES [dbo].[Classification] ([classificationID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_Classification_KHPCategory_Classification]') AND parent_object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]'))
ALTER TABLE [yos].[Classification_KHPCategory] CHECK CONSTRAINT [FK_Classification_KHPCategory_Classification]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_Classification_KHPCategory_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]'))
ALTER TABLE [yos].[Classification_KHPCategory]  WITH CHECK ADD  CONSTRAINT [FK_Classification_KHPCategory_KHPCategory] FOREIGN KEY([KHPCategoryID])
REFERENCES [yos].[KHPCategory] ([KHPCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_Classification_KHPCategory_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[Classification_KHPCategory]'))
ALTER TABLE [yos].[Classification_KHPCategory] CHECK CONSTRAINT [FK_Classification_KHPCategory_KHPCategory]
GO
