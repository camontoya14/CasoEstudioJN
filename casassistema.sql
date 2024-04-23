USE [master]
GO
CREATE DATABASE [CasoEstudioJN]
GO
USE [CasoEstudioJN]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CasasSistema](
	[IdCasa] [bigint] IDENTITY(1,1) NOT NULL,
	[DescripcionCasa] [varchar](30) NOT NULL,
	[PrecioCasa] [decimal](10, 2) NOT NULL,
	[UsuarioAlquiler] [varchar](30) NULL,
	[FechaAlquiler] [datetime] NULL,
 CONSTRAINT [PK_CasasSistema] PRIMARY KEY CLUSTERED 
(
	[IdCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CasasSistema] ON 

INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (1, N'Casa en San José', CAST(190000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (2, N'Casa en Alajuela', CAST(145000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (3, N'Casa en Cartago', CAST(115000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (4, N'Casa en Heredia', CAST(122000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (5, N'Casa en Guanacaste', CAST(105000.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CasasSistema] OFF
GO
USE [master]
GO
ALTER DATABASE [CasoEstudioMN] SET  READ_WRITE 
GO
