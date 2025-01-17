USE [ebay]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[CartID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](max) NOT NULL,
	[img_url] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Address2] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Zip] [nvarchar](max) NOT NULL,
	[CreditCard] [nvarchar](max) NOT NULL,
	[Timestamp] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/8/2024 10:40:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sku] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[IsFeatured] [bit] NOT NULL,
	[category_id] [int] NULL,
	[inventory] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241107145330_init', N'8.0.10')
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [UserID]) VALUES (1, N'1')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (1, N'Sneakers', N'https://www.pngarts.com/files/4/Sneaker-Transparent-Image.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (2, N'Books', N'https://pngimg.com/uploads/book/book_PNG2116.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (3, N'Clothing', N'https://www.pngarts.com/files/3/Clothing-Transparent-Background-PNG.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (4, N'Computers', N'https://i.pinimg.com/originals/e2/e9/48/e2e948b329276c1a2206c678b93b0199.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (5, N'Cards', N'https://card-pokemon.com/assets/img/pokemon-card-back.webp')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (6, N'Flowers', N'https://static.vecteezy.com/system/resources/previews/045/357/367/non_2x/sun-flower-isolated-on-transparent-background-free-png.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (7, N'Toys', N'https://static.vecteezy.com/system/resources/previews/036/625/188/non_2x/ai-generated-bear-plush-toy-isolated-on-transparent-background-free-png.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (8, N'Electronics', N'https://static.vecteezy.com/system/resources/previews/027/144/692/non_2x/portable-wireless-speaker-isolated-on-transparent-background-free-png.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (9, N'Furniture', N'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-yellow-sofa-furniture-png-image_11548333.png')
INSERT [dbo].[Category] ([category_id], [category_name], [img_url]) VALUES (10, N'Groceries', N'https://png.pngtree.com/png-vector/20230808/ourmid/pngtree-grocery-bag-clipart-grocery-bag-with-vegetables-cartoon-vector-png-image_6866175.png')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [FirstName], [LastName], [Address], [Address2], [City], [State], [Zip], [CreditCard], [Timestamp]) VALUES (8, N'1', N'John', N'Wick', N'Calvary Cemetery, Woodside, Queens', N'121 Mill Neck in Long Island', N'New York', N'NY', N'28412', N'AmericanExpress', N'11/8/2024 10:39:01 PM')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (8, 45, 0, 1)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (8, 46, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (1, N'CAC001', N'Atlantic', CAST(12.00 AS Decimal(18, 2)), N'A combination of multiple small cactuses', N'/images/CAC001.jpg', 1, 6, 99)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (2, N'CAC002', N'Rosette', CAST(9.00 AS Decimal(18, 2)), N'A hot pink little cactus to bright up your room', N'/images/CAC002.jpg', 1, 6, 97)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (3, N'CAC003', N'Pastel', CAST(7.00 AS Decimal(18, 2)), N'This cactus with elegant-looking glass is perfect for your desk', N'/images/CAC003.jpg', 0, 6, 98)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (4, N'CAC004', N'Coral', CAST(10.00 AS Decimal(18, 2)), N'This cute little coral will definitely lighten up your mood', N'/images/CAC004.jpg', 1, 6, 89)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (5, N'CAC005', N'Parakeet', CAST(18.00 AS Decimal(18, 2)), N'The unique looking little parakeet is one of the tiny plants that you must have', N'/images/CAC005.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (6, N'CAC006', N'Crimson', CAST(17.00 AS Decimal(18, 2)), N'This spiky and layered looking cactus is defenitely a rare found', N'/images/CAC006.jpg', 0, 6, 99)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (7, N'FLW001', N'Arctic', CAST(24.00 AS Decimal(18, 2)), N'A blue orchid is one of the best indoor plants that you can have', N'/images/FLW001.jpg', 0, 6, 97)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (8, N'FLW002', N'Violet Kokedama', CAST(29.00 AS Decimal(18, 2)), N'This ornamental plant comes with violet flowers and kokedama that adds more style to your plant', N'/images/FLW002.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (9, N'PLN001', N'Bamboo', CAST(26.00 AS Decimal(18, 2)), N'Bamboo is easy to take care of and it grows fast', N'/images/PLN001.jpg', 0, 6, 99)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (10, N'PLN002', N'Hyacinth', CAST(22.00 AS Decimal(18, 2)), N'This plant can live in water and it makes a great indoor plant', N'/images/PLN002.jpg', 0, 6, NULL)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (11, N'SNK001', N'Classic White Sneakers', CAST(75.00 AS Decimal(18, 2)), N'Stylish and comfortable white sneakers.', N'https://shoewarehouse.com.au/cdn/shop/articles/White_Sneaker_Blog_Thumbnail.jpg?v=1693455706', 1, 1, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (12, N'SNK002', N'Red Sport Sneakers', CAST(85.00 AS Decimal(18, 2)), N'Red running sneakers, lightweight and durable.', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/882c21ec-b405-4e45-92d3-111a108e0cf0/SABRINA+2+EP.png', 1, 1, 80)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (13, N'SNK003', N'High-Top Sneakers', CAST(95.00 AS Decimal(18, 2)), N'High-tops for a stylish look.', N'https://id.coach.com/media/catalog/product/c/k/ck812_wtbk_a0_wid_1500_hei_1500.jpg?optimize=low&bg-color=255,255,255&fit=bounds&height=&width=&canvas=:', 0, 1, 60)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (14, N'SNK004', N'Casual Black Sneakers', CAST(65.00 AS Decimal(18, 2)), N'Comfortable black sneakers for everyday wear.', N'https://blackberrys.com/cdn/shop/products/Solid_Casual_Sneakers_In_Black_Prola-FNPM0054Z1SA22FX-image1.jpg?v=1687869296', 0, 1, 120)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (15, N'SNK005', N'Blue Training Sneakers', CAST(90.00 AS Decimal(18, 2)), N'Supportive and durable training shoes.', N'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/48bd90d4-6785-4128-9314-669d54457e67/W+NIKE+FREE+RN+FK+NN+NBY.png', 1, 1, 90)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (16, N'SNK006', N'Running Shoes', CAST(110.00 AS Decimal(18, 2)), N'Perfect for long-distance running.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0mwXCPYym7VEY2wj3hVicHeYYxBdzkju0mw&s', 1, 1, 70)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (17, N'SNK007', N'Leather Sneakers', CAST(120.00 AS Decimal(18, 2)), N'Sneakers with a premium leather finish.', N'https://www.romeroferrera.com/cdn/shop/products/shoepassion_53ms-05.jpg?v=1587660330&width=533', 0, 1, 50)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (18, N'SNK008', N'Canvas Sneakers', CAST(50.00 AS Decimal(18, 2)), N'Casual canvas sneakers.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlkEEAQR_56LHbSWRq14GDHUywqv5KKuD3rA&s', 1, 1, 110)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (19, N'SNK009', N'Skate Sneakers', CAST(80.00 AS Decimal(18, 2)), N'Perfect for skating and casual wear.', N'https://i5.walmartimages.com/seo/KOFUBOKE-Roller-Skate-Shoes-Sneakers-2-in-1-Suitable-Outdoor-Sports-Skating-Invisible-Skates-The-Best-Choice-Building-Confidence-Style_ed0540f1-32f0-490d-aedc-13883732fe07.1da5b32f8b24e7f16a5c24b1a22e310c.jpeg', 1, 1, 75)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (20, N'SNK010', N'Neon Sneakers', CAST(105.00 AS Decimal(18, 2)), N'Glow-in-the-dark neon sneakers.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTylGZMQtDI1dzqr9RBoZdGXIBN6yRf0Or64A&s', 1, 1, 65)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (21, N'BK001', N'Inspirational Book', CAST(15.99 AS Decimal(18, 2)), N'A heartwarming story of courage.', N'https://blog.cdn.level.game/2023/06/71ZA-vKnFRL._AC_UF1000-1000_QL80_.jpg', 1, 2, 50)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (22, N'BK002', N'Science Fiction', CAST(12.99 AS Decimal(18, 2)), N'A thrilling journey to outer space.', N'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Imagination_195808.jpg/170px-Imagination_195808.jpg', 1, 2, 60)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (23, N'BK003', N'Fantasy Novel', CAST(18.99 AS Decimal(18, 2)), N'Explore a magical world.', N'https://specials-images.forbesimg.com/imageserve/5d28f9614c687b00085c8ded/The-Lord-Of-The-Rings/960x0.jpg?fit=scale', 0, 2, 39)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (24, N'BK004', N'Cookbook', CAST(20.99 AS Decimal(18, 2)), N'Delicious recipes from around the world.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo6XLSFyi_gyt-n5NDHR-4IemExSOylOCMfA&s', 1, 2, 30)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (25, N'BK005', N'Biography', CAST(13.99 AS Decimal(18, 2)), N'A famous person life story.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWgM6uHTeil0X85o5c_vqHqiqD8wK4HDFopA&s', 0, 2, 25)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (26, N'BK006', N'History of Technology', CAST(14.99 AS Decimal(18, 2)), N'The evolution of technology.', N'https://m.media-amazon.com/images/I/8115-r0c3NL._AC_UF1000,1000_QL80_.jpg', 1, 2, 55)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (27, N'BK007', N'Mystery Thriller', CAST(17.50 AS Decimal(18, 2)), N'Solve the crime before the detective does.', N'https://m.media-amazon.com/images/I/61MIvCmsDAL._AC_UF1000,1000_QL80_.jpg', 0, 2, 45)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (28, N'BK008', N'Romantic Novel', CAST(11.99 AS Decimal(18, 2)), N'A love story that spans years.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLLt78wEnhdrXOP_BS2iCi1ZngoSvsqV8rtg&s', 1, 2, 65)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (29, N'BK009', N'Poetry Collection', CAST(9.99 AS Decimal(18, 2)), N'A collection of modern poems.', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrvuI1a1maBHakJRsF3YgwlWdoNoaJfaAvgw&s', 1, 2, 80)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (30, N'BK010', N'Classic Literature', CAST(10.99 AS Decimal(18, 2)), N'An unforgettable classic.', N'https://images.squarespace-cdn.com/content/v1/604ffb544c6d436ffc845808/085b0e6a-10b7-4d70-b58d-6b6c5cd76810/classic-literature.jpg', 0, 2, 70)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (31, N'TOY001', N'Teddy Bear', CAST(15.00 AS Decimal(18, 2)), N'Cute and cuddly teddy bear.', N'https://static.vecteezy.com/system/resources/previews/036/625/188/non_2x/ai-generated-bear-plush-toy-isolated-on-transparent-background-free-png.png', 1, 7, 99)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (32, N'ELC001', N'Portable Speaker', CAST(45.00 AS Decimal(18, 2)), N'Compact speaker with great sound.', N'https://static.vecteezy.com/system/resources/previews/027/144/692/non_2x/portable-wireless-speaker-isolated-on-transparent-background-free-png.png', 1, 8, 70)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (33, N'FUR001', N'Yellow Sofa', CAST(250.00 AS Decimal(18, 2)), N'Comfortable sofa for your living room.', N'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-yellow-sofa-furniture-png-image_11548333.png', 1, 9, 20)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (34, N'SKU001', N'Men T-Shirt', CAST(19.99 AS Decimal(18, 2)), N'Comfortable cotton T-shirt', N'https://product.hstatic.net/200000378371/product/abcd4368_68997257eaf0401ebcc4d283fccff317_master.jpg', 1, 3, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (35, N'SKU002', N'Women Dress', CAST(49.99 AS Decimal(18, 2)), N'Elegant evening dress', N'https://assets.ajio.com/medias/sys_master/root/20240406/jTor/6610dc8616fd2c6e6aa17c06/-473Wx593H-466855053-yellow-MODEL.jpg', 1, 3, 50)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (36, N'SKU003', N'Men Jeans', CAST(39.99 AS Decimal(18, 2)), N'Stylish denim jeans', N'https://360.com.vn/wp-content/uploads/2024/06/QJDTK501-2.jpg', 0, 3, 75)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (37, N'SKU004', N'Women Jacket', CAST(59.99 AS Decimal(18, 2)), N'Warm winter jacket', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVnxeBbGVkNKXrfU72kQGpVYt12RVi6CFnFQ&s', 1, 3, 30)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (38, N'SKU005', N'Kids Sweater', CAST(29.99 AS Decimal(18, 2)), N'Cozy kids sweater', N'https://product.hstatic.net/200000724807/product/ao-sweater-be-trai-anta-kids-w352339702__15__25ca35b7cbf541108184a2aaed284a2e_master.jpg', 0, 3, 120)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (39, N'SKU006', N'Men Shorts', CAST(24.99 AS Decimal(18, 2)), N'Casual men shorts', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKNOCCYiUYy2XOg2HsSuoItFvX1XjVFd59rQ&s', 1, 3, 90)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (40, N'SKU007', N'Womens Blouse', CAST(34.99 AS Decimal(18, 2)), N'Light and airy blouse', N'https://www.optimized-rlmedia.io/is/image/PoloGSI/s7-1501080_alternate10?$plpDeskRFAlt$', 1, 3, 60)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (41, N'SKU008', N'Kids Jacket', CAST(49.99 AS Decimal(18, 2)), N'Waterproof kids jacket', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKqeLdQjzc_MbmOaywyChMOoOJw1q7MIeb2g&s', 0, 3, 40)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (42, N'SKU101', N'Gaming Laptop', CAST(1499.99 AS Decimal(18, 2)), N'High-performance laptop for gaming', N'https://i5.walmartimages.com/seo/MSI-GL63-Gaming-Laptop-15-6-Intel-Core-i7-8750H-NVIDIA-GeForce-GTX-1050-8gb-RAM-256gb-SSD-1TB-HDD_3a04f0fc-6fed-4b52-912c-11317e493ad1_1.9e46d617254b76bff5a4cda944922f78.jpeg', 1, 4, 25)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (43, N'SKU102', N'Desktop PC', CAST(899.99 AS Decimal(18, 2)), N'Powerful desktop for work and play', N'https://images-cdn.ubuy.co.in/65f1abea6f15032e663e11fe-dell-optiplex-7040-desktop-computer-pc.jpg', 0, 4, 50)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (44, N'SKU103', N'Wireless Mouse', CAST(29.99 AS Decimal(18, 2)), N'Ergonomic wireless mouse', N'https://product.hstatic.net/1000152881/product/tai_xuong_-_2023-05-16t122157.113_48d14003bb98430aadbf2da7937927bb_1024x1024.jpg', 1, 4, 150)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (45, N'SKU104', N'Mechanical Keyboard', CAST(79.99 AS Decimal(18, 2)), N'RGB mechanical keyboard for gaming', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8D8BnatrgaGZulOLXW69E_8m-kTyArbagVQ&s', 1, 4, 99)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (46, N'SKU105', N'4K Monitor', CAST(299.99 AS Decimal(18, 2)), N'Ultra HD monitor with stunning visuals', N'https://m.media-amazon.com/images/I/81FFCjMtVZL._AC_UF1000,1000_QL80_.jpg', 0, 4, 39)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (47, N'SKU106', N'External Hard Drive', CAST(89.99 AS Decimal(18, 2)), N'1TB external storage', N'https://cdn.thewirecutter.com/wp-content/media/2023/05/externalhardrives-2048px-09422.jpg', 0, 4, 75)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (48, N'SKU107', N'USB-C Hub', CAST(49.99 AS Decimal(18, 2)), N'Multi-port USB-C hub with HDMI', N'https://cdn2.cellphones.com.vn/x/media/catalog/product/h/u/hub-chuyen-doi-ugreen-usb-c-to-usb-a-2-0-usb-a-3-0-hdmi-pd-ho-tro-4k-15495-2.png', 1, 4, 200)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (49, N'SKU108', N'Gaming Headset', CAST(69.99 AS Decimal(18, 2)), N'Surround sound gaming headset', N'https://images-na.ssl-images-amazon.com/images/I/71rwPzXKDGL.jpg', 1, 4, 120)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Cart_CartID] FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItems_Cart_CartID]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItems_Product_ProductID]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Order_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItems_Order_OrderID]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItems_Product_ProductID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
