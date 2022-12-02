USE [University]
GO

/****** Object:  Table [dbo].[Groups]    Script Date: 05.10.2022 20:59:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Groups](
	[name_group] [varchar](50) NOT NULL,
	[year_admission] [int] NULL,
	[course] [int] NULL,
	[kol_students] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[name_group] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [CK_Groups] CHECK  (([year_admission]<(2023)))
GO

ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [CK_Groups]
GO


