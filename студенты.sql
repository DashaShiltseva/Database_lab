USE [University]
GO

/****** Object:  Table [dbo].[Students]    Script Date: 05.10.2022 20:59:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Students](
	[kod_studenta] [varchar](50) NOT NULL,
	[familiya] [varchar](50) NULL,
	[imya] [varchar](50) NULL,
	[otchestvo] [varchar](50) NULL,
	[name_group] [varchar](50) NULL,
	[birth_date] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[adress] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[phone] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[kod_studenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


