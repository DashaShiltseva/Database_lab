USE [University]
GO

/****** Object:  Table [dbo].[Fakultet]    Script Date: 05.10.2022 20:57:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fakultet](
	[name_fakulteta] [varchar](50) NOT NULL,
	[name_dekana] [varchar](50) NULL,
	[room] [varchar](50) NULL,
	[corpus] [int] NULL,
	[phone] [bigint] NULL,
 CONSTRAINT [PK__Fakultet] PRIMARY KEY CLUSTERED 
(
	[name_fakulteta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fakultet]  WITH CHECK ADD  CONSTRAINT [FK_Fakultet_Fakultet] FOREIGN KEY([name_fakulteta])
REFERENCES [dbo].[Fakultet] ([name_fakulteta])
GO

ALTER TABLE [dbo].[Fakultet] CHECK CONSTRAINT [FK_Fakultet_Fakultet]
GO

ALTER TABLE [dbo].[Fakultet]  WITH CHECK ADD  CONSTRAINT [CK_Fakultet] CHECK  (([phone]<(1000000)))
GO

ALTER TABLE [dbo].[Fakultet] CHECK CONSTRAINT [CK_Fakultet]
GO


