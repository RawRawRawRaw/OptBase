USE [master]
GO
/****** Object:  Database [ОптоваяБаза]    Script Date: 23.03.2025 0:26:29 ******/
CREATE DATABASE [ОптоваяБаза]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ОптоваяБаза', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\ОптоваяБаза.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ОптоваяБаза_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS02\MSSQL\DATA\ОптоваяБаза_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ОптоваяБаза] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ОптоваяБаза].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ОптоваяБаза] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET ARITHABORT OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ОптоваяБаза] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ОптоваяБаза] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ОптоваяБаза] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ОптоваяБаза] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ОптоваяБаза] SET  MULTI_USER 
GO
ALTER DATABASE [ОптоваяБаза] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ОптоваяБаза] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ОптоваяБаза] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ОптоваяБаза] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ОптоваяБаза] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ОптоваяБаза] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ОптоваяБаза] SET QUERY_STORE = OFF
GO
USE [ОптоваяБаза]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 23.03.2025 0:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[Код] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
	[КоличествоСклад] [int] NULL,
	[ЕдиницаИзмерения] [nvarchar](50) NULL,
	[Стоимость] [int] NULL,
	[Описание] [nvarchar](150) NULL,
 CONSTRAINT [PK_Товары] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Поставщики]    Script Date: 23.03.2025 0:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Поставщики](
	[Номер] [int] NOT NULL,
	[Адрес] [nvarchar](50) NULL,
	[Телефон] [nvarchar](50) NULL,
	[ФИО] [nvarchar](50) NULL,
	[СрокПоставки] [datetime] NULL,
	[КолвоТоваровПоставки] [int] NULL,
	[НомерСчета] [int] NULL,
 CONSTRAINT [PK_Поставщики] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[База]    Script Date: 23.03.2025 0:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[База](
	[КодТовара] [int] NOT NULL,
	[НомерПоставщика] [int] NOT NULL,
	[Ключ] [int] NOT NULL,
 CONSTRAINT [PK_База] PRIMARY KEY CLUSTERED 
(
	[Ключ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View1]    Script Date: 23.03.2025 0:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View1] AS
WITH SupplierItemCounts AS (
    SELECT 
        b.НомерПоставщика,
        COUNT(DISTINCT b.КодТовара) AS ТоваровКоличество
    FROM 
        dbo.База b
    GROUP BY 
        b.НомерПоставщика
)

SELECT
    b.НомерПоставщика,
    p.ФИО,
    b.КодТовара,
    t.Название
FROM
    dbo.База b
INNER JOIN
    dbo.Поставщики p ON b.НомерПоставщика = p.Номер
INNER JOIN
    dbo.Товары t ON b.КодТовара = t.Код
WHERE 
    b.НомерПоставщика IN (
        SELECT 
            НомерПоставщика 
        FROM 
            SupplierItemCounts 
        WHERE 
            ТоваровКоличество = (SELECT COUNT(*) FROM dbo.Товары)
    );
GO
/****** Object:  View [dbo].[View2]    Script Date: 23.03.2025 0:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View2] AS
SELECT 
    t.Название,
    p.ФИО,
    MIN(t.стоимость) AS МинимальнаяСтоимость
FROM 
    dbo.База b
JOIN 
    dbo.Товары t ON b.КодТовара = t.Код
JOIN 
    dbo.Поставщики p ON b.НомерПоставщика = p.Номер
WHERE 
    t.Название = 'коврик для мыши'
GROUP BY 
    t.Название, p.ФИО
HAVING 
    MIN(t.стоимость) = (SELECT MIN(стоимость)
                        FROM dbo.Товары t2
                        JOIN dbo.База b2 ON t2.Код = b2.КодТовара
                        WHERE t2.Название = 'коврик для мыши');
GO
/****** Object:  View [dbo].[View3]    Script Date: 23.03.2025 0:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View3] AS
SELECT 
    t.Название AS НазваниеТовара, 
    t.Стоимость
FROM 
    Товары t
WHERE 
    t.Код IN (
        SELECT Код
        FROM Товары
        GROUP BY Код
        HAVING COUNT(DISTINCT Стоимость) = 1
    );
GO
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (1, 8, 0)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (1, 1, 1)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (2, 1, 2)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (3, 1, 3)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (4, 1, 4)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (5, 1, 5)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (1, 2, 6)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (2, 2, 7)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (3, 2, 8)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (4, 2, 9)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (5, 2, 10)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (1, 3, 11)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (2, 4, 12)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (3, 5, 13)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (4, 6, 14)
INSERT [dbo].[База] ([КодТовара], [НомерПоставщика], [Ключ]) VALUES (5, 6, 15)
GO
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (1, N'Москва, ул.Ленина, д. 1', N'+7495111-11-11', N'Иванов Иван Иванович', CAST(N'2000-03-16T00:00:00.000' AS DateTime), 100, 1451)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (2, N'Санкт-Петербург, ул.Невский, д. 2', N'+7812222-22-22', N'Петров Петр Петрович', CAST(N'2001-03-20T00:00:00.000' AS DateTime), 200, 5050)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (3, N'Екатеринбург, ул.Мира, д. 3', N'+7343333-33-33', N'Сидоров Сидор Сидорович', CAST(N'2023-03-16T00:00:00.000' AS DateTime), 150, 501)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (4, N'Казань, ул.Баумана, д. 4', N'+7843444-44-44', N'Алексеев Алексей Алексеевич', CAST(N'2022-03-16T00:00:00.000' AS DateTime), 250, 20)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (5, N'Новосибирск, ул.Красный проспект, д. 5', N'+7383555-55-55', N'Кузнецов Николай Николаевич', CAST(N'2021-03-16T00:00:00.000' AS DateTime), 300, 501)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (6, N'Нижний Новгород, ул.Горького, д. 6', N'+7831666-66-66', N'Семенов Семен Семенович', CAST(N'2025-03-16T00:00:00.000' AS DateTime), 120, 245)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (7, N'Челябинск, ул.Теплотехников, д. 7', N'+7351777-77-77', N'Федоров Федор Федорович', CAST(N'2025-03-16T00:00:00.000' AS DateTime), 180, 321)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (8, N'Ростов-на-Дону, ул.Суворова, д. 8', N'+7863888-88-88', N'Зайцев Алексей Викторович', CAST(N'2025-03-16T00:00:00.000' AS DateTime), 220, 25)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (9, N'Уфа, ул.Ленина, д. 9', N'+7347999-99-99', N'Ковалев Сергей Сергеевич', CAST(N'2025-03-16T00:00:00.000' AS DateTime), 160, 351)
INSERT [dbo].[Поставщики] ([Номер], [Адрес], [Телефон], [ФИО], [СрокПоставки], [КолвоТоваровПоставки], [НомерСчета]) VALUES (10, N'Волгоград, ул.Мира, д. 10', N'+7442100-00-00', N'Морозов Виктор Викторович', CAST(N'2025-03-16T00:00:00.000' AS DateTime), 190, 25)
GO
INSERT [dbo].[Товары] ([Код], [Название], [КоличествоСклад], [ЕдиницаИзмерения], [Стоимость], [Описание]) VALUES (1, N'Коврик для мыши', 150, N'шт', 250, N'Удобный коврик с нескользящей поверхностью')
INSERT [dbo].[Товары] ([Код], [Название], [КоличествоСклад], [ЕдиницаИзмерения], [Стоимость], [Описание]) VALUES (2, N'Компьютерная мышь', 200, N'шт', 800, N'Эргономичная беспроводная мышь')
INSERT [dbo].[Товары] ([Код], [Название], [КоличествоСклад], [ЕдиницаИзмерения], [Стоимость], [Описание]) VALUES (3, N'Клавиатура', 100, N'шт', 1200, N'Механическая клавиатура с подсветкой')
INSERT [dbo].[Товары] ([Код], [Название], [КоличествоСклад], [ЕдиницаИзмерения], [Стоимость], [Описание]) VALUES (4, N'Монитор', 50, N'шт', 15000, N'27-дюймовый IPS монитор с высоким разрешением')
INSERT [dbo].[Товары] ([Код], [Название], [КоличествоСклад], [ЕдиницаИзмерения], [Стоимость], [Описание]) VALUES (5, N'Инструмент', 40, N'шт', 600, N'Удобные инструменты для монтажа')
GO
ALTER TABLE [dbo].[База]  WITH CHECK ADD  CONSTRAINT [FK_База_Поставщики] FOREIGN KEY([НомерПоставщика])
REFERENCES [dbo].[Поставщики] ([Номер])
GO
ALTER TABLE [dbo].[База] CHECK CONSTRAINT [FK_База_Поставщики]
GO
ALTER TABLE [dbo].[База]  WITH CHECK ADD  CONSTRAINT [FK_База_Товары] FOREIGN KEY([КодТовара])
REFERENCES [dbo].[Товары] ([Код])
GO
ALTER TABLE [dbo].[База] CHECK CONSTRAINT [FK_База_Товары]
GO
USE [master]
GO
ALTER DATABASE [ОптоваяБаза] SET  READ_WRITE 
GO
