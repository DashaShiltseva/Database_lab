USE [University]
GO

/****** Object:  Table [dbo].[Vedomosty]    Script Date: 05.10.2022 21:00:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Vedomosty](
	[number_vedomost] [int] NOT NULL,
	[name_group] [varchar](50) NULL,
	[student] [varchar](50) NULL,
	[predmet] [varchar](50) NULL,
	[mark] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[number_vedomost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


