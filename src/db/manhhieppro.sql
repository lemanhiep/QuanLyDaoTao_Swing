USE [master]
GO
/****** Object:  Database [Polypro]    Script Date: 28/02/2020 5:31:40 CH ******/
CREATE DATABASE [Polypro]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Polypro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Polypro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Polypro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Polypro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Polypro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Polypro] SET ARITHABORT OFF 
GO
ALTER DATABASE [Polypro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Polypro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Polypro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Polypro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Polypro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Polypro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Polypro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Polypro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Polypro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Polypro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Polypro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Polypro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Polypro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Polypro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Polypro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Polypro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Polypro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Polypro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Polypro] SET  MULTI_USER 
GO
ALTER DATABASE [Polypro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Polypro] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Polypro', N'ON'
GO
USE [Polypro]
GO
/****** Object:  Table [dbo].[ChuyenDe]    Script Date: 28/02/2020 5:31:40 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenDe](
	[MaCD] [nchar](5) NOT NULL,
	[TenCD] [nvarchar](50) NOT NULL,
	[HocPhi] [float] NOT NULL CONSTRAINT [DF_ChuyenDe_HocPhi]  DEFAULT ((0)),
	[ThoiLuong] [int] NOT NULL CONSTRAINT [DF_ChuyenDe_ThoiLuong]  DEFAULT ((30)),
	[Hinh] [nvarchar](50) NOT NULL CONSTRAINT [DF_ChuyenDe_Hinh]  DEFAULT (N'chuyen-de.png'),
	[MoTa] [nvarchar](255) NOT NULL CONSTRAINT [DF_ChuyenDe_MoTa]  DEFAULT (''),
 CONSTRAINT [PK_ChuyenDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocVien]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVien](
	[MaHV] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaNH] [nchar](7) NOT NULL,
	[Diem] [float] NOT NULL CONSTRAINT [DF_HocVien_Diem]  DEFAULT ((0)),
 CONSTRAINT [PK_HocVien] PRIMARY KEY CLUSTERED 
(
	[MaHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[MaCD] [nchar](5) NOT NULL,
	[HocPhi] [float] NOT NULL CONSTRAINT [DF_KhoaHoc_HocPhi]  DEFAULT ((0)),
	[ThoiLuong] [int] NOT NULL CONSTRAINT [DF_KhoaHoc_ThoiLuong]  DEFAULT ((0)),
	[NgayKG] [date] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayTao] [date] NOT NULL CONSTRAINT [DF_KhoaHoc_NgayTao]  DEFAULT (getdate()),
 CONSTRAINT [PK_KhoaHoc] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiHoc]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiHoc](
	[MaNH] [nchar](7) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL CONSTRAINT [DF_NguoiHoc_GioiTinh]  DEFAULT ((0)),
	[DienThoai] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[NgayDK] [date] NOT NULL CONSTRAINT [DF_NguoiHoc_NgayDK]  DEFAULT (getdate()),
 CONSTRAINT [PK_NguoiHoc] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[VaiTro] [bit] NOT NULL CONSTRAINT [DF_QuanTri_VaiTro]  DEFAULT ((0)),
 CONSTRAINT [PK_QuanTri] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'CD007', N'lập trình PHP như JameBorn', 400.4, 10, N'heineken_1.jpg', N'Lập trình nhanh gọn sạch, lập phát chết luôn')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'CD009', N'Lập trình điện toán đám mây', 10, 10, N'hoi thoai.PNG', N'Lập trình kết hợp điện toán đám mây')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'CDNEW', N'Chuyên đề đầu tiên của tôi', 9790, 10, N'Capture.PNG', N'đây là chuyên đề đầu tiên sau khi phần mềm được xuất bản, nó là 1 kỉ niệm')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'HH005', N'Java là easy', 50, 40, N'oracle-java-696x522.png', N'Chuyên đề chán lắm tốt nhất ko nên  học')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAC05', N'Lập trình pascal', 330.5, 40, N'JABS.png', N'Lập trình pascal')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV01', N'Lập trình Java cơ bản', 300, 90, N'GAME.png', N'JAV01 - Lập trình Java cơ bản')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV02', N'Lập trình Java nâng cao', 300, 90, N'HTCS.jpg', N'JAV02 - Lập trình Java nâng cao')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV03', N'Lập trình mạng với Java', 200, 70, N'INMA.jpg', N'JAV03 - Lập trình mạng với Java')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'JAV04', N'Lập trình desktop với Swing', 200, 70, N'LAYO.jpg', N'JAV04 - Lập trình desktop với Swing')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'KK123', N'Tập làm sạch code', 12, 5, N'heineken_1.jpg', N'Học cách làm sạch code với Ô Mô')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'KK133', N'Lập trình lình tình phình', 10, 10, N'212.PNG', N'chuyên đề linh tinh')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'LT123', N'Lập trình dành cho bé', 450, 200, N'ADTE.jpg', N'Khóa học lập trình dành cho các bé tuổi từ 3 -30')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'MM123', N'Lập trình tool DDOS đánh sập mạng trường', 450, 50, N'âsasas.PNG', N'sạo ke vậy thôi lập trình sao đc hihi...')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PAA00', N'Lập  trình hướng lên trời', 0, 0, N'maxresdefault.jpg', N'Lập trình kết hợp lái máy bay')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PAS01', N'Lập trình Pascal cùng Bill Gate', 150.1, 3000, N'maxresdefault.jpg', N'Kết hợp học mà chơi, cam kết biết ghõ phím sau 3 tháng.')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PPX09', N'Lập trình bằng powerpoint', 50, 50, N'maxresdefault.jpg', N'lập trình băng powerpoint đang là xu hướng trong thời đại 4.0')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO01', N'Dự án với công nghệ MS.NET MVC', 300, 90, N'MOWE.png', N'PRO01 - Dự án với công nghệ MS.NET MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO02', N'Dự án với công nghệ Spring MVC', 300, 90, N'Subject.png', N'PRO02 - Dự án với công nghệ Spring MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO03', N'Dự án với công nghệ Servlet/JSP', 300, 90, N'GAME.png', N'PRO03 - Dự án với công nghệ Servlet/JSP')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO04', N'Dự án với AngularJS & WebAPI', 300, 90, N'HTCS.jpg', N'PRO04 - Dự án với AngularJS & WebAPI')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO05', N'Dự án với Swing & JDBC', 300, 90, N'ngu phap.PNG', N'PRO05 - Dự án với Swing & JDBC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO06', N'Dự án với WindowForm', 300, 90, N'LAYO.jpg', N'PRO06 - Dự án với WindowForm')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'PRO08', N'Lập trình theo cách của bạn', 1000, 190, N'viet bai topic 2.PNG', N'Chuyên đề rất chán ko nên học')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'RDB01', N'Cơ sở dữ liệu SQL Server', 100, 50, N'MOWE.png', N'RDB01 - Cơ sở dữ liệu SQL Server')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'RDB02', N'Lập trình JDBC', 150, 60, N'Subject.png', N'RDB02 - Lập trình JDBC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'RDB03', N'Lập trình cơ sở dữ liệu Hibernate', 250, 80, N'GAME.png', N'RDB03 - Lập trình cơ sở dữ liệu Hibernate')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'Ruby1', N'Học ruby căn bản', 10, 10, N'ngu phap.PNG', N'Học ruby')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER01', N'Lập trình web với Servlet/JSP', 350, 100, N'HTCS.jpg', N'SER01 - Lập trình web với Servlet/JSP')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER02', N'Lập trình Spring MVC', 400, 110, N'INMA.jpg', N'SER02 - Lập trình Spring MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER03', N'Lập trình MS.NET MVC', 400, 110, N'LAYO.jpg', N'SER03 - Lập trình MS.NET MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'SER04', N'Xây dựng Web API với Spring MVC & ASP.NET MVC', 200, 70, N'MOWE.png', N'SER04 - Xây dựng Web API với Spring MVC & ASP.NET MVC')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'TT012', N'Phương pháp copy code của người khác', 10000, 10, N'tinh tu.PNG', N'Chuyên đề cực kì hiếm, chỉ có ở đây mới có')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB01', N'Thiết kế web với HTML và CSS', 200, 70, N'Subject.png', N'WEB01 - Thiết kế web với HTML và CSS')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB02', N'Thiết kế web với Bootstrap', 0, 40, N'GAME.png', N'WEB02 - Thiết kế web với Bootstrap')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB03', N'Lập trình front-end với JavaScript và jQuery', 150, 60, N'HTCS.jpg', N'WEB03 - Lập trình front-end với JavaScript và jQuery')
INSERT [dbo].[ChuyenDe] ([MaCD], [TenCD], [HocPhi], [ThoiLuong], [Hinh], [MoTa]) VALUES (N'WEB04', N'Lập trình AngularJS', 250, 80, N'INMA.jpg', N'WEB04 - Lập trình AngularJS')
SET IDENTITY_INSERT [dbo].[HocVien] ON 

INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (1, 2, N'PS01638', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (2, 2, N'PS02037', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (3, 2, N'PS02771', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (5, 2, N'PS02930', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (7, 2, N'PS02983', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (8, 2, N'PS02988', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (11, 3, N'PS01638', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (12, 3, N'PS02037', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (13, 3, N'PS02771', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (14, 3, N'PS02867', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (15, 3, N'PS02930', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (16, 1, N'PS01638', 8)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (17, 1, N'PS02037', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (19, 1, N'PS02867', 3)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (20, 1, N'PS02930', 7)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (33, 1, N'PS02771', 8)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (34, 1, N'PS02979', 4)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (35, 1, N'PS02983', 6)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (36, 1, N'PS02988', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (37, 1, N'PS03031', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (38, 1, N'PS03046', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (39, 1, N'PS03080', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (40, 1, N'PS03088', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (41, 1, N'PS03096', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (42, 1, N'PS03104', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (43, 1, N'PS03120', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (44, 1, N'PS03130', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (49, 7, N'PS02771', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (50, 4, N'PH09198', 5.5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (56, 4, N'PS02979', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (62, 6, N'PH09198', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (63, 6, N'PS01638', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (64, 6, N'PS02037', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (65, 6, N'PS02771', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (66, 6, N'PS02867', 6)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (67, 4, N'PH09222', 6.5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (68, 7, N'PH09198', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (69, 7, N'PH09222', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (70, 7, N'PH09334', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (71, 7, N'PH09456', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (72, 7, N'PS01638', 9)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (73, 7, N'PS02037', 7)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (75, 11, N'PH09222', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (76, 11, N'PH09334', 10)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (77, 11, N'PH09456', 6)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (78, 9, N'PH09198', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (79, 9, N'PH09201', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (80, 9, N'PH09202', 10)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (81, 9, N'PH09222', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (82, 7, N'PH09201', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (83, 7, N'PH09202', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (84, 7, N'PH09245', 5)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (85, 4, N'PH09201', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (86, 4, N'PH09202', -1)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (87, 4, N'PH09245', 6)
INSERT [dbo].[HocVien] ([MaHV], [MaKH], [MaNH], [Diem]) VALUES (88, 4, N'PH09334', 5)
SET IDENTITY_INSERT [dbo].[HocVien] OFF
SET IDENTITY_INSERT [dbo].[KhoaHoc] ON 

INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (1, N'PRO02', 300, 90, CAST(N'2018-01-10' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (2, N'PRO03', 300, 90, CAST(N'2018-01-10' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (3, N'JAV01', 100, 50, CAST(N'2018-01-10' AS Date), N'', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (4, N'PAS01', 150.1, 3000, CAST(N'2018-01-10' AS Date), N'khóa học cực kì đáng đồng tiền bát gạo', N'TeoNV', CAST(N'2017-12-31' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (5, N'JAV02', 300, 90, CAST(N'2020-03-27' AS Date), N'', N'TeoNV', CAST(N'2020-02-26' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (6, N'PAA00', 0, 0, CAST(N'2020-03-27' AS Date), N'Khóa học cực kì hay vừa mới tạo.', N'TeoNV', CAST(N'2020-02-26' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (7, N'PAS01', 150.1, 3000, CAST(N'2021-02-19' AS Date), N'', N'TeoNV', CAST(N'2020-02-26' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (8, N'JAV01', 300, 90, CAST(N'2021-02-02' AS Date), N'', N'TeoNV', CAST(N'2020-02-26' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (9, N'PAA00', 0, 0, CAST(N'2020-03-28' AS Date), N'Khóa học cam kết biết lập trình jav sau 3 tháng.', N'ducnv', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (10, N'PAS01', 0, 0, CAST(N'2020-03-28' AS Date), N'khóa học rất hay nha mọi người', N'TeoNV', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[KhoaHoc] ([MaKH], [MaCD], [HocPhi], [ThoiLuong], [NgayKG], [GhiChu], [MaNV], [NgayTao]) VALUES (11, N'KK123', 12, 5, CAST(N'2020-03-10' AS Date), N'Khóa học rất vui và an toàn.', N'TeoNV', CAST(N'2020-02-27' AS Date))
SET IDENTITY_INSERT [dbo].[KhoaHoc] OFF
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09198', N'Nguyễn Đình Tiến', CAST(N'2015-12-12' AS Date), 1, N'0987355167', N'tiennd@gmail.com.vn', N'', N'TeoNV', CAST(N'2020-02-26' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09201', N'Lee Min Ho', CAST(N'1987-02-27' AS Date), 1, N'0985344567', N'lee@gmai.com', N'Bạn này hát rất hay.', N'TeoNV', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09202', N'Jun Pi Ô', CAST(N'1999-02-27' AS Date), 1, N'0984556234', N'pio@gmail.com', N'bạn này nhà rất giầu', N'TeoNV', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09222', N'NGUYỄN THANH HIỆP', CAST(N'1999-04-04' AS Date), 1, N'0986233139', N'abc@gmail.com', N'HIỆP bắt cá 2 tay', N'TeoNV', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09234', N'Giàng A Páo', CAST(N'2000-02-28' AS Date), 1, N'0987333125', N'paoKoNgao@gmail.com', N'Páo - dân tôc ê đê', N'ducpro', CAST(N'2020-02-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09245', N'Trần Thị Loan', CAST(N'2000-02-28' AS Date), 0, N'0331234567', N'Loantt@gmail.com', N'Bạn này hơi béo nhưng rất tốt bụng...', N'ducnv', CAST(N'2020-02-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09334', N'PHẠM THỊ NỤ', CAST(N'2003-02-27' AS Date), 0, N'0983344239', N'adss@gmail.com', N'BẠN NÀY HỌC RẤT GIỎI', N'TeoNV', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH09456', N'NGUYỄN VĂN ĐỨC', CAST(N'2000-02-27' AS Date), 1, N'0347648472', N'SD9@GMAIL.COM', N'BẠN NÀY CỰC KÌ NGU', N'TeoNV', CAST(N'2020-02-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PH12398', N'Nguyện Thị Hiếu', CAST(N'1990-02-28' AS Date), 0, N'0987344234', N'dasda@gmail.com', N'', N'ducnv', CAST(N'2020-02-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS01638', N'LỮ HUY CƯỜNG', CAST(N'1991-05-08' AS Date), 1, N'0928768265', N'PS01638@fpt.edu.vn', N'0928768265 - LỮ HUY CƯỜNG', N'PheoNC', CAST(N'1991-05-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02037', N'ĐỖ VĂN MINH', CAST(N'1997-10-24' AS Date), 1, N'0968095685', N'PS02037@fpt.edu.vn', N'0968095685 - ĐỖ VĂN MINH', N'TeoNV', CAST(N'1992-10-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02771', N'NGUYỄN TẤN HIẾU', CAST(N'1998-09-15' AS Date), 1, N'0927594734', N'PS02771@fpt.edu.vn', N'0927594734 - NGUYỄN TẤN HIẾU', N'PheoNC', CAST(N'1998-09-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02867', N'NGUYỄN HỮU TRÍ', CAST(N'1997-10-27' AS Date), 1, N'0946984711', N'PS02867@fpt.edu.vn', N'0946984711 - NGUYỄN HỮU TRÍ', N'TeoNV', CAST(N'1997-10-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02930', N'TRẦN VĂN NAM', CAST(N'2000-06-03' AS Date), 1, N'0924774498', N'PS02930@fpt.edu.vn', N'0924774498 - TRẦN VĂN NAM', N'TeoNV', CAST(N'2000-06-03' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02979', N'ĐOÀN TRẦN NHẬT VŨ', CAST(N'1994-08-28' AS Date), 1, N'0912374818', N'PS02979@fpt.edu.vn', N'0912374818 - ĐOÀN TRẦN NHẬT VŨ', N'TeoNV', CAST(N'1994-08-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02983', N'NGUYỄN HOÀNG THIÊN PHƯỚC', CAST(N'1993-04-04' AS Date), 1, N'0912499836', N'PS02983@fpt.edu.vn', N'0912499836 - NGUYỄN HOÀNG THIÊN PHƯỚC', N'PheoNC', CAST(N'1993-04-04' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS02988', N'HỒ HỮU HẬU', CAST(N'1993-02-08' AS Date), 1, N'0924984876', N'PS02988@fpt.edu.vn', N'0924984876 - HỒ HỮU HẬU', N'PheoNC', CAST(N'1993-02-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03031', N'PHAN TẤN VIỆT', CAST(N'1990-04-05' AS Date), 1, N'0924832716', N'PS03031@fpt.edu.vn', N'0924832716 - PHAN TẤN VIỆT', N'PheoNC', CAST(N'1990-04-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03046', N'NGUYỄN CAO PHƯỚC', CAST(N'1990-01-28' AS Date), 1, N'0977117727', N'PS03046@fpt.edu.vn', N'0977117727 - NGUYỄN CAO PHƯỚC', N'PheoNC', CAST(N'1990-01-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03080', N'HUỲNH THANH HUY', CAST(N'1994-09-06' AS Date), 1, N'0916436052', N'PS03080@fpt.edu.vn', N'0916436052 - HUỲNH THANH HUY', N'PheoNC', CAST(N'1994-09-06' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03088', N'NGUYỄN HOÀNG TRUNG', CAST(N'1991-09-02' AS Date), 1, N'0938101529', N'PS03088@fpt.edu.vn', N'0938101529 - NGUYỄN HOÀNG TRUNG', N'PheoNC', CAST(N'1991-09-02' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03096', N'ĐOÀN HỮU KHANG', CAST(N'1994-02-21' AS Date), 1, N'0945196719', N'PS03096@fpt.edu.vn', N'0945196719 - ĐOÀN HỮU KHANG', N'PheoNC', CAST(N'1994-02-21' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03104', N'LÊ THÀNH PHƯƠNG', CAST(N'1993-02-21' AS Date), 1, N'0922948096', N'PS03104@fpt.edu.vn', N'0922948096 - LÊ THÀNH PHƯƠNG', N'PheoNC', CAST(N'1993-02-21' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03120', N'PHẠM NGỌC NHẬT TRƯỜNG', CAST(N'1999-06-24' AS Date), 1, N'0994296169', N'PS03120@fpt.edu.vn', N'0994296169 - PHẠM NGỌC NHẬT TRƯỜNG', N'PheoNC', CAST(N'1999-06-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03130', N'ĐẶNG BẢO VIỆT', CAST(N'1990-02-14' AS Date), 1, N'0917749344', N'PS03130@fpt.edu.vn', N'0917749344 - ĐẶNG BẢO VIỆT', N'PheoNC', CAST(N'1990-02-14' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03134', N'LÊ DUY BẢO', CAST(N'1996-08-08' AS Date), 1, N'0926714368', N'PS03134@fpt.edu.vn', N'0926714368 - LÊ DUY BẢO', N'PheoNC', CAST(N'1996-08-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03172', N'NGUYỄN ANH TUẤN', CAST(N'1992-02-15' AS Date), 1, N'0920020472', N'PS03172@fpt.edu.vn', N'0920020472 - NGUYỄN ANH TUẤN', N'PheoNC', CAST(N'1992-02-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03202', N'PHAN QUỐC QUI', CAST(N'1996-02-04' AS Date), 1, N'0930649274', N'PS03202@fpt.edu.vn', N'0930649274 - PHAN QUỐC QUI', N'PheoNC', CAST(N'1996-02-04' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03203', N'ĐẶNG LÊ QUANG VINH', CAST(N'1990-01-02' AS Date), 1, N'0920197355', N'PS03203@fpt.edu.vn', N'0920197355 - ĐẶNG LÊ QUANG VINH', N'PheoNC', CAST(N'1990-01-02' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03205', N'NGUYỄN MINH SANG', CAST(N'1995-05-02' AS Date), 1, N'0967006218', N'PS03205@fpt.edu.vn', N'0967006218 - NGUYỄN MINH SANG', N'PheoNC', CAST(N'1995-05-02' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03222', N'TRẦM MINH MẪN', CAST(N'1997-02-09' AS Date), 1, N'0911183649', N'PS03222@fpt.edu.vn', N'0911183649 - TRẦM MINH MẪN', N'PheoNC', CAST(N'1997-02-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03230', N'NGUYỄN PHẠM MINH HÂN', CAST(N'2000-10-14' AS Date), 1, N'0983469892', N'PS03230@fpt.edu.vn', N'0983469892 - NGUYỄN PHẠM MINH HÂN', N'PheoNC', CAST(N'2000-10-14' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03233', N'LƯU KIM HOÀNG DUY', CAST(N'1996-07-04' AS Date), 1, N'0938357735', N'PS03233@fpt.edu.vn', N'0938357735 - LƯU KIM HOÀNG DUY', N'PheoNC', CAST(N'1996-07-04' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03251', N'TRẦN QUANG VŨ', CAST(N'2000-03-10' AS Date), 1, N'0914531913', N'PS03251@fpt.edu.vn', N'0914531913 - TRẦN QUANG VŨ', N'PheoNC', CAST(N'2000-03-10' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03304', N'BÙI NGỌC THUẬN', CAST(N'1995-01-26' AS Date), 1, N'0999794115', N'PS03304@fpt.edu.vn', N'0999794115 - BÙI NGỌC THUẬN', N'PheoNC', CAST(N'1995-01-26' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03306', N'HỒ VĂN HÀNH', CAST(N'1992-04-15' AS Date), 1, N'0912277868', N'PS03306@fpt.edu.vn', N'0912277868 - HỒ VĂN HÀNH', N'PheoNC', CAST(N'1992-04-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03308', N'TRẦN VIẾT HÙNG', CAST(N'1999-02-24' AS Date), 1, N'0916050164', N'PS03308@fpt.edu.vn', N'0916050164 - TRẦN VIẾT HÙNG', N'PheoNC', CAST(N'1999-02-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03325', N'NGUYỄN HOÀNG MINH ĐỨC', CAST(N'1996-12-11' AS Date), 1, N'0912234437', N'PS03325@fpt.edu.vn', N'0912234437 - NGUYỄN HOÀNG MINH ĐỨC', N'PheoNC', CAST(N'1996-12-11' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03346', N'PHAN THANH PHONG', CAST(N'1990-01-21' AS Date), 1, N'0937891282', N'PS03346@fpt.edu.vn', N'0937891282 - PHAN THANH PHONG', N'PheoNC', CAST(N'1990-01-21' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03383', N'TRẦN VŨ LUÂN', CAST(N'1998-04-08' AS Date), 1, N'0962030316', N'PS03383@fpt.edu.vn', N'0962030316 - TRẦN VŨ LUÂN', N'PheoNC', CAST(N'1998-04-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03389', N'VŨ ĐỨC TUẤN', CAST(N'1993-02-24' AS Date), 1, N'0911637415', N'PS03389@fpt.edu.vn', N'0911637415 - VŨ ĐỨC TUẤN', N'PheoNC', CAST(N'1993-02-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03410', N'TRẦN  NHẠT', CAST(N'1992-06-08' AS Date), 1, N'0946219377', N'PS03410@fpt.edu.vn', N'0946219377 - TRẦN  NHẠT', N'PheoNC', CAST(N'1992-06-08' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03411', N'TRƯƠNG THÀNH ĐẠT', CAST(N'1993-11-05' AS Date), 1, N'0991509408', N'PS03411@fpt.edu.vn', N'0991509408 - TRƯƠNG THÀNH ĐẠT', N'PheoNC', CAST(N'1993-11-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03425', N'TÔ VĂN NĂNG', CAST(N'1992-07-28' AS Date), 1, N'0915134551', N'PS03425@fpt.edu.vn', N'0915134551 - TÔ VĂN NĂNG', N'PheoNC', CAST(N'1992-07-28' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03454', N'NGUYỄN NHẬT VĨNH', CAST(N'1999-07-09' AS Date), 1, N'0917886371', N'PS03454@fpt.edu.vn', N'0917886371 - NGUYỄN NHẬT VĨNH', N'PheoNC', CAST(N'1999-07-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03472', N'NGUYỄN VĂN HUY', CAST(N'1990-01-22' AS Date), 1, N'0960620997', N'PS03472@fpt.edu.vn', N'0960620997 - NGUYỄN VĂN HUY', N'PheoNC', CAST(N'1990-01-22' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03488', N'NGUYỄN NHƯ NGỌC', CAST(N'1995-05-09' AS Date), 0, N'0912880267', N'PS03488@fpt.edu.vn', N'0912880267 - NGUYỄN NHƯ NGỌC', N'PheoNC', CAST(N'1995-05-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03530', N'PHẠM THÀNH TÂM', CAST(N'2000-03-11' AS Date), 1, N'0918161783', N'PS03530@fpt.edu.vn', N'0918161783 - PHẠM THÀNH TÂM', N'PheoNC', CAST(N'2000-03-11' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03553', N'ĐINH TẤN CÔNG', CAST(N'2000-08-15' AS Date), 1, N'0918182551', N'PS03553@fpt.edu.vn', N'0918182551 - ĐINH TẤN CÔNG', N'PheoNC', CAST(N'2000-08-15' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03561', N'LÊ MINH ĐIỀN', CAST(N'1995-01-05' AS Date), 1, N'0948199564', N'PS03561@fpt.edu.vn', N'0948199564 - LÊ MINH ĐIỀN', N'PheoNC', CAST(N'1995-01-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03596', N'NGUYỄN THANH HIỀN', CAST(N'1991-07-09' AS Date), 1, N'0910545901', N'PS03596@fpt.edu.vn', N'0910545901 - NGUYỄN THANH HIỀN', N'PheoNC', CAST(N'1991-07-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03603', N'LÊ PHẠM KIM THANH', CAST(N'1994-08-05' AS Date), 0, N'0924696779', N'PS03603@fpt.edu.vn', N'0924696779 - LÊ PHẠM KIM THANH', N'PheoNC', CAST(N'1994-08-05' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03610', N'TRẦN ĐÌNH TRƯỜNG', CAST(N'1995-01-16' AS Date), 1, N'0941528106', N'PS03610@fpt.edu.vn', N'0941528106 - TRẦN ĐÌNH TRƯỜNG', N'PheoNC', CAST(N'1995-01-16' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03614', N'NGUYỄN VĂN SÁU', CAST(N'1990-04-27' AS Date), 1, N'0940711328', N'PS03614@fpt.edu.vn', N'0940711328 - NGUYỄN VĂN SÁU', N'PheoNC', CAST(N'1990-04-27' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03618', N'PHÍ ĐÌNH VIỆT HÙNG', CAST(N'1996-12-09' AS Date), 1, N'0939020097', N'PS03618@fpt.edu.vn', N'0939020097 - PHÍ ĐÌNH VIỆT HÙNG', N'PheoNC', CAST(N'1996-12-09' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03638', N'PHẠM NHẬT MINH', CAST(N'1997-07-18' AS Date), 1, N'0927771672', N'PS03638@fpt.edu.vn', N'0927771672 - PHẠM NHẬT MINH', N'PheoNC', CAST(N'1997-07-18' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03640', N'LƯU THANH NGỌC', CAST(N'1993-12-01' AS Date), 0, N'0918358164', N'PS03640@fpt.edu.vn', N'0918358164 - LƯU THANH NGỌC', N'PheoNC', CAST(N'1993-12-01' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03662', N'NGUYỄN CAO NGỌC LỢI', CAST(N'1990-04-24' AS Date), 1, N'0930260679', N'PS03662@fpt.edu.vn', N'0930260679 - NGUYỄN CAO NGỌC LỢI', N'PheoNC', CAST(N'1990-04-24' AS Date))
INSERT [dbo].[NguoiHoc] ([MaNH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [Email], [GhiChu], [MaNV], [NgayDK]) VALUES (N'PS03674', N'TRẦN TUẤN ANH', CAST(N'1996-06-11' AS Date), 1, N'0914082094', N'PS03674@fpt.edu.vn', N'0914082094 - TRẦN TUẤN ANH', N'PheoNC', CAST(N'1996-06-11' AS Date))
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'ducnv', N'123', N'Nguyễn Thanh Hiệp', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'ducpro', N'123', N'Nguyễn Minh Đức', 1)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'loantt', N'123', N'Trần thị Loan', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'NoPT', N'123456', N'Phạm Thị Nở', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'PheoNC', N'123456', N'Nguyễn Chí Phèo', 0)
INSERT [dbo].[NhanVien] ([MaNV], [MatKhau], [HoTen], [VaiTro]) VALUES (N'TeoNV', N'123456', N'Nguyễn Văn Tèo', 1)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_HocVien]    Script Date: 28/02/2020 5:31:41 CH ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_HocVien] ON [dbo].[HocVien]
(
	[MaKH] ASC,
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_KhoaHoc] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhoaHoc] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_KhoaHoc]
GO
ALTER TABLE [dbo].[HocVien]  WITH CHECK ADD  CONSTRAINT [FK_HocVien_NguoiHoc] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NguoiHoc] ([MaNH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HocVien] CHECK CONSTRAINT [FK_HocVien_NguoiHoc]
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_KhoaHoc_ChuyenDe] FOREIGN KEY([MaCD])
REFERENCES [dbo].[ChuyenDe] ([MaCD])
GO
ALTER TABLE [dbo].[KhoaHoc] CHECK CONSTRAINT [FK_KhoaHoc_ChuyenDe]
GO
ALTER TABLE [dbo].[KhoaHoc]  WITH CHECK ADD  CONSTRAINT [FK_KhoaHoc_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[KhoaHoc] CHECK CONSTRAINT [FK_KhoaHoc_NhanVien]
GO
ALTER TABLE [dbo].[NguoiHoc]  WITH CHECK ADD  CONSTRAINT [FK_NguoiHoc_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NguoiHoc] CHECK CONSTRAINT [FK_NguoiHoc_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[sp_BangDiem]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_BangDiem](@MaKH INT)
AS BEGIN
	SELECT
		nh.MaNH,
		nh.HoTen,
		hv.Diem
	FROM HocVien hv
		JOIN NguoiHoc nh ON nh.MaNH=hv.MaNH
	WHERE hv.MaKH = @MaKH
	ORDER BY hv.Diem DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeDiem]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThongKeDiem]
AS BEGIN
	SELECT
		TenCD ChuyenDe,
		COUNT(MaHV) SoHV,
		MIN(Diem) ThapNhat,
		MAX(Diem) CaoNhat,
		AVG(Diem) TrungBinh
	FROM KhoaHoc kh
		JOIN HocVien hv ON kh.MaKH=hv.MaKH
		JOIN ChuyenDe cd ON cd.MaCD=kh.MaCD
	GROUP BY TenCD
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeDoanhThu]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThongKeDoanhThu](@Year INT)
AS BEGIN
	SELECT
		TenCD ChuyenDe,
		COUNT(DISTINCT kh.MaKH) SoKH,
		COUNT(hv.MaHV) SoHV,
		SUM(kh.HocPhi) DoanhThu,
		MIN(kh.HocPhi) ThapNhat,
		MAX(kh.HocPhi) CaoNhat,
		AVG(kh.HocPhi) TrungBinh
	FROM KhoaHoc kh
		JOIN HocVien hv ON kh.MaKH=hv.MaKH
		JOIN ChuyenDe cd ON cd.MaCD=kh.MaCD
	WHERE YEAR(NgayKG) = @Year
	GROUP BY TenCD
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ThongKeNguoiHoc]    Script Date: 28/02/2020 5:31:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ThongKeNguoiHoc]
AS BEGIN
	SELECT
		YEAR(NgayDK) Nam,
		COUNT(*) SoLuong,
		MIN(NgayDK) DauTien,
		MAX(NgayDK) CuoiCung
	FROM NguoiHoc
	GROUP BY YEAR(NgayDK)
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chuyên đề, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'MaCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên chuyên đề, Unique' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'TenCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Học phí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'HocPhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thời lượng (ngày)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'ThoiLuong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình logo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'Hinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mô tả chuyên đề' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ChuyenDe', @level2type=N'COLUMN',@level2name=N'MoTa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã học viên, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'MaHV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khóa học, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'MaKH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người học, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'MaNH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Điểm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'HocVien', @level2type=N'COLUMN',@level2name=N'Diem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'MaKH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chuyên đề, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'MaCD'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Học phí' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'HocPhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thời lượng (ngày)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'ThoiLuong'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày khai giảng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'NgayKG'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'GhiChu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người tạo, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'MaNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'KhoaHoc', @level2type=N'COLUMN',@level2name=N'NgayTao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người học, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'MaNH'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'HoTen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'NgaySinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giới tính' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'GioiTinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Điện thoại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'DienThoai'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ghi chú' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'GhiChu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã người tạo, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'MaNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NguoiHoc', @level2type=N'COLUMN',@level2name=N'NgayDK'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã nhân viên, PK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'MaNV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'MatKhau'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'HoTen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vai trò, 1-trưởng phòng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'NhanVien', @level2type=N'COLUMN',@level2name=N'VaiTro'
GO
USE [master]
GO
ALTER DATABASE [Polypro] SET  READ_WRITE 
GO
