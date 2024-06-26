USE [master]
GO
/****** Object:  Database [CasoEstudioJN]    Script Date: 4/23/2024 8:59:13 PM ******/
CREATE DATABASE [CasoEstudioJN]
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

INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (1, N'Casa en San José', CAST(190000.00 AS Decimal(10, 2)), N'Caro', CAST(N'2024-04-23T20:56:24.503' AS DateTime))
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (2, N'Casa en Alajuela', CAST(145000.00 AS Decimal(10, 2)), N'Jimmy', CAST(N'2024-04-23T20:57:00.777' AS DateTime))
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (3, N'Casa en Cartago', CAST(115000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (4, N'Casa en Heredia', CAST(122000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[CasasSistema] ([IdCasa], [DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) VALUES (5, N'Casa en Guanacaste', CAST(105000.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CasasSistema] OFF
GO
/****** Object:  StoredProcedure [dbo].[AlquilarCasa]    Script Date: 4/23/2024 8:59:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AlquilarCasa]
	@IdCasa		BIGINT,
	@PrecioCasa		DECIMAL(10,2),
	@UsuarioAlquiler	VARCHAR(30),
	@FechaAlquiler DATETIME
AS
BEGIN

	UPDATE dbo.CasasSistema
	   SET PrecioCasa = @PrecioCasa,
		   UsuarioAlquiler = @UsuarioAlquiler,
		   FechaAlquiler = @FechaAlquiler
	 WHERE IdCasa = @IdCasa

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCasa]    Script Date: 4/23/2024 8:59:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCasa]
	@IdCasa BIGINT
AS
BEGIN

	SELECT	PrecioCasa
	FROM	CasasSistema
	where IdCasa = @IdCasa

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCasas]    Script Date: 4/23/2024 8:59:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCasas]
	
AS
BEGIN

	SELECT	IdCasa,DescripcionCasa,PrecioCasa,UsuarioAlquiler,FechaAlquiler
	FROM	CasasSistema

END
GO
USE [master]
GO
ALTER DATABASE [CasoEstudioJN] SET  READ_WRITE 
GO
