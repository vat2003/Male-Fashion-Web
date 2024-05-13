USE [ASM_JAVA5]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_items]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_items](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[cart_id] [int] NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[size] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[total_amount] [float] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[color]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[color](
	[color_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[color_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[images]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name_img] [varchar](255) NULL,
	[thumb] [bit] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[list_orders]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[list_orders](
	[orders] [varbinary](255) NOT NULL,
	[count_items] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[orders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[date_order] [datetime2](6) NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[note] [varchar](255) NULL,
	[phone_num] [varchar](255) NULL,
	[total_amount] [float] NULL,
	[shipping_unit_id] [int] NULL,
	[userid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [int] NOT NULL,
	[color_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [int] NOT NULL,
	[size_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[description] [varchar](1000) NULL,
	[discount] [float] NULL,
	[name] [varchar](255) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[status] [varchar](255) NULL,
	[brand_id] [varchar](255) NULL,
	[category_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report](
	[groups] [varbinary](255) NOT NULL,
	[count] [bigint] NULL,
	[sum] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[groups] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_units]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_units](
	[shipping_unit_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_support_email] [varchar](255) NULL,
	[customer_support_phone] [varchar](255) NULL,
	[delivery_time] [int] NOT NULL,
	[description] [varchar](255) NULL,
	[icon_url] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[other_information] [varchar](255) NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[shipping_unit_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizes]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizes](
	[size_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 18/10/2023 8:40:02 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[birthday] [date] NULL,
	[email] [varchar](255) NULL,
	[fullname] [varchar](255) NULL,
	[passwords] [varchar](255) NULL,
	[phone_num] [varchar](15) NULL,
	[role] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[brand] ([id], [name]) VALUES (N'BR1', N'Louis Vuitton')
GO
INSERT [dbo].[brand] ([id], [name]) VALUES (N'BR2', N'Chanel')
GO
INSERT [dbo].[brand] ([id], [name]) VALUES (N'BR3', N'Hermes')
GO
INSERT [dbo].[brand] ([id], [name]) VALUES (N'BR4', N'Gucci')
GO
SET IDENTITY_INSERT [dbo].[cart_items] ON 
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (3, 400, 1, NULL, 3, 3, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (4, 300, 1, NULL, 4, 2, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (5, 500, 1, NULL, 5, 1, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (6, 400, 3, NULL, 5, 3, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (7, 500, 3, NULL, 6, 1, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (9, 300, 1, 3, NULL, 2, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (10, 500, 1, 4, NULL, 1, NULL)
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (11, 400, 2, NULL, 6, 3, N'L')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (12, 4, 2, 1, NULL, 13, N'S')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (13, 4, 2, NULL, 7, 13, N'S')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (14, 400, 6, NULL, 7, 3, N'XL')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (15, 129, 2, NULL, 8, 18, N'XL')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (17, 50, 3, NULL, 12, 5, N'L')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (18, 54, 3, NULL, 12, 13, N'XL')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (19, 54, 3, 6, NULL, 13, N'L')
GO
INSERT [dbo].[cart_items] ([cart_item_id], [price], [quantity], [cart_id], [order_id], [product_id], [size]) VALUES (20, 129, 2, 6, NULL, 18, N'L')
GO
SET IDENTITY_INSERT [dbo].[cart_items] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 
GO
INSERT [dbo].[carts] ([cart_id], [total_amount], [user_id]) VALUES (1, 108, 9)
GO
INSERT [dbo].[carts] ([cart_id], [total_amount], [user_id]) VALUES (2, 0, 2)
GO
INSERT [dbo].[carts] ([cart_id], [total_amount], [user_id]) VALUES (3, 300, 10)
GO
INSERT [dbo].[carts] ([cart_id], [total_amount], [user_id]) VALUES (4, 500, 11)
GO
INSERT [dbo].[carts] ([cart_id], [total_amount], [user_id]) VALUES (6, 420, 13)
GO
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT1', N'T-Shirt')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT2', N'Shirt')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT3', N'Shoes')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT4', N'Jacket')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT5', N'Bag')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'CT6', N'Accessories')
GO
SET IDENTITY_INSERT [dbo].[color] ON 
GO
INSERT [dbo].[color] ([color_id], [name]) VALUES (1, N'Red')
GO
INSERT [dbo].[color] ([color_id], [name]) VALUES (2, N'Green')
GO
INSERT [dbo].[color] ([color_id], [name]) VALUES (3, N'Blue')
GO
INSERT [dbo].[color] ([color_id], [name]) VALUES (4, N'Beige')
GO
INSERT [dbo].[color] ([color_id], [name]) VALUES (5, N'Black')
GO
INSERT [dbo].[color] ([color_id], [name]) VALUES (6, N'White')
GO
SET IDENTITY_INSERT [dbo].[color] OFF
GO
SET IDENTITY_INSERT [dbo].[images] ON 
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (2, N'product-2.jpg', 1, 1)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (3, N'e170a12cd22f03153b9054829134a81b.jpg', 1, 2)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (4, N'product-3.jpg', 1, 3)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (5, N'product-4.jpg', 1, 4)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (6, N'673fdd5ae681b69e283dc1d987e15698.jpg', 1, 5)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (7, N'product-6.jpg', 1, 6)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (8, N'c124716f2dbe408ecc32d4b02b926b16.jpg', 1, 7)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (9, N'4aeeb9c42d64434cda0b667f4b4271ec.jpg', 1, 8)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (13, N'5d266288b9ca8830b3c386fff5795269.jpg', 1, 13)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (14, N'6a7a29edc09debe5e4acecfe19b705e4.jpg', 0, 13)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (15, N'00e255f5bf7abc828d8a529b3f7c3d52.jpg', 0, 13)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (16, N'1b3cfab5eb1961e4a1eba504644bb361.jpg', 1, 18)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (17, N'c3cb7b8bacd3a2fc0f08a2df75383b6b.jpg', 0, 18)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (18, N'bf41950c6ff23584a3d31b032e3eb43b.jpg', 0, 18)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (19, N'c2add3e07defb104cfbd25218adcdb98.jpg', 0, 7)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (20, N'0f5f52e6bc812932956644cd0b9f846b.jpg', 0, 7)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (21, N'e02c09263a7dcda1c7a67ef9dd5ce7a8.jpg', 0, 2)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (22, N'3c45e71fbcb0c93cc943f9a35157a73e.jpg', 0, 2)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (23, N'e14bfbb712e3ca61db05fb3387465d7d.jpg', 0, 8)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (24, N'577196ba22abff09892006e944578597.jpg', 0, 8)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (25, N'9ed3153c1f64a7bf5576c4f28beb44f2.jpg', 0, 5)
GO
INSERT [dbo].[images] ([id], [name_img], [thumb], [product_id]) VALUES (26, N'f0fcf6370bbf61430492504913b0f552.jpg', 0, 5)
GO
SET IDENTITY_INSERT [dbo].[images] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (3, N'HCM city, VietNam', CAST(N'2023-10-15T17:11:06.2568200' AS DateTime2), N'', N'Liii', N'', N'0348943350', 336, 1, 9)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (4, N'45/17 Thanh Loc', CAST(N'2023-10-15T17:10:52.5612000' AS DateTime2), NULL, N'Võ Anh Tài', N'', N'+84355878578', 253.5, 1, 2)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (5, N'Q12', CAST(N'2023-10-15T17:11:50.9561230' AS DateTime2), N'uynphng765@gmail.com', N'Leonardo', N'New One', N'0328645096', 1458, 2, 9)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (6, N'HCM city', CAST(N'2023-10-15T17:09:05.7855200' AS DateTime2), N'uynphng765@gmail.com', N'Nokia', N'Shirt', N'0328645096', 2022, 2, 9)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (7, N'Sydney city, Australia', CAST(N'2023-10-17T00:00:00.0000000' AS DateTime2), N'uynphng765@gmail.com', N'Uyen Phuong', N'', N'0328645096', 2023.84, 1, 12)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (8, N'Sydney city, Australia', CAST(N'2023-10-15T17:10:22.8025620' AS DateTime2), N'uynphng765@gmail.com', N'Uyen Phuong', N'', N'0328645096', 245.1, 2, 12)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (9, N'Sydney city, Australia', CAST(N'2023-10-15T17:15:50.9020000' AS DateTime2), N'uynphng765@gmail.com', N'Uyen Phuong', N'', N'0328645096', 0, 2, 12)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (10, N'Sydney city, Australia', CAST(N'2023-10-13T17:00:55.1020000' AS DateTime2), N'uynphng765@gmail.com', N'Uyen Phuong', N'', N'0328645096', 0, 2, 12)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (11, N'Sydney city, Australia', CAST(N'2023-10-15T17:13:12.5520000' AS DateTime2), N'uynphng765@gmail.com', N'Uyen Phuong', N'', N'0328645096', 0, 2, 12)
GO
INSERT [dbo].[orders] ([order_id], [address], [date_order], [email], [fullname], [note], [phone_num], [total_amount], [shipping_unit_id], [userid]) VALUES (12, N'45 Bui Cong Trung street, Hoc Mon district, HCM city', CAST(N'2023-10-17T17:11:52.9056110' AS DateTime2), N'leephuong3092002@gmail', N'Phung Le Uyen Phuong', N'', N'0328645096', 301.26, 1, 13)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (1, 4)
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (1, 5)
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (1, 6)
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (18, 2)
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (18, 3)
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (18, 4)
GO
INSERT [dbo].[product_color] ([product_id], [color_id]) VALUES (13, 4)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (1, 2)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (1, 3)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (1, 4)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (1, 5)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (18, 2)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (18, 3)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (18, 4)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (18, 5)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (13, 2)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (13, 3)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (13, 4)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (13, 5)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (2, 2)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (2, 3)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (2, 4)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (2, 5)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (8, 3)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (8, 4)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (8, 5)
GO
INSERT [dbo].[product_size] ([product_id], [size_id]) VALUES (8, 6)
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (1, NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 
	1500s.', 10, N'Brown Jackson Shirt', 500, 200, N'New', N'BR1', N'CT2')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (2, NULL, N' Wool varsity jumper
- Filling quilted at lining
- Regular/relaxed fit
- Mixed graphic technique (embroiery, felt wappen)
-  CPC snap button on the front

POLYESTER 70% / WOOL 30%
LINING : POLYESTER 100%
FILLING : POLYESTER 100%', 15.5, N'WOOL VARSITY JUMPER (NAVY)', 300, 200, N'Sale', N'BR3', N'CT4')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (3, NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 
	1500s.', 16, N'Black Type III Denim Jacket', 400, 200, N'New', NULL, N'CT4')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (4, NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 
	1500s.', 15, N'Brown Type I Jacket', 550, 200, N'New', NULL, N'CT4')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (5, NULL, N'Label name : Mmlg
Season : 2023 FALL/WINTER
Serial No. : MMLGBC2A023

- Knit beanie
- Logo graphic apecial embroidery expression

 ACRYLIC 100%', 5, N'EMBROIDERY KNITCAP (LIGHT BEIGE)', 50, 200, N'Sale', N'BR1', N'CT6')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (6, NULL, N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 
	1500s.', 6, N'PRIME X 2.0 STRUNG', 350, 200, NULL, NULL, N'CT3')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (7, NULL, N'- Naturally shaped drawstring backpack
- Logo graphic embroidery expression
- Drawstring closure at the top
- Drawstring pocket at front, YKK zip closure at side pocket
- Inner pocket for laptop
- White color square label at front
- Use WOOJIN Plastic parts

NYLON 100%', 0, N'Tommy Fill Hitiger', 150, 200, N'New', N'BR2', N'CT5')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (8, NULL, N'- Quilted jumper
- Has 6oz, 5oz
- Relaxed fit
- Regular/relaxed fit
- Two-way YKK zipper closure on the front
- Logo graphic embroidery (Wappen) expression

NYLON 100%
LINING : POLYESTER 100%
FILLING : POLYESTER 100%', 9, N'QUILTED JUMPER ', 350, 200, N'Sale', N'BR4', N'CT4')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (13, CAST(N'2023-10-14' AS Date), N'ACRYLIC 50% / NYLON 30% / WOOL 20%

 The actual color of the product is closer to the detailed photo than the lookbook, and
 may look different depending on the resolution of the device you are using.

 Due to the nature of eco-friendly, biodegradable resin packaging, a small amount of slip agent powder may come out.', 2, N'STRIPE HOOD KNIT ', 54, 12, NULL, N'BR3', N'CT1')
GO
INSERT [dbo].[products] ([product_id], [createdate], [description], [discount], [name], [price], [quantity], [status], [brand_id], [category_id]) VALUES (18, CAST(N'2023-10-17' AS Date), N'ACRYLIC 45% / NYLON 30% / WOOL 15%

 The actual color of the product is closer to the detailed photo than the lookbook, and
 may look different depending on the resolution of the device you are using.

 Due to the nature of eco-friendly, biodegradable resin packaging, a small amount of slip agent powder may come out.', 5, N'BASEBALL KNIT (BLACK)', 129, 50, NULL, N'BR1', N'CT1')
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[shipping_units] ON 
GO
INSERT [dbo].[shipping_units] ([shipping_unit_id], [customer_support_email], [customer_support_phone], [delivery_time], [description], [icon_url], [name], [other_information], [price]) VALUES (1, N'support@example.com', N'+123456789', 2, N'Standard Delivery', N'http://example.com/icon.png', N'Standard Shipping', N'For domestic orders', 5.99)
GO
INSERT [dbo].[shipping_units] ([shipping_unit_id], [customer_support_email], [customer_support_phone], [delivery_time], [description], [icon_url], [name], [other_information], [price]) VALUES (2, N'support@express.com', N'+987654321', 1, N'Express Delivery', N'http://example.com/express-icon.png', N'Express Shipping', N'For expedited delivery', 9.99)
GO
SET IDENTITY_INSERT [dbo].[shipping_units] OFF
GO
SET IDENTITY_INSERT [dbo].[sizes] ON 
GO
INSERT [dbo].[sizes] ([size_id], [name]) VALUES (1, N'XS')
GO
INSERT [dbo].[sizes] ([size_id], [name]) VALUES (2, N'S')
GO
INSERT [dbo].[sizes] ([size_id], [name]) VALUES (3, N'M')
GO
INSERT [dbo].[sizes] ([size_id], [name]) VALUES (4, N'L')
GO
INSERT [dbo].[sizes] ([size_id], [name]) VALUES (5, N'XL')
GO
INSERT [dbo].[sizes] ([size_id], [name]) VALUES (6, N'XXL')
GO
SET IDENTITY_INSERT [dbo].[sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (1, N'no', NULL, N'123@gmail.com', NULL, N'123', NULL, 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (2, N'45/17 Thanh Loc', CAST(N'2023-10-13' AS Date), N'taivaps20559@fpt.edu.vn', N'Võ Anh Tài', N'a', N'+84355878578', 1)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (3, N'q12', CAST(N'2023-10-10' AS Date), N'kha@gmail.com', N'bao kha test 6', N'123456', N'1234569991', 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (4, N'no address', CAST(N'2023-10-20' AS Date), N'baokhays@gmail.com', N'Bao Kha', N'$2a$12$Cf6v2iMbWOZD7V24U7ca4.YLHGu3z9kQBMvyBtWmFX.n.c9.56hWS', N'1234567899', 1)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (7, N'a', CAST(N'2023-10-15' AS Date), N'quoc@gmail.com', N'quoc', N'a', N'1234567892', 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (8, N'haha', CAST(N'2023-10-15' AS Date), N'hah@gmail.com', N'haha', N'a', N'1234567892', 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (9, N'Sydney city, Australia', CAST(N'2002-09-30' AS Date), N'uynphng765@gmail.com', N'Uyen Phuong', N'$2a$12$TZl6FdHSx6HbxNMvBobbmOfgVSonWeDJ1J47k8RsnnH5WHraOHAzW', N'0328645096', 1)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (10, N'no address', NULL, N'anhtaivo43@gmail.com', N'anhtaivo43@gmail.com', N'$2a$12$ivrYwZ0V3WIbYcHF4UdlpeoA4lRxmBfQnr7bsh3enuQEKzReESUW6', N'no phone number', 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (11, N'no address', NULL, N'vatjsm@gmail.com', N'vatjsm@gmail.com', N'$2a$12$aK/eRUNmqAM0qhRcKf.4x.bq4cDBqgL1HBr06QME0FuP09QQh1N3K', N'no phone number', 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (12, N'Sydney city, Australia', CAST(N'2002-09-30' AS Date), N'uynphng765@gmail.com', N'Uyen Phuong', N'a', N'0328645096', 1)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (13, N'45 Bui Cong Trung street, Hoc Mon district, HCM city', CAST(N'2002-09-30' AS Date), N'leephuong3092002@gmail', N'Phung Le Uyen Phuong', N'$2a$12$qSQYvFkqJjwpyY/1C8n.EeDMsR0IfJiyJga2x8J.YAzJ./VppM16m', N'0328645096', 0)
GO
INSERT [dbo].[users] ([userid], [address], [birthday], [email], [fullname], [passwords], [phone_num], [role]) VALUES (14, N'Q12', CAST(N'2002-09-30' AS Date), N'baokha2923@gmail.com', N'Bao Kha', N'Phuong@3092002', N'0348943350', 1)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FK1re40cjegsfvw58xrkdp6bac6] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FK1re40cjegsfvw58xrkdp6bac6]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FKiuhn9mru62vgqy1h0t1ggc3s7] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FKiuhn9mru62vgqy1h0t1ggc3s7]
GO
ALTER TABLE [dbo].[cart_items]  WITH CHECK ADD  CONSTRAINT [FKpcttvuq4mxppo8sxggjtn5i2c] FOREIGN KEY([cart_id])
REFERENCES [dbo].[carts] ([cart_id])
GO
ALTER TABLE [dbo].[cart_items] CHECK CONSTRAINT [FKpcttvuq4mxppo8sxggjtn5i2c]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FKb5o626f86h46m4s7ms6ginnop] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FKb5o626f86h46m4s7ms6ginnop]
GO
ALTER TABLE [dbo].[images]  WITH CHECK ADD  CONSTRAINT [FKghwsjbjo7mg3iufxruvq6iu3q] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[images] CHECK CONSTRAINT [FKghwsjbjo7mg3iufxruvq6iu3q]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKpnm1eeupqm4tykds7k3okqegv] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKpnm1eeupqm4tykds7k3okqegv]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FKslaw4u7spfu8wdetadvu1pgby] FOREIGN KEY([shipping_unit_id])
REFERENCES [dbo].[shipping_units] ([shipping_unit_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FKslaw4u7spfu8wdetadvu1pgby]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK3iys6jgmsdkw7w5ncgm55wgj3] FOREIGN KEY([color_id])
REFERENCES [dbo].[color] ([color_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK3iys6jgmsdkw7w5ncgm55wgj3]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FKjs0ht7btbgt5u0jpossmgvfk5] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FKjs0ht7btbgt5u0jpossmgvfk5]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK1yl8bbmokvonm64131xlscnci] FOREIGN KEY([size_id])
REFERENCES [dbo].[sizes] ([size_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK1yl8bbmokvonm64131xlscnci]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK9qjgp0xvl5jfetdt683i7wqwr] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK9qjgp0xvl5jfetdt683i7wqwr]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKl2cyj2st6mjygl2pgwd057ivu] FOREIGN KEY([brand_id])
REFERENCES [dbo].[brand] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKl2cyj2st6mjygl2pgwd057ivu]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FKog2rp4qthbtt2lfyhfo32lsw9]
GO
