USE [master]
GO
/****** Object:  Database [DCMS_ISP391]    Script Date: 7/24/2023 1:14:47 PM ******/
CREATE DATABASE [DCMS_ISP391]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DCMS_ISP391', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DCMS_ISP391.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DCMS_ISP391log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DCMS_ISP391_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DCMS_ISP391] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DCMS_ISP391].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DCMS_ISP391] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET ARITHABORT OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DCMS_ISP391] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DCMS_ISP391] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DCMS_ISP391] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DCMS_ISP391] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET RECOVERY FULL 
GO
ALTER DATABASE [DCMS_ISP391] SET  MULTI_USER 
GO
ALTER DATABASE [DCMS_ISP391] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DCMS_ISP391] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DCMS_ISP391] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DCMS_ISP391] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DCMS_ISP391] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DCMS_ISP391] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DCMS_ISP391', N'ON'
GO
ALTER DATABASE [DCMS_ISP391] SET QUERY_STORE = OFF
GO
USE [DCMS_ISP391]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 7/24/2023 1:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[id] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[start_time] [time](0) NOT NULL,
	[end_time] [time](0) NOT NULL,
	[employee_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[tooth_number] [int] NOT NULL,
	[ap_status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_service]    Script Date: 7/24/2023 1:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_service_name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[image] [varchar](max) NULL,
	[cost] [numeric](4, 0) NOT NULL,
 CONSTRAINT [PK_Category_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Examination_Result]    Script Date: 7/24/2023 1:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examination_Result](
	[id] [varchar](50) NOT NULL,
	[ap_id] [varchar](50) NOT NULL,
	[reason] [nvarchar](100) NULL,
	[note] [nvarchar](500) NULL,
 CONSTRAINT [PK_Examination_Result] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 7/24/2023 1:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[id] [varchar](50) NOT NULL,
	[material_name] [nvarchar](100) NOT NULL,
	[unit] [nvarchar](50) NOT NULL,
	[amount] [int] NOT NULL,
	[date] [date] NOT NULL,
	[note] [varchar](50) NOT NULL,
	[ER_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/24/2023 1:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[Role] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_account]    Script Date: 7/24/2023 1:14:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_account](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](11) NULL,
	[dob] [date] NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_User_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Appointment] ([id], [date], [start_time], [end_time], [employee_id], [patient_id], [service_id], [tooth_number], [ap_status]) VALUES (N'1', CAST(N'2023-07-18' AS Date), CAST(N'09:43:00' AS Time), CAST(N'11:43:00' AS Time), 123460, 123464, 6, 11, N'Pending')
INSERT [dbo].[Appointment] ([id], [date], [start_time], [end_time], [employee_id], [patient_id], [service_id], [tooth_number], [ap_status]) VALUES (N'2', CAST(N'2023-07-19' AS Date), CAST(N'14:51:00' AS Time), CAST(N'15:51:00' AS Time), 333333333, 222222222, 4, 3, N'Approved')
INSERT [dbo].[Appointment] ([id], [date], [start_time], [end_time], [employee_id], [patient_id], [service_id], [tooth_number], [ap_status]) VALUES (N'3', CAST(N'2023-07-23' AS Date), CAST(N'07:03:00' AS Time), CAST(N'07:05:00' AS Time), 333333333, 222222222, 6, 32, N'Approved')
INSERT [dbo].[Appointment] ([id], [date], [start_time], [end_time], [employee_id], [patient_id], [service_id], [tooth_number], [ap_status]) VALUES (N'4', CAST(N'2023-07-25' AS Date), CAST(N'11:59:00' AS Time), CAST(N'15:01:00' AS Time), 123457, 111111111, 4, 3, N'Pending')
INSERT [dbo].[Appointment] ([id], [date], [start_time], [end_time], [employee_id], [patient_id], [service_id], [tooth_number], [ap_status]) VALUES (N'5', CAST(N'2023-07-26' AS Date), CAST(N'13:02:00' AS Time), CAST(N'15:01:00' AS Time), 123457, 111111111, 4, 32, N'Canceled')
GO
SET IDENTITY_INSERT [dbo].[Category_service] ON 

INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (4, N'Gum Disease Treatment', N'Procedures aimed at treating and managing gum disease, such as scaling and root planing, medication, and, in severe cases, surgery, to remove infection, reduce inflammation, and restore gum health.', N'https://d1l9wtg77iuzz5.cloudfront.net/assets/5501/251891/original.jpg?1545344816', CAST(50 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (6, N'Dental Fillings', N'Dental Fillings: Restorative procedure where decayed or damaged tooth structure is removed and replaced with a dental material to restore its form, function, and strength', N'https://fusioncentre.co.ke/wp-content/uploads/2020/12/dental-fillings.jpg', CAST(25 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (7, N'Routine Dental Exams', N'Routine Dental Exams: Regular check-ups by a dentist to assess oral health, detect dental issues early, and prevent potential problems.', N'https://www.ddadental.com/wp-content/uploads/dental-exam.jpg', CAST(30 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (8, N'Teeth Cleaning', N'Teeth Cleaning: Professional oral hygiene procedure for plaque and tartar removal', N'https://post.healthline.com/wp-content/uploads/2020/08/dental-oral-health-what-happens-during-a-tooth-cleaning_thumb.jpg', CAST(20 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (9, N'Orthodontic Braces', N'Straighten misaligned teeth and improve your oral health with our advanced orthodontic braces. Our expert orthodontists will guide you through a personalized treatment plan, helping you achieve a beautiful and confident smile you''ll love to show off!"', N'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/picture/2017/9/shutterstock_572412436.jpg', CAST(3000 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (1009, N'Dental Implants', N'Dental implants are artificial tooth roots surgically placed in the jawbone to support replacement teeth. They are a long-lasting and natural-looking solution for missing teeth.', N'https://www.yourdentistryguide.com/wp-content/uploads/2017/11/implants-vs-min.jpg', CAST(300 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (1010, N'Root Canal Treatment', N'Root canal therapy is performed to save an infected or severely decayed tooth. The procedure involves removing the infected pulp, cleaning the canal, and sealing it with a filling material.', N'https://smileandmove.co.uk/wp-content/uploads/2022/03/root-canal-treatment-thumb.jpg', CAST(800 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (1011, N'Dental Crowns', N'Dental crowns are custom-made caps that cover damaged or weakened teeth, restoring their shape, strength, and appearance. They are a durable solution for severely decayed or broken teeth.', N'https://my.clevelandclinic.org/-/scassets/images/org/health/articles/10923-dental-crowns', CAST(1500 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (1012, N'Dental X-Rays', N'Dental X-rays are essential for diagnosing hidden dental issues such as cavities, bone loss, and impacted teeth, helping your dentist create a more accurate treatment plan.', N'https://www.cignodental.com/wp-content/uploads/2021/03/are_dental_x_rays_safe_greenfield_wi.jpeg', CAST(50 AS Numeric(4, 0)))
INSERT [dbo].[Category_service] ([id], [category_service_name], [description], [image], [cost]) VALUES (1013, N'Teeth Whitening', N'This service involves the application of safe and effective teeth whitening agents to remove stains and discoloration, giving you a brighter and more radiant smile.', N'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/picture/2021/4/shutterstock_56198956.jpg', CAST(150 AS Numeric(4, 0)))
SET IDENTITY_INSERT [dbo].[Category_service] OFF
GO
INSERT [dbo].[Examination_Result] ([id], [ap_id], [reason], [note]) VALUES (N'er1', N'2', N'Răng nhiều mảng bám', N'- Lấy cao răng
- Tẩy trắng răng')
INSERT [dbo].[Examination_Result] ([id], [ap_id], [reason], [note]) VALUES (N'er2', N'3', N'Răng sâu', N'- Hàn răng số 32')
GO
INSERT [dbo].[Prescription] ([id], [material_name], [unit], [amount], [date], [note], [ER_id]) VALUES (N'pre2', N'kháng sinh', N'pakage', 3, CAST(N'2023-07-24' AS Date), N'1 Pill/Dinner', N'er2')
INSERT [dbo].[Prescription] ([id], [material_name], [unit], [amount], [date], [note], [ER_id]) VALUES (N'pre3', N'Thuốc giảm đau', N'pakage', 3, CAST(N'2023-07-24' AS Date), N'1 Pill/day', N'er1')
GO
INSERT [dbo].[Role] ([id], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [Role]) VALUES (2, N'Doctor')
INSERT [dbo].[Role] ([id], [Role]) VALUES (3, N'Patient')
GO
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123457, N'doctor2', N'123', N'Doctor Cường', N'cuong@gmail.com', 1, N'FPT', N'912345679', CAST(N'2003-11-10' AS Date), 2)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123458, N'doctor3', N'123', N'Doctor Nguyên', N'nguyen@gmail.com', 1, N'FPT', N'912345680', CAST(N'2003-11-11' AS Date), 2)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123459, N'doctor4', N'123', N'Doctor Bình', N'binh@gmail.com', 0, N'FPT', N'912345681', CAST(N'2003-11-12' AS Date), 2)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123460, N'doctor5', N'1', N'Doctor Linh', N'linh@gmail.com', 0, N'Duong5', N'912345682', CAST(N'2003-11-13' AS Date), 2)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123464, N'KienBruh2', N'1', N'Kien2', N'kien2@gmail.com', 1, N'Duong9', N'912345686', CAST(N'2003-11-17' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123465, N'CuongBruh2', N'1', N'Cuong2', N'cuong2@gmail.com', 1, N'Duong10', N'912345687', CAST(N'2003-11-18' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123466, N'NguyenBruh2', N'1', N'Nguyen2', N'nguyen2@gmail.com', 1, N'Duong11', N'912345688', CAST(N'2003-11-19' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123467, N'BinhBruh2', N'1', N'Binh2', N'binh2@gmail.com', 1, N'Duong12', N'912345689', CAST(N'2003-11-20' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123468, N'KienBruh3', N'1', N'Kien3', N'kien3@gmail.com', 1, N'Duong13', N'912345690', CAST(N'2003-11-21' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123469, N'CuongBruh3', N'1', N'Cuong3', N'cuong3@gmail.com', 1, N'Duong14', N'912345691', CAST(N'2003-11-22' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123470, N'NguyenBruh3', N'1', N'Nguyen3', N'nguyen3@gmail.com', 1, N'Duong15', N'912345692', CAST(N'2003-11-23' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123471, N'BinhBruh3', N'1', N'Binh3', N'binh3@gmail.com', 1, N'Duong16', N'912345693', CAST(N'2003-11-24' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123472, N'KienBruh4', N'1', N'Kien4', N'kien4@gmail.com', 1, N'Duong17', N'912345694', CAST(N'2003-11-25' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123473, N'CuongBruh4', N'1', N'Cuong4', N'cuong4@gmail.com', 1, N'Duong18', N'912345695', CAST(N'2003-11-26' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123474, N'NguyenBruh4', N'1', N'Nguyen4', N'nguyen4@gmail.com', 1, N'Duong19', N'912345696', CAST(N'2003-11-27' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (123475, N'BinhBruh4', N'1', N'Binh4', N'binh4@gmail.com', 1, N'Duong20', N'912345697', CAST(N'2003-11-28' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (111111111, N'admin', N'123', N'Admin', N'admin@gmail.com', 1, N'FPT', N'123456789', CAST(N'2002-11-24' AS Date), 1)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (131313131, N'nguyen2412', N'Nguyenvu2411@', N'Vũ Hải Nguyên', N'nguyen@gmail.com', 1, N'FPT', N'1234567890', CAST(N'1996-09-19' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (222222222, N'patient', N'123', N'Vũ Hải Nguyên', N'nguyenvu2411@gmail.com', 1, N'FPT', N'0947501816', CAST(N'2002-11-24' AS Date), 3)
INSERT [dbo].[User_account] ([id], [username], [password], [fullname], [email], [gender], [address], [phone], [dob], [role_id]) VALUES (333333333, N'doctor', N'123', N'Doctor Kiên', N'kien@gmail.com', 1, N'FPT', N'912345678', CAST(N'2003-11-09' AS Date), 2)
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Category_service] FOREIGN KEY([service_id])
REFERENCES [dbo].[Category_service] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Category_service]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User_account] FOREIGN KEY([employee_id])
REFERENCES [dbo].[User_account] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User_account]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User_account1] FOREIGN KEY([patient_id])
REFERENCES [dbo].[User_account] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User_account1]
GO
ALTER TABLE [dbo].[Examination_Result]  WITH CHECK ADD  CONSTRAINT [FK_Examination_Result_Appointment1] FOREIGN KEY([ap_id])
REFERENCES [dbo].[Appointment] ([id])
GO
ALTER TABLE [dbo].[Examination_Result] CHECK CONSTRAINT [FK_Examination_Result_Appointment1]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Examination_Result1] FOREIGN KEY([ER_id])
REFERENCES [dbo].[Examination_Result] ([id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Examination_Result1]
GO
ALTER TABLE [dbo].[User_account]  WITH CHECK ADD  CONSTRAINT [FK_User_account_Role] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[User_account] CHECK CONSTRAINT [FK_User_account_Role]
GO
ALTER TABLE [dbo].[Category_service]  WITH CHECK ADD  CONSTRAINT [CK__Category_s__cost__267ABA7A] CHECK  (([cost]>(0)))
GO
ALTER TABLE [dbo].[Category_service] CHECK CONSTRAINT [CK__Category_s__cost__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [DCMS_ISP391] SET  READ_WRITE 
GO
