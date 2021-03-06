USE [RAM]
GO
ALTER TABLE [dbo].[z.useless Classification_KHPCategory] DROP CONSTRAINT [FK_Classification_KHPCategory_KHPCategory]
GO
ALTER TABLE [dbo].[z.useless Classification_KHPCategory] DROP CONSTRAINT [FK_Classification_KHPCategory_Classification]
GO
/****** Object:  Table [dbo].[z.useless Classification_KHPCategory]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless Classification_KHPCategory]
GO
/****** Object:  Table [dbo].[z.useless Classification_KHPCategory]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless Classification_KHPCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[classificationID] [int] NOT NULL,
	[KHPCategoryID] [int] NOT NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_Classification_KHPCategory_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Classification_KHPCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[z.useless Classification_KHPCategory]  WITH CHECK ADD  CONSTRAINT [FK_Classification_KHPCategory_Classification] FOREIGN KEY([classificationID])
REFERENCES [dbo].[Classification] ([classificationID])
GO
ALTER TABLE [dbo].[z.useless Classification_KHPCategory] CHECK CONSTRAINT [FK_Classification_KHPCategory_Classification]
GO
ALTER TABLE [dbo].[z.useless Classification_KHPCategory]  WITH CHECK ADD  CONSTRAINT [FK_Classification_KHPCategory_KHPCategory] FOREIGN KEY([KHPCategoryID])
REFERENCES [dbo].[z.useless KHPCategory] ([KHPCategoryID])
GO
ALTER TABLE [dbo].[z.useless Classification_KHPCategory] CHECK CONSTRAINT [FK_Classification_KHPCategory_KHPCategory]
GO
