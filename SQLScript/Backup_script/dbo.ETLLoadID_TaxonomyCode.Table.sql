USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ETLLoadID_TaxonomyCode_ProgramRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[ETLLoadID_TaxonomyCode]'))
ALTER TABLE [dbo].[ETLLoadID_TaxonomyCode] DROP CONSTRAINT [FK_ETLLoadID_TaxonomyCode_ProgramRAW]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ETLLoadID_TaxonomyCode_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ETLLoadID_TaxonomyCode] DROP CONSTRAINT [DF_ETLLoadID_TaxonomyCode_CreateDate]
END

GO
/****** Object:  Table [dbo].[ETLLoadID_TaxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ETLLoadID_TaxonomyCode]') AND type in (N'U'))
DROP TABLE [dbo].[ETLLoadID_TaxonomyCode]
GO
/****** Object:  Table [dbo].[ETLLoadID_TaxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ETLLoadID_TaxonomyCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ETLLoadID_TaxonomyCode](
	[ETLLoadID_TaxonomyCode_ID] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NULL,
	[TaxonomyCode] [nvarchar](50) NULL,
	[ChangedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_ETLLoadID_TaxonomyCode] PRIMARY KEY CLUSTERED 
(
	[ETLLoadID_TaxonomyCode_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ETLLoadID_TaxonomyCode_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ETLLoadID_TaxonomyCode] ADD  CONSTRAINT [DF_ETLLoadID_TaxonomyCode_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ETLLoadID_TaxonomyCode_ProgramRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[ETLLoadID_TaxonomyCode]'))
ALTER TABLE [dbo].[ETLLoadID_TaxonomyCode]  WITH CHECK ADD  CONSTRAINT [FK_ETLLoadID_TaxonomyCode_ProgramRAW] FOREIGN KEY([ETLLoadID])
REFERENCES [dbo].[ProgramRAW] ([ETLLoadID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ETLLoadID_TaxonomyCode_ProgramRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[ETLLoadID_TaxonomyCode]'))
ALTER TABLE [dbo].[ETLLoadID_TaxonomyCode] CHECK CONSTRAINT [FK_ETLLoadID_TaxonomyCode_ProgramRAW]
GO
