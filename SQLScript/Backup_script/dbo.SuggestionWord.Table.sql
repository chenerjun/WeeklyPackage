USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SuggestionWord_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SuggestionWord] DROP CONSTRAINT [DF_SuggestionWord_CreatedDate]
END

GO
/****** Object:  Table [dbo].[SuggestionWord]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SuggestionWord]') AND type in (N'U'))
DROP TABLE [dbo].[SuggestionWord]
GO
/****** Object:  Table [dbo].[SuggestionWord]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SuggestionWord]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SuggestionWord](
	[SuggestionWordID] [int] IDENTITY(1,1) NOT NULL,
	[SuggestionWord] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SuggestionWord] PRIMARY KEY CLUSTERED 
(
	[SuggestionWordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SuggestionWord_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SuggestionWord] ADD  CONSTRAINT [DF_SuggestionWord_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
