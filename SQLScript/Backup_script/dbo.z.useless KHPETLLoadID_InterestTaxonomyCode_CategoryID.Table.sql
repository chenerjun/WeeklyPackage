USE [RAM]
GO
ALTER TABLE [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID] DROP CONSTRAINT [FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]
GO
/****** Object:  Table [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID]
GO
/****** Object:  Table [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NULL,
	[KHPInterestTaxonomyCode] [nvarchar](50) NULL,
	[KHPCategoryID] [int] NULL,
	[changedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL CONSTRAINT [DF_KHPETLLoadID_InterestTaxonomyCode_CategoryID_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_KHPETLLoadID_InterestTaxonomyCode_CategoryID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID]  WITH CHECK ADD  CONSTRAINT [FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory] FOREIGN KEY([KHPCategoryID])
REFERENCES [dbo].[z.useless KHPCategory] ([KHPCategoryID])
GO
ALTER TABLE [dbo].[z.useless KHPETLLoadID_InterestTaxonomyCode_CategoryID] CHECK CONSTRAINT [FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]
GO
