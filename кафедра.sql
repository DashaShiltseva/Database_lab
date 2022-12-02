USE [University]
GO

/****** Object:  Table [dbo].[Kafedra]    Script Date: 05.10.2022 20:59:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kafedra](
	[name_kafedra] [varchar](50) NOT NULL,
	[name_fakulteta] [varchar](50) NULL,
	[name_zaved] [varchar](50) NULL,
	[room] [int] NULL,
	[corpus] [int] NULL,
	[phone] [bigint] NULL,
	[kol_prepods] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[name_kafedra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Kafedra]  WITH CHECK ADD  CONSTRAINT [FK_Kafedra_Fakultet] FOREIGN KEY([name_fakulteta])
REFERENCES [dbo].[Fakultet] ([name_fakulteta])
GO

ALTER TABLE [dbo].[Kafedra] CHECK CONSTRAINT [FK_Kafedra_Fakultet]
GO


