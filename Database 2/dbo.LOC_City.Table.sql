USE [21010101121]
GO
/****** Object:  Table [dbo].[LOC_City]    Script Date: 28-08-2023 22:14:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOC_City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](100) NOT NULL,
	[StateID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[Citycode] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_LOC_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LOC_City] ADD  CONSTRAINT [DF_LOC_City_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LOC_City] ADD  CONSTRAINT [DF_LOC_City_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[LOC_City]  WITH CHECK ADD  CONSTRAINT [FK_LOC_City_LOC_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[LOC_Country] ([CountryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LOC_City] CHECK CONSTRAINT [FK_LOC_City_LOC_Country]
GO
