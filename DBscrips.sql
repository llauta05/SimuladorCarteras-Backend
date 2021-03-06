USE [master]
GO
/****** Object:  Database [Taller2Carteras]    Script Date: 11/28/2019 11:51:04 AM ******/
CREATE DATABASE [Taller2Carteras]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Taller2Carteras', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Taller2Carteras.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Taller2Carteras_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Taller2Carteras_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Taller2Carteras] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Taller2Carteras].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Taller2Carteras] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Taller2Carteras] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Taller2Carteras] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Taller2Carteras] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Taller2Carteras] SET ARITHABORT OFF 
GO
ALTER DATABASE [Taller2Carteras] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Taller2Carteras] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Taller2Carteras] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Taller2Carteras] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Taller2Carteras] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Taller2Carteras] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Taller2Carteras] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Taller2Carteras] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Taller2Carteras] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Taller2Carteras] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Taller2Carteras] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Taller2Carteras] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Taller2Carteras] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Taller2Carteras] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Taller2Carteras] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Taller2Carteras] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Taller2Carteras] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Taller2Carteras] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Taller2Carteras] SET  MULTI_USER 
GO
ALTER DATABASE [Taller2Carteras] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Taller2Carteras] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Taller2Carteras] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Taller2Carteras] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Taller2Carteras] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Taller2Carteras] SET QUERY_STORE = OFF
GO
USE [Taller2Carteras]
GO
/****** Object:  Table [dbo].[carteras]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carteras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
	[fecha_creacion] [datetime] NULL,
	[activa] [bit] NOT NULL,
	[idUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carteras_composicion]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carteras_composicion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cartera] [int] NOT NULL,
	[especie] [varchar](30) NOT NULL,
	[fecha_operacion] [datetime] NOT NULL,
	[tipo_operacion] [varchar](2) NOT NULL,
	[cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carteras_historico]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carteras_historico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cartera] [int] NOT NULL,
	[fecha_operacion] [datetime] NOT NULL,
	[tipo_operacion] [varchar](2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[valor] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicadores]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicadores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Indicadores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Indicadores_carteras]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Indicadores_carteras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cartera] [int] NOT NULL,
	[id_indicador] [int] NOT NULL,
 CONSTRAINT [PK_Indicadores_carteras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificaciones]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [text] NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_Notificaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 11/28/2019 11:51:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[apellido] [varchar](255) NOT NULL,
	[nombre_usuario] [varchar](255) NOT NULL,
	[pass] [varchar](20) NOT NULL,
	[fecha_alta] [datetime] NULL,
	[foto] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[carteras]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[carteras_historico]  WITH CHECK ADD FOREIGN KEY([id_cartera])
REFERENCES [dbo].[carteras] ([id])
GO
USE [master]
GO
ALTER DATABASE [Taller2Carteras] SET  READ_WRITE 
GO
