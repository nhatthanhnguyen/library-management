USE [master]
GO
/****** Object:  Database [library_management]    Script Date: 1/10/2022 4:10:03 PM ******/
CREATE DATABASE [library_management]
GO
ALTER DATABASE [library_management] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [library_management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [library_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library_management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [library_management] SET  MULTI_USER 
GO
ALTER DATABASE [library_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library_management] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [library_management] SET DELAYED_DURABILITY = DISABLED 
GO
USE [library_management]
GO
/****** Object:  Table [dbo].[DANHMUCSACH]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUCSACH](
	[MaDanhMucSach] [nvarchar](25) NOT NULL,
	[ISBN] [nvarchar](20) NOT NULL,
	[TrangThai] [tinyint] NOT NULL,
 CONSTRAINT [PK_DANHMUCSACH] PRIMARY KEY CLUSTERED 
(
	[MaDanhMucSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DAUSACH]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAUSACH](
	[ISBN] [nvarchar](20) NOT NULL,
	[TenDauSach] [nvarchar](50) NOT NULL,
	[TenLoaiSach] [nvarchar](50) NOT NULL,
	[TacGia] [nvarchar](50) NOT NULL,
	[NhaXuatBan] [nvarchar](50) NOT NULL,
	[NamXuatBan] [smallint] NOT NULL,
 CONSTRAINT [PK_DAUSACH] PRIMARY KEY CLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DOCGIA]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCGIA](
	[MaDocGia] [int] NOT NULL,
	[Ho] [nvarchar](50) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[SDT] [nvarchar](11) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_DOCGIA] PRIMARY KEY CLUSTERED 
(
	[MaDocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUMUON]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUMUON](
	[MaPhieuMuon] [int] IDENTITY(1,1) NOT NULL,
	[MaDocGia] [int] NOT NULL,
	[MaDanhMucSach] [nvarchar](25) NOT NULL,
	[NgayMuon] [date] NOT NULL,
	[NgayTra] [date] DEFAULT NULL,
	[TrangThai] [tinyint] NOT NULL,
 CONSTRAINT [PK_PHIEUMUON] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THONGTINDANGNHAP]    Script Date: 1/10/2022 4:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THONGTINDANGNHAP](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_THONGTINDANGNHAP] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
INSERT [dbo].[DAUSACH] VALUES
(N'BGCSDLPT', N'Bài Giảng Cơ Sở Dữ Liệu Phân Tán', N'Công nghệ thông tin', N'Tân Hạnh', N'HVCNBCVT', 2010),
(N'LTM', N'Lập Trình Mạng', N'Công nghệ thông tin', N'Nguyễn Mạnh Hùng', N'DHQGTPHCM', 2020),
(N'THCS2', N'Tin Học Cơ Sở 2', N'Công nghệ thông tin', N'Phan Thị Hà', N'HVCNBCVT', 2020),
(N'CKDT', N'Cấu Kiện Điện Tử', N'Điện tử', N'Trần Thúy Hà', N'HVCNBCVT', 2012),
(N'DTS', N'Điện Tử Số', N'Điện tử', N'Nguyễn Hồng Hoa', N'DHQGTPHCM', 2009),
(N'CSDLDT', N'Cơ Sở Đo Lường Điện Tử', N'Điện tử', N'Nguyễn Trung Hiếu', N'HVCNBCVT', 2009),
(N'NMDPT', N'Nhập Môn Đa Phương Tiện', N'Đa phương tiện', N'Trần Quốc Trung', N'HVCNBCVT', 2013),
(N'HCSDLDPT', N'Hệ Cơ Sở Dữ Liệu Đa Phương Tiện', N'Đa phương tiện', N'Đỗ Trung Tuấn', N'DHQGTPHCM', 2016),
(N'CTDLGT', N'Cấu Trúc Dữ Liệu và Giải thuật', N'Công nghệ thông tin', N'Lưu Nguyễn Kỳ Thư', N'HVCNBCVT', 2018),
(N'NMCNPM', N'Nhập Môn Công Nghệ Phần Mềm', N'Công nghệ thông tin', N'Nguyễn Ngọc Duy', N'HVCNBCVT', 2018),
(N'DKTD', N'Điều Khiển Tự Động', N'Điện tử', N'Huỳnh Thái Hoàng', N'DHQGTPHCM', 2019),
(N'QTCN', N'Quản Trị Công Nghệ', N'Đa phương tiện', N'Phan Tú Anh', N'HVCNBCVT', 2013),
(N'DTTT', N'Điện Tử Tương Tự', N'Điện tử', N'Ngô Đức Thiện', N'HVCNBCVT', 2013),
(N'QTCL', N'Quản Trị Chiến Lược', N'Quản trị kinh doanh', N'Lê Thị Bích Ngọc', N'HVCNBCVT', 2009),
(N'QTTCDN', N'Quản Trị Tài Chính Doanh Nghiệp', N'Quản trị kinh doanh', N'Đinh Xuân Dũng', N'HVCNBCVT', 2009),
(N'BGNVTM', N'Bài Giảng Nghiệp Vụ Thương Mại', N'Quản trị kinh doanh', N'Nguyễn Hoài Anh', N'HVCNBCVT', 2018),
(N'BGKSKD', N'Bài Giảng Khởi Sự Kinh Doanh', N'Quản trị kinh doanh', N'Trần Thi Thập', N'HVCNBCVT', 2018),
(N'QTDN', N'Quản Trị Doanh Nghiệp', N'Quản trị kinh doanh', N'Lê Thị Bích Ngọc', N'HVCNBCVT', 2013),
(N'QTMR', N'Quản Trị Marketing', N'Marketing', N'Lê Thị Bích Ngọc', N'HVCNBCVT', 2010),
(N'MRCN', N'Marketing Công Nghiệp', N'Marketing', N'Nguyễn Thị Hoàng Yến', N'HVCNBCVT', 2011),
(N'MRCB', N'Marketing Căn Bản', N'Marketing', N'Nguyễn Thị Hoàng Yến', N'HVCNBCVT', 2009),
(N'MRDV', N'Marketing Dịch Vụ', N'Marketing', N'Nguyễn Thị Hoàng Yến', N'HVCNBCVT', 2009),
(N'XLA', N'Xử Lý Ảnh', N'Công nghệ thông tin', N'Phạm Việt Hưng', N'HVCNBCVT', 2013)

GO
INSERT [dbo].[DANHMUCSACH] VALUES
(N'BGCSDLPT-0', N'BGCSDLPT', 0),
(N'BGCSDLPT-1', N'BGCSDLPT', 0),
(N'BGCSDLPT-2', N'BGCSDLPT', 0),
(N'BGCSDLPT-3', N'BGCSDLPT', 0),
(N'BGCSDLPT-4', N'BGCSDLPT', 0),
(N'LTM-0', N'LTM', 1),
(N'LTM-1', N'LTM', 1),
(N'LTM-2', N'LTM', 0),
(N'LTM-3', N'LTM', 0),
(N'THCS2-0', N'THCS2', 0),
(N'THCS2-1', N'THCS2', 0),
(N'CKDT-0', N'CKDT', 0),
(N'CKDT-1', N'CKDT', 0),
(N'CKDT-2', N'CKDT', 0),
(N'DTS-0', N'DTS', 0),
(N'DTS-1', N'DTS', 0),
(N'DTS-2', N'DTS', 0),
(N'DTS-3', N'DTS', 0),
(N'CSDLDT-0', N'CSDLDT', 1),
(N'CSDLDT-1', N'CSDLDT', 0),
(N'CSDLDT-2', N'CSDLDT', 0),
(N'NMDPT-0', N'NMDPT', 1),
(N'NMDPT-1', N'NMDPT', 0),
(N'NMDPT-2', N'NMDPT', 0),
(N'NMDPT-3', N'NMDPT', 0),
(N'HCSDLDPT-0', N'HCSDLDPT', 1),
(N'HCSDLDPT-1', N'HCSDLDPT', 1),
(N'CTDLGT-0', N'CTDLGT', 0),
(N'CTDLGT-1', N'CTDLGT', 0),
(N'CTDLGT-2', N'CTDLGT', 0),
(N'CTDLGT-3', N'CTDLGT', 0),
(N'NMCNPM-0', N'NMCNPM', 0),
(N'NMCNPM-1', N'NMCNPM', 0),
(N'NMCNPM-2', N'NMCNPM', 0),
(N'DKTD-0', N'DKTD', 1),
(N'DKTD-1', N'DKTD', 0),
(N'DKTD-2', N'DKTD', 0),
(N'DKTD-3', N'DKTD', 0),
(N'DKTD-4', N'DKTD', 0),
(N'QTCN-0', N'QTCN', 0),
(N'QTCN-1', N'QTCN', 0),
(N'QTCN-2', N'QTCN', 0),
(N'QTCN-3', N'QTCN', 0),
(N'QTCN-4', N'QTCN', 0),
(N'DTTT-0', N'DTTT', 1),
(N'DTTT-1', N'DTTT', 0),
(N'DTTT-2', N'DTTT', 0),
(N'QTCL-0', N'QTCL', 0),
(N'QTCL-1', N'QTCL', 0),
(N'QTTCDN-0', N'QTTCDN', 0),
(N'QTTCDN-1', N'QTTCDN', 0),
(N'QTTCDN-2', N'QTTCDN', 0),
(N'QTTCDN-3', N'QTTCDN', 0),
(N'QTTCDN-4', N'QTTCDN', 0),
(N'BGNVTM-0', N'BGNVTM', 0),
(N'BGNVTM-1', N'BGNVTM', 0),
(N'BGNVTM-2', N'BGNVTM', 0),
(N'BGNVTM-3', N'BGNVTM', 0),
(N'BGKSKD-0', N'BGKSKD', 0),
(N'BGKSKD-1', N'BGKSKD', 0),
(N'BGKSKD-2', N'BGKSKD', 0),
(N'QTDN-0', N'QTDN', 0),
(N'QTDN-1', N'QTDN', 0),
(N'QTDN-2', N'QTDN', 0),
(N'QTDN-3', N'QTDN', 0),
(N'QTMR-0', N'QTMR', 1),
(N'QTMR-1', N'QTMR', 0),
(N'QTMR-2', N'QTMR', 0),
(N'MRCN-0', N'MRCN', 0),
(N'MRCN-1', N'MRCN', 0),
(N'MRCN-2', N'MRCN', 0),
(N'MRCN-3', N'MRCN', 0),
(N'MRCB-0', N'MRCB', 1),
(N'MRCB-1', N'MRCB', 1),
(N'MRCB-2', N'MRCB', 0),
(N'MRDV-0', N'MRDV', 1),
(N'MRDV-1', N'MRDV', 0),
(N'MRDV-2', N'MRDV', 0),
(N'MRDV-3', N'MRDV', 0),
(N'MRDV-4', N'MRDV', 0),
(N'XLA-0', N'XLA', 0),
(N'XLA-1', N'XLA', 0),
(N'XLA-2', N'XLA', 0)

GO
INSERT [dbo].[DOCGIA] VALUES
(15467, N'Trần Quang', N'Vinh', 	0,	'2000-01-01', N'tranquangvinh@gmail.com',	N'0934172648', 1),
(46452, N'Phạm', N'Thạch', 			1,	'2001-03-30', N'phamthach@gmail.com',		N'0945622546', 1),
(78584, N'Phạm Nguyễn Yến', N'Vy',	1,	'2001-01-23', N'phamnguyenyenvy@gmail.com', N'0856472645', 1),
(45276, N'Võ Thị Vân', N'Trinh', 	1,	'2001-03-04', N'vothivantrinh@gmail.com',	N'0837461625', 1),
(25365, N'Nguyễn Hữu', N'Trưởng', 	0,	'2001-02-12', N'nguyenhuutruong@gmail.com',	N'0325467254', 1),
(89017, N'Phạm Hoàng', N'Long', 	0,	'2002-10-23', N'phamhoanglong@gmail.com',	N'0954361673', 1),
(56371, N'Nguyễn Minh', N'Thùy', 	1,	'2000-04-12', N'nguyenminhthuy@gmail.com',	N'0345615472', 1),
(45361, N'Nguyễn Nhật', N'Thanh', 	0,	'2001-10-26', N'nguyennhatthanh@gmail.com',	N'0982263436', 1),
(56471, N'Nguyễn Thành', N'Trung',  0,  '2001-08-12', N'nguyenthanhtrung@gmail.com',N'0544746176', 1),
(49182, N'Ngô Thị Vân', N'Anh',		1,	'2000-04-05', N'ngothivan@gmail.com',		N'0957454871', 1),
(24351, N'Nguyễn Ngọc', N'Như',		1,	'2001-05-06', N'nguyenngocnhu@gmail.com',	N'0857646274', 1),
(45642, N'Trần Thành', N'Lợi',		0,	'2000-03-06', N'tranthanhloi@gmail.com',	N'0589561728', 1),
(26354, N'Trần Thùy', N'Vy',		1,	'2001-05-22', N'tranthuyvy@gmail.com',		N'0875626287', 1),
(17562, N'Nguyễn Thành', N'Công',	0,	'2001-10-05', N'nguyenthanhcong@gmail.com', N'0985645274', 1),
(59182, N'Nguyễn Thị Huỳnh', N'Phương', 1, '2000-02-03', N'nguyenthihuynhphuong@gmail.com', N'0785754626', 1),
(37216, N'Nguyễn Thị', N'My', 1, '2001-06-10', N'nguyenthimy@gmail.com', N'0587585726', 1),
(31249, N'Nguyễn Thu', N'Trang', 1, '2000-12-09', N'nguyenthutrang@gmail.com', N'0574384478', 1),
(23536, N'Võ Thi Bảo', N'Anh', 1, '2000-06-12', N'vothbaoanh@gmail.com', N'0857462129', 1),
(13563, N'Huỳnh Bảo', N'Hân', 1, '2001-08-23', N'huynhbaohan@gmail.com', N'0476490293', 1),
(19928, N'Tô Tâm', N'Như', 1, '2001-10-02', N'totamnhu@gmail.com', N'09471625481', 1),
(16565, N'Bùi Mỹ', N'Anh', 1, '2000-04-01', N'buimyanh@gmail.com', N'04816482923', 1),
(46472, N'Nguyễn Thị', N'Thư', 1, '2001-05-07', N'nguyenthithu@gmail.com', N'0462738192', 1),
(76823, N'Trần Thị', N'Hiền', 1, '2000-07-09', N'tranthihien@gmail.com', N'0346273829', 1),
(42843, N'Vũ Kim', N'Anh', 1, '2001-05-01', N'vukimanh@gmail.com', N'0563728162', 1)

GO
INSERT [dbo].[PHIEUMUON] VALUES
(15467, N'CTDLGT-0',	'2021-11-10', '2021-11-20', 1),
(15467, N'LTM-0',		'2021-11-10', '2021-11-20', 1),
(42843, N'MRCB-0',		'2021-11-23', '2021-11-30', 1),
(42843, N'MRCN-0',		'2021-11-23', '2021-11-30', 1),
(49182, N'THCS2-0',		'2021-12-01', '2021-12-12', 1),
(49182, N'CTDLGT-0',	'2021-12-02', '2021-12-23', 1),
(45361, N'CTDLGT-1',	'2021-12-04', '2021-12-10', 1),
(45361, N'NMCNPM-0',	'2021-12-04', '2021-12-11', 1),
(15467, N'BGCSDLPT-0',	'2021-12-12', '2021-12-18', 1),
(15467, N'LTM-0',		'2021-12-18', NULL, 0),
(78584, N'CKDT-0',		'2021-12-20', '2022-02-01', 1),
(78584, N'HCSDLDPT-0',	'2021-12-20', '2022-01-01', 1),
(56371, N'DTS-0',		'2022-12-24', '2022-01-10', 1),
(56371, N'HCSDLDPT-0',	'2022-01-02', NULL, 0),
(24351, N'CTDLGT-0',	'2022-01-02', '2022-01-10', 1),
(24351, N'THCS2-0',		'2022-01-03', '2022-01-12', 1),
(78584, N'CSDLDT-0',	'2022-01-09', NULL, 0),
(45276, N'NMDPT-0',		'2022-01-10', NULL, 0),
(45276, N'HCSDLDPT-1',	'2022-01-10', NULL, 0),
(24351, N'LTM-1',		'2022-01-11', NULL, 0),
(56471, N'DTTT-0',		'2022-01-11', NULL, 0),
(56471, N'DKTD-0',		'2022-01-11', NULL, 0),
(42843, N'QTMR-0',		'2022-01-12', NULL, 0),
(42843, N'MRCB-0',		'2022-01-12', NULL, 0),
(37216, N'MRCB-1',		'2022-01-13', NULL, 0),
(37216, N'MRDV-0',		'2022-01-13', NULL, 0)

GO
INSERT [dbo].[THONGTINDANGNHAP] VALUES
('ad', 'ad')
GO
ALTER TABLE [dbo].[DANHMUCSACH]  WITH CHECK ADD  CONSTRAINT [FK_DANHMUCSACH_DAUSACH] FOREIGN KEY([ISBN])
REFERENCES [dbo].[DAUSACH] ([ISBN])
GO
ALTER TABLE [dbo].[DANHMUCSACH] CHECK CONSTRAINT [FK_DANHMUCSACH_DAUSACH]
GO
ALTER TABLE [dbo].[PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUON_DANHMUCSACH] FOREIGN KEY([MaDanhMucSach])
REFERENCES [dbo].[DANHMUCSACH] ([MaDanhMucSach])
GO
ALTER TABLE [dbo].[PHIEUMUON] CHECK CONSTRAINT [FK_PHIEUMUON_DANHMUCSACH]
GO
ALTER TABLE [dbo].[PHIEUMUON]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUMUON_DOCGIA] FOREIGN KEY([MaDocGia])
REFERENCES [dbo].[DOCGIA] ([MaDocGia])
GO
ALTER TABLE [dbo].[PHIEUMUON] CHECK CONSTRAINT [FK_PHIEUMUON_DOCGIA]
GO
USE [master]
GO
ALTER DATABASE [library_management] SET  READ_WRITE 
GO
