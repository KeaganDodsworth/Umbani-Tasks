USE [master]
GO
/****** Object:  Database [MeasurementDatabase]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE DATABASE [MeasurementDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MeasurementDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\MeasurementDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MeasurementDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\MeasurementDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MeasurementDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MeasurementDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MeasurementDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MeasurementDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MeasurementDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MeasurementDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MeasurementDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MeasurementDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MeasurementDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [MeasurementDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MeasurementDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MeasurementDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MeasurementDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MeasurementDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MeasurementDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MeasurementDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [MeasurementDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MeasurementDatabase]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasurementData]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasurementData](
	[MeasurementID] [int] IDENTITY(1,1) NOT NULL,
	[Temperature] [int] NULL,
	[Humidity] [int] NULL,
	[Weight] [decimal](18, 2) NULL,
	[Width] [decimal](18, 2) NULL,
	[Length] [decimal](18, 2) NULL,
	[Depth] [decimal](18, 2) NULL,
	[ProductionLineID] [int] NULL,
	[PassFail] [bit] NULL,
	[TimestampUtc] [datetime] NULL,
	[UserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__Measurem__85599F98F6D5F058] PRIMARY KEY CLUSTERED 
(
	[MeasurementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionLines]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionLines](
	[ProductionLineID] [int] NOT NULL,
	[ProductionLineName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductionLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/17/2024 9:02:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[MeasurementData]  WITH CHECK ADD  CONSTRAINT [FK_MeasurementData_ProductionLines] FOREIGN KEY([ProductionLineID])
REFERENCES [dbo].[ProductionLines] ([ProductionLineID])
GO
ALTER TABLE [dbo].[MeasurementData] CHECK CONSTRAINT [FK_MeasurementData_ProductionLines]
GO
ALTER TABLE [dbo].[MeasurementData]  WITH CHECK ADD  CONSTRAINT [FK_MeasurementData_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MeasurementData] CHECK CONSTRAINT [FK_MeasurementData_UserID]
GO
/****** Object:  StoredProcedure [dbo].[CalculateStats]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateStats]
AS
BEGIN
    SELECT 
        MAX(Temperature) AS MaxTemp,
        MIN(Temperature) AS MinTemp,
        ROUND(VAR(Temperature),2) AS VarianceTemp,
        CAST(AVG(Temperature)AS DECIMAL(18,2)) AS MeanTemp,
        SUM(Temperature) AS TotalTemp, 
        ROUND(STDEV(Temperature),2) AS StandardDeviationTemp,
    
        MAX(Humidity) AS MaxHumidity,
        MIN(Humidity) AS MinHumidity,
        ROUND(VAR(Humidity),2) AS VarianceHumidity,
        CAST(AVG(Humidity)AS DECIMAL(18,2)) AS MeanHumidity,
        SUM(Humidity) AS TotalHumidity, 
        ROUND(STDEV(Humidity),2) AS StandardDeviationHumidity,
    
        MAX([Weight]) AS MaxWeight,
        MIN([Weight]) AS MinWeight,
        ROUND(VAR([Weight]),2) AS VarianceWeight,
        CAST(AVG([Weight])AS DECIMAL(18,2)) AS MeanWeight,
        SUM([Weight]) AS TotalWeight, 
        ROUND(STDEV([Weight]),2) AS StandardDeviationWeight,
    
        MAX(Width) AS MaxWidth,
        MIN(Width) AS MinWidth,
        ROUND(VAR(Width),2) AS VarianceWidth,
        CAST(AVG(Width)AS DECIMAL(18,2)) AS MeanWidth,
        SUM(Width) AS TotalWidth, 
        ROUND(STDEV(Width),2) AS StandardDeviationWidth,
		
		MAX([Length]) AS MaxLength,
        MIN([Length]) AS MinLength,
        ROUND(VAR([Length]),2) AS VarianceLength,
        CAST(AVG([Length])AS DECIMAL(18,2)) AS MeanLength,
        SUM([Length]) AS TotalLength, 
        ROUND(STDEV([Length]),2) AS StandardDeviationLength,

        MAX(Depth) AS MaxDepth,
        MIN(Depth) AS MinDepth,
        ROUND(VAR(Depth),2) AS VarianceDepth,
        CAST(AVG(Depth)AS DECIMAL(18,2)) AS MeanDepth,
        SUM(Depth) AS TotalDepth, 
        ROUND(STDEV(Depth),2) AS StandardDeviationDepth
    FROM 
        MeasurementData;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteMeasurement]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMeasurement]
    @MeasurementID INT
AS
    BEGIN
        DELETE FROM MeasurementData WHERE MeasurementID = @MeasurementID
      
END
GO
/****** Object:  StoredProcedure [dbo].[InsertMeasurement]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMeasurement]
    @Temperature INT,
    @Humidity INT,
    @Weight DECIMAL(18,2),
    @Width DECIMAL(18,2),
    @Length DECIMAL(18,2),
    @Depth DECIMAL(18,2),
    @ProductionLineID INT,
    @PassFail BIT,
    @TimestampUtc DATETIME,
    @UserID NVARCHAR(125)
AS
BEGIN
    INSERT INTO MeasurementData (Temperature, Humidity, Weight, Width, Length, Depth, ProductionLineID, PassFail, TimestampUtc, UserID)
    VALUES (@Temperature, @Humidity, @Weight, @Width, @Length, @Depth, @ProductionLineID, @PassFail, @TimestampUtc, @UserID)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMeasurement]    Script Date: 5/17/2024 9:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateMeasurement]
	@MeasurementID INT,
    @Temperature INT,
    @Humidity INT,
    @Weight DECIMAL(18,2),
    @Width DECIMAL(18,2),
    @Length DECIMAL(18,2),
    @Depth DECIMAL(18,2),
    @ProductionLineID INT,
    @PassFail BIT,
    @TimestampUtc DATETIME,
    @UserID NVARCHAR(125)
AS
BEGIN
UPDATE [dbo].[MeasurementData]
   SET [Temperature] = @Temperature
      ,[Humidity] = @Humidity
      ,[Weight] = @Weight
      ,[Width] = @Width
      ,[Length] = @Length
      ,[Depth] = @Depth
      ,[ProductionLineID] = @ProductionLineID
      ,[PassFail] = @PassFail
      ,[TimestampUtc] = @TimestampUtc
      ,[UserID] = @UserID
 WHERE @MeasurementID = [MeasurementID]
 END;
GO
USE [master]
GO
ALTER DATABASE [MeasurementDatabase] SET  READ_WRITE 
GO
