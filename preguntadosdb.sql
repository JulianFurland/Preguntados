USE [master]
GO
/****** Object:  Database [Preguntados]    Script Date: 8/8/2023 10:42:27 ******/
CREATE DATABASE [Preguntados]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Preguntados', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Preguntados.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Preguntados_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Preguntados_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Preguntados] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Preguntados].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Preguntados] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Preguntados] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Preguntados] SET ARITHABORT OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Preguntados] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Preguntados] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Preguntados] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Preguntados] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Preguntados] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Preguntados] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Preguntados] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Preguntados] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Preguntados] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Preguntados] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Preguntados] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Preguntados] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Preguntados] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Preguntados] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Preguntados] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Preguntados] SET RECOVERY FULL 
GO
ALTER DATABASE [Preguntados] SET  MULTI_USER 
GO
ALTER DATABASE [Preguntados] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Preguntados] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Preguntados] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Preguntados] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Preguntados] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Preguntados', N'ON'
GO
ALTER DATABASE [Preguntados] SET QUERY_STORE = OFF
GO
USE [Preguntados]
GO
/****** Object:  User [alumno]    Script Date: 8/8/2023 10:42:28 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 8/8/2023 10:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idcategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[foto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 8/8/2023 10:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[iddificultad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[iddificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 8/8/2023 10:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idpregunta] [int] IDENTITY(1,1) NOT NULL,
	[idcategoria] [int] NOT NULL,
	[iddificultad] [int] NOT NULL,
	[enunciado] [varchar](50) NOT NULL,
	[foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idpregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 8/8/2023 10:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idrespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idpregunta] [int] NOT NULL,
	[opcion] [int] NOT NULL,
	[contenido] [varchar](50) NOT NULL,
	[correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idrespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (1, N'Arte', N'arte.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (2, N'Deportes', N'dep.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (3, N'Geografía', N'geo.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (4, N'Historia', N'historia.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (5, N'Ciencias', N'ciencias.jpg')
INSERT [dbo].[Categorias] ([idcategoria], [nombre], [foto]) VALUES (6, N'Entretenimiento', N'entre.jpg')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([iddificultad], [nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([iddificultad], [nombre]) VALUES (2, N'Dificil')
INSERT [dbo].[Dificultades] ([iddificultad], [nombre]) VALUES (3, N'Dificil')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (1, 1, 1, N'¿Qué se celebra el 14 de Febrero?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (2, 4, 1, N'¿Qué cargo ocupa desde el 10/12/2019?', N'alberto.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (3, 2, 2, N'¿En que deporte es imposible lesionarse?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (5, 5, 3, N'¿Cual es el nombre de esta flor?', N'verbanas.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (6, 1, 2, N'¿A quién pertenece el tema "Mil Horas"?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (7, 4, 3, N'¿En qué año murió Pablo Picasso?', N'picasso.jpg')
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (8, 6, 1, N'¿Cómo se llama la película del oso que habla?', NULL)
INSERT [dbo].[Preguntas] ([idpregunta], [idcategoria], [iddificultad], [enunciado], [foto]) VALUES (9, 1, 3, N'¿Cómo sigue la frase: "No esta para tirar..."?', N'')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idcategoria])
REFERENCES [dbo].[Categorias] ([idcategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([iddificultad])
REFERENCES [dbo].[Dificultades] ([iddificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idpregunta])
REFERENCES [dbo].[Preguntas] ([idpregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [Preguntados] SET  READ_WRITE 
GO
