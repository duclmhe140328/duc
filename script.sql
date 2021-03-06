USE [SE1428]
GO
ALTER TABLE [dbo].[Product] DROP CONSTRAINT [FK__Product__cateId__1A14E395]
GO
ALTER TABLE [dbo].[BillDetail] DROP CONSTRAINT [FK__BillDetail__pid__21B6055D]
GO
ALTER TABLE [dbo].[BillDetail] DROP CONSTRAINT [FK__BillDetail__bid__20C1E124]
GO
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [FK__Bill__cid__1DE57479]
GO
ALTER TABLE [dbo].[Bill] DROP CONSTRAINT [DF__Bill__status__1CF15040]
GO
/****** Object:  Index [UQ__Category__BD4278AE536008E2]    Script Date: 3/24/2021 12:13:20 AM ******/
ALTER TABLE [dbo].[Category] DROP CONSTRAINT [UQ__Category__BD4278AE536008E2]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/24/2021 12:13:20 AM ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/24/2021 12:13:20 AM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/24/2021 12:13:20 AM ******/
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 3/24/2021 12:13:20 AM ******/
DROP TABLE [dbo].[BillDetail]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/24/2021 12:13:20 AM ******/
DROP TABLE [dbo].[Bill]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 3/24/2021 12:13:20 AM ******/
DROP TABLE [dbo].[admin]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 3/24/2021 12:13:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[username] [varchar](30) NOT NULL,
	[password] [varchar](32) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/24/2021 12:13:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bill](
	[bid] [int] IDENTITY(1,1) NOT NULL,
	[dateCreate] [datetime] NULL,
	[total] [money] NULL,
	[recName] [nvarchar](30) NULL,
	[recAddress] [nvarchar](200) NULL,
	[recPhone] [varchar](20) NULL,
	[status] [int] NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 3/24/2021 12:13:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillDetail](
	[bid] [int] NOT NULL,
	[pid] [varchar](30) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/24/2021 12:13:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[cateId] [varchar](30) NOT NULL,
	[cateName] [nvarchar](100) NOT NULL,
	[image] [varchar](200) NULL,
	[status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[cateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/24/2021 12:13:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](30) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [varchar](20) NULL,
	[username] [varchar](30) NULL,
	[password] [varchar](32) NULL,
	[status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/24/2021 12:13:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[pid] [varchar](30) NOT NULL,
	[pname] [nvarchar](200) NOT NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[image] [varchar](200) NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NULL DEFAULT ((1)),
	[cateId] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([username], [password]) VALUES (N'admin', N'123')
INSERT [dbo].[admin] ([username], [password]) VALUES (N'leminhduc24', N'1234')
INSERT [dbo].[admin] ([username], [password]) VALUES (N'long phan', N'123')
INSERT [dbo].[Category] ([cateId], [cateName], [image], [status]) VALUES (N'1', N'Áo Phông', N'https://cdn.boo.vn/products/157/ao-phong-back-to-school-solidden-blackden-1.jpg', 1)
INSERT [dbo].[Category] ([cateId], [cateName], [image], [status]) VALUES (N'2', N'Áo Ba Lỗ', N'https://cdn.boo.vn/products/600/ao-ba-lo-nam-loose-tui-lat-patten-hoa-tiettrangwhitetrang-4.jpg', 1)
INSERT [dbo].[Category] ([cateId], [cateName], [image], [status]) VALUES (N'3', N'Quần', N'https://cdn.boo.vn/products/832/quan-dai-nam-crop-straight-solidbe-beigebe-1.jpg', 1)
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([cid], [fullName], [address], [phone], [username], [password], [status]) VALUES (19, N'le duc', N'VN', N'0374295268', N'duc1', N'a', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'1', N'Áo thun PALM ANGLES', 100000, 349000.0000, N'https://cf.shopee.vn/file/10a31e5fcb30c0438fbbf832f597164b', N'Sản phẩm mới', 1, N'1')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'10', N'Áo Thun Ba Lỗ In Họa Tiết Pride Đơn Giản Trẻ Trung - SNN05', 100000, 244770.0000, N'https://vn-test-11.slatic.net/p/1f7667601c8dffba46e1e7cbd2be901e.jpg_200x200q90.jpg_.webp', N'Sản phẩm cũ', 1, N'2')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'11', N'Áo Thun Ba Lỗ Thể Thao Nam Cực Mát
', 100000, 70000.0000, N'https://cf.shopee.vn/file/98ec3cc694571140cb219061ffeb9051', N'Sản phẩm mới', 1, N'2')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'12', N'Áo tanktop hình cá tính - Khỏe khoắn - Năng động', 100000, 65000.0000, N'https://cf.shopee.vn/file/5829d8b8c4efdfb61b18b2299a28068a', N'Sản phẩm mới', 1, N'2')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'13', N'Quần đũi dài nam ống suông Form Slimfit dáng âu', 100000, 89000.0000, N'https://cf.shopee.vn/file/7e94f37f096068c6c1f85f897319f566', N'Sản phẩm mới', 1, N'3')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'2', N'Quần jogger nam kaki năng động VICERO
', 100000, 79000.0000, N'https://cf.shopee.vn/file/d48b4d2ace595713dc125a77e016e002', N'Sản phẩm mới', 1, N'3')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'3', N'Quần thể thao nam ngắn Maxcool thương hiệu Coolmate
', 100000, 99000.0000, N'https://cf.shopee.vn/file/d6c2cba7273b62bf53f598322ad1591f', N'Sản phẩm mới', 1, N'3')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'4', N'Adidas ORIGINALS Quần short bơi Ba Lá lớn Nam Màu đen', 100000, 950000.0000, N'https://cf.shopee.vn/file/a2a8f559799f153ba4db409a2b55ae75', N'Sản phẩm đặc biệt', 1, N'3')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'5', N'Áo thun cotton Ih Nom UhNit BLACKNISTAGANG', 10000, 350000.0000, N'https://cf.shopee.vn/file/67113cf8597f744b5045345c05b09b03', N'Sản phẩm preorder', 1, N'1')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'6', N'Áo phông ADLV chính hãng
', 100000, 1050000.0000, N'https://cf.shopee.vn/file/fdc6fdf77735bb10206ff6ad143c3e15', N'Sản phẩm mới', 1, N'1')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'7', N'ÁO THUN ÁO PHÔNG ADIDAS', 100000, 349000.0000, N'https://cf.shopee.vn/file/55e179287f16e54afcf66259324b06fb', N'Sản phẩm mới', 1, N'1')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'8', N'Áo thun Dirty coins ', 100000, 349000.0000, N'https://cf.shopee.vn/file/34999ae9e751730db3a49d7fdb05bf85', N'Sản phẩm mới', 1, N'1')
INSERT [dbo].[Product] ([pid], [pname], [quantity], [price], [image], [description], [status], [cateId]) VALUES (N'9', N'Nba Áo Bóng Rổ Số 23 Michael Jordan', 100000, 349000.0000, N'https://cf.shopee.vn/file/dd3fef04352e1644c246223bd29ac325', N'Sản phẩm mới', 1, N'2')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Category__BD4278AE536008E2]    Script Date: 3/24/2021 12:13:20 AM ******/
ALTER TABLE [dbo].[Category] ADD UNIQUE NONCLUSTERED 
(
	[cateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([cid])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[Bill] ([bid])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([pid])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cateId])
REFERENCES [dbo].[Category] ([cateId])
GO
