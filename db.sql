USE [ebay]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/8/2024 3:05:41 AM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 11/8/2024 3:05:41 AM ******/
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
/****** Object:  Table [dbo].[CartItem]    Script Date: 11/8/2024 3:05:41 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 11/8/2024 3:05:41 AM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 11/8/2024 3:05:41 AM ******/
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
/****** Object:  Table [dbo].[OrderItem]    Script Date: 11/8/2024 3:05:41 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 11/8/2024 3:05:41 AM ******/
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

INSERT [dbo].[Order] ([ID], [UserID], [FirstName], [LastName], [Address], [Address2], [City], [State], [Zip], [CreditCard], [Timestamp]) VALUES (1, N'1', N'asd', N'asd', N'asd', N'asd', N'asd', N'AL', N'asd', N'Mastercard', N'11/7/2024 10:25:03 PM')
INSERT [dbo].[Order] ([ID], [UserID], [FirstName], [LastName], [Address], [Address2], [City], [State], [Zip], [CreditCard], [Timestamp]) VALUES (2, N'1', N'sad', N'asd', N'asd', N'asd', N'asd', N'KY', N'32', N'Mastercard', N'11/7/2024 10:27:34 PM')
INSERT [dbo].[Order] ([ID], [UserID], [FirstName], [LastName], [Address], [Address2], [City], [State], [Zip], [CreditCard], [Timestamp]) VALUES (3, N'1', N'32', N'32', N'wqe', N'wqe', N'qwe', N'AL', N'qwe', N'Visa', N'11/7/2024 10:29:56 PM')
INSERT [dbo].[Order] ([ID], [UserID], [FirstName], [LastName], [Address], [Address2], [City], [State], [Zip], [CreditCard], [Timestamp]) VALUES (4, N'1', N'asd', N'asd', N'asd', N'asd', N'asd', N'AK', N'asd', N'AmericanExpress', N'11/8/2024 2:31:23 AM')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (2, 1, 0, 4334)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (3, 1, 0, 4357)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (3, 2, 0, 23)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (4, 1, 0, 1)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (4, 2, 0, 1)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (4, 10, 0, 1)
INSERT [dbo].[OrderItem] ([OrderID], [ProductID], [ID], [Quantity]) VALUES (4, 31, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (1, N'CAC001', N'Atlantic', CAST(12.00 AS Decimal(18, 2)), N'A combination of multiple small cactuses', N'/images/CAC001.jpg', 1, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (2, N'CAC002', N'Rosette', CAST(9.00 AS Decimal(18, 2)), N'A hot pink little cactus to bright up your room', N'/images/CAC002.jpg', 1, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (3, N'CAC003', N'Pastel', CAST(7.00 AS Decimal(18, 2)), N'This cactus with elegant-looking glass is perfect for your desk', N'/images/CAC003.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (4, N'CAC004', N'Coral', CAST(10.00 AS Decimal(18, 2)), N'This cute little coral will definitely lighten up your mood', N'/images/CAC004.jpg', 1, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (5, N'CAC005', N'Parakeet', CAST(18.00 AS Decimal(18, 2)), N'The unique looking little parakeet is one of the tiny plants that you must have', N'/images/CAC005.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (6, N'CAC006', N'Crimson', CAST(17.00 AS Decimal(18, 2)), N'This spiky and layered looking cactus is defenitely a rare found', N'/images/CAC006.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (7, N'FLW001', N'Arctic', CAST(24.00 AS Decimal(18, 2)), N'A blue orchid is one of the best indoor plants that you can have', N'/images/FLW001.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (8, N'FLW002', N'Violet Kokedama', CAST(29.00 AS Decimal(18, 2)), N'This ornamental plant comes with violet flowers and kokedama that adds more style to your plant', N'/images/FLW002.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (9, N'PLN001', N'Bamboo', CAST(26.00 AS Decimal(18, 2)), N'Bamboo is easy to take care of and it grows fast', N'/images/PLN001.jpg', 0, 6, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (10, N'PLN002', N'Hyacinth', CAST(22.00 AS Decimal(18, 2)), N'This plant can live in water and it makes a great indoor plant', N'/images/PLN002.jpg', 0, 6, NULL)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (11, N'SNK001', N'Classic White Sneakers', CAST(75.00 AS Decimal(18, 2)), N'Stylish and comfortable white sneakers.', N'https://freepik.com/white-sneakers.png', 1, 1, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (12, N'SNK002', N'Red Sport Sneakers', CAST(85.00 AS Decimal(18, 2)), N'Red running sneakers, lightweight and durable.', N'https://freepik.com/red-sneakers.png', 1, 1, 80)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (13, N'SNK003', N'High-Top Sneakers', CAST(95.00 AS Decimal(18, 2)), N'High-tops for a stylish look.', N'https://freepik.com/high-top-sneakers.png', 0, 1, 60)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (14, N'SNK004', N'Casual Black Sneakers', CAST(65.00 AS Decimal(18, 2)), N'Comfortable black sneakers for everyday wear.', N'https://freepik.com/black-sneakers.png', 0, 1, 120)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (15, N'SNK005', N'Blue Training Sneakers', CAST(90.00 AS Decimal(18, 2)), N'Supportive and durable training shoes.', N'https://freepik.com/blue-training-sneakers.png', 1, 1, 90)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (16, N'SNK006', N'Running Shoes', CAST(110.00 AS Decimal(18, 2)), N'Perfect for long-distance running.', N'https://freepik.com/running-shoes.png', 1, 1, 70)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (17, N'SNK007', N'Leather Sneakers', CAST(120.00 AS Decimal(18, 2)), N'Sneakers with a premium leather finish.', N'https://freepik.com/leather-sneakers.png', 0, 1, 50)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (18, N'SNK008', N'Canvas Sneakers', CAST(50.00 AS Decimal(18, 2)), N'Casual canvas sneakers.', N'https://freepik.com/canvas-sneakers.png', 1, 1, 110)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (19, N'SNK009', N'Skate Sneakers', CAST(80.00 AS Decimal(18, 2)), N'Perfect for skating and casual wear.', N'https://freepik.com/skate-sneakers.png', 1, 1, 75)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (20, N'SNK010', N'Neon Sneakers', CAST(105.00 AS Decimal(18, 2)), N'Glow-in-the-dark neon sneakers.', N'https://freepik.com/neon-sneakers.png', 1, 1, 65)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (21, N'BK001', N'Inspirational Book', CAST(15.99 AS Decimal(18, 2)), N'A heartwarming story of courage.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 1, 2, 50)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (22, N'BK002', N'Science Fiction', CAST(12.99 AS Decimal(18, 2)), N'A thrilling journey to outer space.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 1, 2, 60)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (23, N'BK003', N'Fantasy Novel', CAST(18.99 AS Decimal(18, 2)), N'Explore a magical world.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 0, 2, 40)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (24, N'BK004', N'Cookbook', CAST(20.99 AS Decimal(18, 2)), N'Delicious recipes from around the world.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 1, 2, 30)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (25, N'BK005', N'Biography', CAST(13.99 AS Decimal(18, 2)), N'A famous person life story.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 0, 2, 25)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (26, N'BK006', N'History of Technology', CAST(14.99 AS Decimal(18, 2)), N'The evolution of technology.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 1, 2, 55)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (27, N'BK007', N'Mystery Thriller', CAST(17.50 AS Decimal(18, 2)), N'Solve the crime before the detective does.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 0, 2, 45)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (28, N'BK008', N'Romantic Novel', CAST(11.99 AS Decimal(18, 2)), N'A love story that spans years.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 1, 2, 65)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (29, N'BK009', N'Poetry Collection', CAST(9.99 AS Decimal(18, 2)), N'A collection of modern poems.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 1, 2, 80)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (30, N'BK010', N'Classic Literature', CAST(10.99 AS Decimal(18, 2)), N'An unforgettable classic.', N'https://pngimg.com/uploads/book/book_PNG2116.png', 0, 2, 70)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (31, N'TOY001', N'Teddy Bear', CAST(15.00 AS Decimal(18, 2)), N'Cute and cuddly teddy bear.', N'https://static.vecteezy.com/system/resources/previews/036/625/188/non_2x/ai-generated-bear-plush-toy-isolated-on-transparent-background-free-png.png', 1, 7, 100)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (32, N'ELC001', N'Portable Speaker', CAST(45.00 AS Decimal(18, 2)), N'Compact speaker with great sound.', N'https://static.vecteezy.com/system/resources/previews/027/144/692/non_2x/portable-wireless-speaker-isolated-on-transparent-background-free-png.png', 1, 8, 70)
INSERT [dbo].[Product] ([ID], [Sku], [Name], [Price], [Description], [Image], [IsFeatured], [category_id], [inventory]) VALUES (33, N'FUR001', N'Yellow Sofa', CAST(250.00 AS Decimal(18, 2)), N'Comfortable sofa for your living room.', N'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-yellow-sofa-furniture-png-image_11548333.png', 1, 9, 20)
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
