﻿SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [OKEISections](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_OKEISections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [OKEIGroups](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[SectionId] [int] NOT NULL,
 CONSTRAINT [PK_OKEIGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [OKEIGroups]  WITH CHECK ADD  CONSTRAINT [FK_OKEIGroups_OKEISections] FOREIGN KEY([SectionId])
REFERENCES [OKEISections] ([Id])
ON UPDATE CASCADE
GO

ALTER TABLE [OKEIGroups] CHECK CONSTRAINT [FK_OKEIGroups_OKEISections]
GO


CREATE TABLE [OKEIUoms](
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[SymbolRu] [nvarchar](50) NULL,
	[SymbolEn] [nvarchar](50) NULL,
	[AlphaRu] [nvarchar](50) NULL,
	[AlphaEn] [nvarchar](50) NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_OKEIUoms] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [OKEIUoms]  WITH CHECK ADD  CONSTRAINT [FK_OKEIUoms_OKEIGroups] FOREIGN KEY([GroupId])
REFERENCES [OKEIGroups] ([Id])
ON UPDATE CASCADE
GO

ALTER TABLE [OKEIUoms] CHECK CONSTRAINT [FK_OKEIUoms_OKEIGroups]
GO


