USE [QLVPP2]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/8/2022 9:17:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] NOT NULL,
	[mavpp] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DangNhap]    Script Date: 1/8/2022 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangNhap](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NOT NULL,
 CONSTRAINT [PK_DangNhap] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 1/8/2022 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 1/8/2022 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makh] [bigint] NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
	[sodt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[loai]    Script Date: 1/8/2022 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vanphongpham]    Script Date: 1/8/2022 9:17:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vanphongpham](
	[mavpp] [nvarchar](50) NOT NULL,
	[tenvpp] [nvarchar](50) NULL,
	[soluong] [bigint] NULL,
	[gia] [bigint] NULL,
	[maloai] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_vanphongpham] PRIMARY KEY CLUSTERED 
(
	[mavpp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (1, N'a2', 3, 1)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (2, N'a2', 1, 2)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (3, N'a2', 1, 3)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (4, N'a2', 1, 4)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (5, N'a2', 3, 5)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (6, N'a3', 1, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (7, N'a4', 1, 6)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (8, N'a2', 1, 7)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (9, N'a6', 1, 7)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [mavpp], [SoLuongMua], [MaHoaDon]) VALUES (10, N'a4', 1, 8)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'abc', N'123', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'admin3', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'adminzz', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'dencan', N'111', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nhha', N'2ezur0ziU1o=', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nhha76', N'J2A461dUG8UKL/8XBhus3g==', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'user1', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[DangNhap] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'user2', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (1, 23, CAST(N'1989-01-01 00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (2, 23, CAST(N'2021-12-20 07:28:29.083' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (3, 23, CAST(N'2021-12-20 07:40:28.427' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (4, 23, CAST(N'2021-12-20 07:52:08.940' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (5, 25, CAST(N'2022-01-08 06:51:47.243' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (6, 26, CAST(N'2022-01-08 08:36:09.563' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (7, 26, CAST(N'2022-01-08 08:36:40.150' AS DateTime), 1)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (8, 26, CAST(N'2022-01-08 08:45:34.297' AS DateTime), 1)
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (20, N'Nguyễn Khắc Chung', N'Huế', NULL, NULL, N'nkchung', N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (21, N'ha ha', N'hu hu', NULL, NULL, N'hic hic', N'hi hi')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (22, N'ha ha', N'hu hu', NULL, NULL, N'sfhdfa', N'shdg')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (23, N'admin3', N'huế', N'0335587675', N'abc@123.com', N'admin3', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (24, N'admin', N'huế', N'0335587675', N'abc@123.com', N'admin', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (25, N'user1', N'huế', N'0335587675', N'abc@123.com', N'user1', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (26, N'user2', N'huế', N'0335587675', N'abc@123.com', N'user2', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([makh], [hoten], [diachi], [sodt], [email], [tendn], [pass]) VALUES (27, N'admin', N'huế', N'0335587675', N'abc@123.com', N'adminzz', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Balo', N'Ba lô')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bam giay va kep giay', N'Bấm giấy và kẹp giấy')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bang Phan', N'Bảng - Phấn')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bao sach vo', N'Bao sách vở')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bia ho so', N'Bìa hồ sơ')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Bo dung cu', N'Bộ dụng cụ')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'But bi va but muc', N'Bút bi và bút mực')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'But chi va tay', N'Bút chì và tẩy')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Dung cu ve', N'Dụng cụ vẽ')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Giay', N'Giấy')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Hop Viet', N'Hộp Viết')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Keo va dao roc giay', N'Kéo - Giao rọc giấy')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Keo và ho dan', N'Keo - hồ dán')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'On thi CD-DH', N'Ôn thi CĐ-ĐH')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Tap Vo', N'Tập - Vở')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'Thuoc va compa', N'Thước và compa')
INSERT [dbo].[vanphongpham] ([mavpp], [tenvpp], [soluong], [gia], [maloai], [anh], [NgayNhap]) VALUES (N'a2', N'Vở', 5, 5000, N'Tap Vo', N'image_sach/vo.jpg', CAST(N'2021-12-20 07:12:07.553' AS DateTime))
INSERT [dbo].[vanphongpham] ([mavpp], [tenvpp], [soluong], [gia], [maloai], [anh], [NgayNhap]) VALUES (N'a3', N'Bút xoá', 5, 5000, N'But chi va tay', N'image_sach/butxoa.jpg', CAST(N'2021-12-20 07:12:31.027' AS DateTime))
INSERT [dbo].[vanphongpham] ([mavpp], [tenvpp], [soluong], [gia], [maloai], [anh], [NgayNhap]) VALUES (N'a4', N'Gọt bút chì', 5, 5000, N'But chi va tay', N'image_sach/gotbutchi.jpg', CAST(N'2021-12-20 07:12:55.163' AS DateTime))
INSERT [dbo].[vanphongpham] ([mavpp], [tenvpp], [soluong], [gia], [maloai], [anh], [NgayNhap]) VALUES (N'a6', N'Bút bi xanh', 5, 7000, N'But bi va but muc', N'image_sach/butbi.jpg', CAST(N'2021-12-20 07:13:18.070' AS DateTime))
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_vanphongpham] FOREIGN KEY([mavpp])
REFERENCES [dbo].[vanphongpham] ([mavpp])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_vanphongpham]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_KhachHang] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([makh])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_KhachHang]
GO
ALTER TABLE [dbo].[vanphongpham]  WITH CHECK ADD  CONSTRAINT [FK_vpp_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[vanphongpham] CHECK CONSTRAINT [FK_vpp_loai]
GO
