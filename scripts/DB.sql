USE [master]
GO
/****** Object:  Database [CARCENTER]    Script Date: 28/02/2021 19:16:22 ******/
CREATE DATABASE [CARCENTER]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CARCENTER', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CARCENTER.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CARCENTER_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CARCENTER_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CARCENTER] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CARCENTER].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CARCENTER] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CARCENTER] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CARCENTER] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CARCENTER] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CARCENTER] SET ARITHABORT OFF 
GO
ALTER DATABASE [CARCENTER] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CARCENTER] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CARCENTER] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CARCENTER] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CARCENTER] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CARCENTER] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CARCENTER] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CARCENTER] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CARCENTER] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CARCENTER] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CARCENTER] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CARCENTER] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CARCENTER] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CARCENTER] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CARCENTER] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CARCENTER] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CARCENTER] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CARCENTER] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CARCENTER] SET  MULTI_USER 
GO
ALTER DATABASE [CARCENTER] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CARCENTER] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CARCENTER] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CARCENTER] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CARCENTER] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CARCENTER]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IDCliente] [int] IDENTITY(1,1) NOT NULL,
	[tipoDocumentoCliente] [varchar](2) NOT NULL,
	[documentoCliente] [varchar](20) NOT NULL,
	[primerNombreCliente] [varchar](150) NOT NULL,
	[segundoNombreCliente] [varchar](150) NULL,
	[primerApellidoCliente] [varchar](150) NOT NULL,
	[segundoApellidoCliente] [varchar](150) NOT NULL,
	[celularCliente] [bigint] NOT NULL,
	[direccionCliente] [varchar](250) NOT NULL,
	[emailCliente] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IDCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IDDetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[IDFacturaDetalle] [int] NOT NULL,
	[IDProductoDetalle] [int] NOT NULL,
	[cantidadProductoDetalle] [int] NOT NULL,
	[valorProductoDetalle] [decimal](18, 2) NOT NULL,
	[descuentoProductoDetalle] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[IDDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IDFactura] [int] IDENTITY(1,1) NOT NULL,
	[fechaFactura] [datetime] NOT NULL,
	[IDValoracionFactura] [int] NOT NULL,
	[estadoFactura] [varchar](50) NOT NULL,
	[IDTiendaFactura] [int] NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mecanico]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mecanico](
	[IDMecanico] [int] IDENTITY(1,1) NOT NULL,
	[tipoDocumentoMecanico] [varchar](2) NOT NULL,
	[documentoMecanico] [varchar](20) NOT NULL,
	[primerNombreMecanico] [varchar](150) NOT NULL,
	[segundoNombreMecanico] [varchar](150) NULL,
	[primerApellidoMecanico] [varchar](150) NOT NULL,
	[segundoApellidoMecanico] [varchar](150) NOT NULL,
	[celularMecanico] [bigint] NOT NULL,
	[direccionMecanico] [varchar](250) NOT NULL,
	[emailMecanico] [varchar](250) NOT NULL,
	[estadoMecanico] [char](1) NOT NULL,
 CONSTRAINT [PK_Mecanico] PRIMARY KEY CLUSTERED 
(
	[IDMecanico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IDProducto] [int] IDENTITY(1,1) NOT NULL,
	[referenciaProducto] [varchar](6) NOT NULL,
	[descripcionProducto] [varchar](150) NOT NULL,
	[valorProducto] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[IDTienda] [int] IDENTITY(1,1) NOT NULL,
	[descripcionTienda] [varchar](150) NOT NULL,
	[direccionTienda] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[IDTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiendaProductoInventario]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiendaProductoInventario](
	[IDTienda] [int] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_TiendaProductoInventario] PRIMARY KEY CLUSTERED 
(
	[IDTienda] ASC,
	[IDProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoracion]    Script Date: 28/02/2021 19:16:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoracion](
	[IDValoracion] [int] IDENTITY(1,1) NOT NULL,
	[IDClienteValoracion] [int] NOT NULL,
	[IDMecanicoValoracion] [int] NULL,
	[placaVehiculoValoracion] [varchar](6) NOT NULL,
	[marcaVehiculoValoracion] [varchar](50) NOT NULL,
	[modeloVehiculoValoracion] [varchar](50) NOT NULL,
	[fotoVehiculoValoracion] [varbinary](max) NULL,
	[descripcionProblemaValoracion] [varchar](500) NOT NULL,
	[estadoValoracion] [char](1) NOT NULL,
 CONSTRAINT [PK_Valoracion] PRIMARY KEY CLUSTERED 
(
	[IDValoracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mecanico] ADD  CONSTRAINT [DF_Mecanico_estadoMecanico]  DEFAULT ('A') FOR [estadoMecanico]
GO
ALTER TABLE [dbo].[Valoracion] ADD  CONSTRAINT [DF_Valoracion_estadoValoracion]  DEFAULT ('A') FOR [estadoValoracion]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([IDFacturaDetalle])
REFERENCES [dbo].[Factura] ([IDFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Producto] FOREIGN KEY([IDProductoDetalle])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Tienda] FOREIGN KEY([IDTiendaFactura])
REFERENCES [dbo].[Tienda] ([IDTienda])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Tienda]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Valoracion] FOREIGN KEY([IDValoracionFactura])
REFERENCES [dbo].[Valoracion] ([IDValoracion])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Valoracion]
GO
ALTER TABLE [dbo].[TiendaProductoInventario]  WITH CHECK ADD  CONSTRAINT [FK_TiendaProductoInventario_Producto] FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Producto] ([IDProducto])
GO
ALTER TABLE [dbo].[TiendaProductoInventario] CHECK CONSTRAINT [FK_TiendaProductoInventario_Producto]
GO
ALTER TABLE [dbo].[TiendaProductoInventario]  WITH CHECK ADD  CONSTRAINT [FK_TiendaProductoInventario_Tienda] FOREIGN KEY([IDTienda])
REFERENCES [dbo].[Tienda] ([IDTienda])
GO
ALTER TABLE [dbo].[TiendaProductoInventario] CHECK CONSTRAINT [FK_TiendaProductoInventario_Tienda]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_Cliente] FOREIGN KEY([IDClienteValoracion])
REFERENCES [dbo].[Cliente] ([IDCliente])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_Cliente]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_Mecanico] FOREIGN KEY([IDMecanicoValoracion])
REFERENCES [dbo].[Mecanico] ([IDMecanico])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_Mecanico]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddItemFactura]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddItemFactura]
	@idFactura AS INT,
	@idProducto as INT,
	@cantProducto as INT
	
AS
BEGIN
	
		DECLARE @mensaje AS VARCHAR(MAX) = '';
		DECLARE @idTienda as int
		set @idTienda = (select @idTienda from Factura where IDFactura = @idFactura)

		BEGIN TRANSACTION T1

		BEGIN TRY
			
			--validar inventario producto
			declare @cantidadInventario as int
			set @cantidadInventario = (SELECT cantidad from TiendaProductoInventario where IDTienda =@idTienda and IDProducto =  @idProducto )
			IF @cantidadInventario - @cantProducto < 0
				BEGIN
					SET @mensaje = 'NO HAY SALDO DISPONIBLE';	
				END
			ELSE
				BEGIN
							DECLARE @VALOR AS DECIMAL(18,2)
							SET @VALOR = (SELECT valorProducto FROM Producto WHERE IDProducto = @idProducto)
							INSERT INTO [dbo].[DetalleFactura]
							   ([IDFacturaDetalle]
							   ,[IDProductoDetalle]
							   ,[cantidadProductoDetalle]
							   ,[valorProductoDetalle]
							   ,[descuentoProductoDetalle])
						 VALUES
							   (@idFactura
							   ,@idProducto
							   ,@cantProducto
							   ,@VALOR
							   ,0)
							   --8.	Procedimiento que reste la cantidad de productos del inventario de las tiendas cada que se presente una venta.
							   --ACTUALIZAMOS INVENTARIO DE LA TIENDA
							   UPDATE TiendaProductoInventario SET  cantidad =  cantidad - @cantProducto where IDTienda =@idTienda and IDProducto =  @idProducto 

			END
				
			COMMIT TRANSACTION T1
			SELECT @mensaje
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION T1
			SET @mensaje = ERROR_MESSAGE()
			SELECT @mensaje
		END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateFactura]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CreateFactura]
	@idValoracion as int,
	@idTienda as int
	
AS
BEGIN
	
	DECLARE @IDFACTURA  AS INT
	INSERT INTO [dbo].[Factura]
           ([fechaFactura]
           ,[IDValoracionFactura]
           ,[estadoFactura]
           ,[IDTiendaFactura])
     VALUES
           (GETDATE()
           ,@idValoracion
           ,'pendiente'
           ,@idTienda)
	SET @IDFACTURA =  @@IDENTITY 

	SELECT @IDFACTURA

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DeleteCliente]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jairo yesid lancheros
-- Create date: <Create Date,,>
-- Description:	borrar nuevo cliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_DeleteCliente]
	@id as int
AS
BEGIN
		DECLARE @mensaje AS VARCHAR(MAX) = '';

		--VALIDAR SI EL CLIENTE TIENE VALORACIONES PARA PERMITIR ELIMINAR
		IF EXISTS(SELECT TOP 1 1 FROM Valoracion WHERE IDClienteValoracion = @id )
			BEGIN
				SET @mensaje = 'EL CLIENTE TIENE VALORACIONES CREADAS';
				SELECT @mensaje;
				RETURN
			END
		BEGIN TRANSACTION T1

		BEGIN TRY
			DELETE Cliente WHERE IDCliente = @id
				
			COMMIT TRANSACTION T1
			SELECT @mensaje
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION T1
			SET @mensaje = ERROR_MESSAGE()
			SELECT @mensaje
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClienteByID]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetClienteByID]
	@id as int
AS
BEGIN
	SELECT [IDCliente]
      ,[tipoDocumentoCliente]
      ,[documentoCliente]
      ,[primerNombreCliente]
      ,[segundoNombreCliente]
      ,[primerApellidoCliente]
      ,[segundoApellidoCliente]
      ,[celularCliente]
      ,[direccionCliente]
      ,[emailCliente] FROM Cliente
	  where IDCliente = @id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClientes]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetClientes]
	
AS
BEGIN
	SELECT [IDCliente]
      ,[tipoDocumentoCliente]
      ,[documentoCliente]
      ,[primerNombreCliente]
      ,[segundoNombreCliente]
      ,[primerApellidoCliente]
      ,[segundoApellidoCliente]
      ,[celularCliente]
      ,[direccionCliente]
      ,[emailCliente] FROM Cliente
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveCliente]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jairo yesid lancheros
-- Create date: <Create Date,,>
-- Description:	guardar nuevo cliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_SaveCliente]
	@tipoDocto as varchar(3),
	@nroDocto as varchar(20),
	@primerNombre as varchar(150),
	@segundoNombre as varchar(150),
	@primerApellido as varchar(150),
	@segundoApellido as varchar(150),
	@celular as bigint,
	@direccion as varchar(250),
	@email as varchar(250)
AS
BEGIN
		DECLARE @mensaje AS VARCHAR(MAX) = '';

		--VALIDAR SI EL CLIENTE YA EXISTE EN LA BASE DE DATOS
		IF EXISTS(SELECT TOP 1 1 FROM Cliente WHERE tipoDocumentoCliente = @tipoDocto AND documentoCliente = @nroDocto )
			BEGIN
				SET @mensaje = 'EL CLIENTE YA SE ENCUENTRA REGISTRADO';
				SELECT @mensaje;
				RETURN
			END
		BEGIN TRANSACTION T1

		BEGIN TRY

				INSERT INTO [dbo].[Cliente]
					   ([tipoDocumentoCliente]
					   ,[documentoCliente]
					   ,[primerNombreCliente]
					   ,[segundoNombreCliente]
					   ,[primerApellidoCliente]
					   ,[segundoApellidoCliente]
					   ,[celularCliente]
					   ,[direccionCliente]
					   ,[emailCliente])
				 VALUES
					   (@tipoDocto
					   ,@nroDocto
					   ,@primerNombre
					   ,@segundoNombre
					   ,@primerApellido
					   ,@segundoNombre
					   ,@celular
					   ,@direccion
					   ,@email)

			COMMIT TRANSACTION T1
			SELECT @mensaje
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION T1
			SET @mensaje = ERROR_MESSAGE()
			SELECT @mensaje
		END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCliente]    Script Date: 28/02/2021 19:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		jairo yesid lancheros
-- Create date: <Create Date,,>
-- Description:	actualizar cliente
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCliente]
	@id as int,
	@tipoDocto as varchar(3),
	@nroDocto as varchar(20),
	@primerNombre as varchar(150),
	@segundoNombre as varchar(150),
	@primerApellido as varchar(150),
	@segundoApellido as varchar(150),
	@celular as bigint,
	@direccion as varchar(250),
	@email as varchar(250)
AS
BEGIN
		DECLARE @mensaje AS VARCHAR(MAX) = '';

		BEGIN TRANSACTION T1

		BEGIN TRY

			UPDATE [dbo].[Cliente]
		   SET [tipoDocumentoCliente] = @tipoDocto
			  ,[documentoCliente] = @nroDocto
			  ,[primerNombreCliente] = @primerNombre
			  ,[segundoNombreCliente] = @segundoNombre
			  ,[primerApellidoCliente] = @primerApellido
			  ,[segundoApellidoCliente] =@segundoApellido
			  ,[celularCliente] = @celular
			  ,[direccionCliente] = @direccion
			  ,[emailCliente] = @email
		 WHERE  IDCliente = @id
		

			COMMIT TRANSACTION T1
			SELECT @mensaje
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION T1
			SET @mensaje = ERROR_MESSAGE()
			SELECT @mensaje
		END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [CARCENTER] SET  READ_WRITE 
GO
