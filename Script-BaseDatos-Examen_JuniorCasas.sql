create database [Examen_jcasas]
go
USE [Examen_jcasas]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[apellidoP] [nvarchar](50) NULL,
	[apellidoM] [nvarchar](50) NULL,
	[nombres] [nvarchar](50) NULL,
	[fechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Factura]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Factura](
	[idFactura] [int] NOT NULL,
	[idcliente] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura_Cabecera]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Cabecera](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_factura] [datetime] NULL,
	[TotalPagar] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Factura_Cabecera] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura_Detalle]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Detalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_factura] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Factura_Detalle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[precio] [decimal](18, 2) NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([id], [apellidoP], [apellidoM], [nombres], [fechaCreacion]) VALUES (1, N'Casas', N'Lévano', N'Junior Jampier', CAST(N'2022-07-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Cliente] ([id], [apellidoP], [apellidoM], [nombres], [fechaCreacion]) VALUES (2, N'Rivera', N'Mendoza', N'Pierina', CAST(N'2022-07-20T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Cliente_Factura] ([idFactura], [idcliente]) VALUES (1, 2)
GO
SET IDENTITY_INSERT [dbo].[Factura_Cabecera] ON 
GO
INSERT [dbo].[Factura_Cabecera] ([idFactura], [fecha_factura], [TotalPagar]) VALUES (1, CAST(N'2022-07-20T00:00:00.000' AS DateTime), CAST(6.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Factura_Cabecera] OFF
GO
SET IDENTITY_INSERT [dbo].[Factura_Detalle] ON 
GO
INSERT [dbo].[Factura_Detalle] ([id], [id_factura], [idProducto], [cantidad], [precio]) VALUES (1, 1, 2, 2, CAST(3.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Factura_Detalle] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [stock]) VALUES (1, N'Cuader A4', CAST(5.00 AS Decimal(18, 2)), 200)
GO
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [stock]) VALUES (2, N'folder', CAST(3.00 AS Decimal(18, 2)), 100)
GO
INSERT [dbo].[Producto] ([idProducto], [nombre], [precio], [stock]) VALUES (3, N'lacipcero', CAST(0.50 AS Decimal(18, 2)), 300)
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
/****** Object:  StoredProcedure [dbo].[Lista_cliente]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Lista_cliente]
as
begin
		select 
				id,
				apellidoP,
				apellidoM,
				nombres,
				fechaCreacion
		from [dbo].[Cliente]
end
GO
/****** Object:  StoredProcedure [dbo].[Lista_Producto]    Script Date: 21/07/2022 01:22:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Lista_Producto]
as
begin
	select  
			idproducto,
			nombre,
			precio,
			stock
	from [dbo].[Producto]

end
GO
