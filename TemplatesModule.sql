USE [Realstate_agents]
GO
/****** Object:  Table [dbo].[Billing_Shipping_details]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing_Shipping_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[b_Adress] [text] NOT NULL,
	[city] [varchar](50) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[zip_code] [nchar](10) NOT NULL,
	[country] [nchar](20) NOT NULL,
	[phone] [nchar](15) NOT NULL,
	[s_type] [varchar](25) NULL,
	[s_name] [varchar](50) NULL,
	[s_adress] [text] NULL,
	[s_city] [varchar](50) NULL,
	[s_state] [varchar](50) NULL,
	[s_zip_code] [varchar](10) NULL,
	[s_country] [nchar](15) NULL,
	[s_suite] [varchar](50) NULL,
	[b_suite] [varchar](50) NULL,
	[s_phone] [nchar](15) NULL,
	[completed] [bit] NULL,
	[userid] [int] NULL,
	[orderid] [int] NULL,
 CONSTRAINT [PK_Billing_Shipping_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[label_color]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[label_color](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[background] [varchar](50) NOT NULL,
	[color] [varchar](50) NOT NULL,
	[labelid] [int] NOT NULL,
	[label_name] [varchar](50) NOT NULL,
	[templateid] [varchar](100) NOT NULL,
 CONSTRAINT [PK_label_color] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[labels]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[labels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[template] [varchar](100) NOT NULL,
	[name] [nchar](25) NOT NULL,
	[description] [nchar](50) NULL,
	[p_top] [nchar](10) NULL,
	[p_bottom] [nchar](10) NULL,
	[p_right] [nchar](10) NULL,
	[p_left] [nchar](10) NULL,
	[Font] [nchar](100) NULL,
	[Font_type] [nchar](100) NULL,
	[Color] [nchar](20) NULL,
	[size] [nchar](10) NULL,
	[width] [nchar](10) NULL,
	[height] [nchar](10) NULL,
	[pic_bottom] [nchar](10) NULL,
	[pic_left] [nchar](10) NULL,
	[font_weight] [nchar](20) NULL,
	[text_position] [nchar](20) NULL,
	[shape] [varchar](25) NULL,
 CONSTRAINT [PK_labels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marketing_order_details]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marketing_order_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[template] [text] NOT NULL,
	[unit_price] [decimal](18, 0) NOT NULL,
	[items] [int] NOT NULL,
	[creation_date] [date] NOT NULL,
 CONSTRAINT [PK_order_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marketing_orders]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marketing_orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[items] [int] NOT NULL,
	[ttl_price] [decimal](18, 0) NOT NULL,
	[taxes] [decimal](18, 0) NOT NULL,
	[shipping] [decimal](18, 0) NOT NULL,
	[creation_date] [date] NOT NULL,
	[payment_intent_id] [varchar](max) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_marketing_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment_Intent]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_Intent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payment_intent_id] [varchar](max) NOT NULL,
	[shipping] [decimal](18, 2) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[user_id] [int] NOT NULL,
	[items] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[orderid] [int] NOT NULL,
 CONSTRAINT [PK_Payment_Intent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipts]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[location] [varchar](max) NOT NULL,
	[file_name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[saved_labels]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[saved_labels](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[labelid] [int] NOT NULL,
	[templateid] [varchar](100) NOT NULL,
	[saved_template] [int] NOT NULL,
	[text] [varchar](100) NOT NULL,
	[userid] [int] NULL,
	[font_size] [nchar](10) NULL,
	[color] [varchar](50) NULL,
 CONSTRAINT [PK_saved_labels] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Saved_Templates]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Saved_Templates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path] [varchar](max) NULL,
	[Templateid] [varchar](100) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[Creation_date] [date] NOT NULL,
	[Material] [text] NOT NULL,
	[Size] [varchar](100) NULL,
	[Holes] [varchar](100) NULL,
	[Laminate] [bit] NULL,
	[clearcoat] [bit] NULL,
	[category] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[label_num] [int] NOT NULL,
	[location] [text] NOT NULL,
	[amount] [int] NOT NULL,
	[completed] [bit] NOT NULL,
	[photo_path] [text] NULL,
	[logo_path] [text] NULL,
	[price] [decimal](18, 2) NULL,
	[Comments] [text] NULL,
	[orderid] [int] NULL,
	[type] [int] NULL,
	[dimension] [int] NULL,
 CONSTRAINT [PK_Templates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping_Details]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[carrier] [varchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[dates] [int] NOT NULL,
 CONSTRAINT [PK_Shipping_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[signs_description]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signs_description](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[dimension] [int] NOT NULL,
 CONSTRAINT [PK_signs_description] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template_categories]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nchar](25) NOT NULL,
	[path] [varchar](100) NULL,
 CONSTRAINT [PK_Template_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template_colors]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template_colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[templateid] [varchar](100) NOT NULL,
	[color] [varchar](50) NOT NULL,
	[path] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Template_colors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template_Details]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template_Details](
	[id] [varchar](100) NOT NULL,
	[category] [int] NOT NULL,
	[path] [varchar](100) NOT NULL,
	[width] [varchar](20) NOT NULL,
	[height] [varchar](20) NOT NULL,
	[cleaned_path] [varchar](100) NOT NULL,
	[cleaned_name] [varchar](50) NOT NULL,
	[header] [bit] NOT NULL,
	[company_name] [bit] NOT NULL,
	[agent_name] [bit] NOT NULL,
	[phone] [bit] NOT NULL,
	[photo] [bit] NOT NULL,
	[logo] [bit] NOT NULL,
	[website] [bit] NOT NULL,
	[title] [bit] NOT NULL,
	[email] [bit] NOT NULL,
	[message] [bit] NULL,
	[other] [bit] NULL,
	[adress_1] [bit] NULL,
	[adress_2] [bit] NULL,
	[instagram] [bit] NULL,
	[facebook] [bit] NULL,
	[profile_pic] [bit] NOT NULL,
	[pic_path] [varchar](120) NULL,
	[original_width] [varchar](20) NULL,
	[original_height] [varchar](20) NULL,
	[saved_width] [varchar](20) NULL,
	[saved_height] [varchar](20) NULL,
	[logo_path] [varchar](100) NULL,
	[type] [int] NULL,
	[price] [decimal](18, 2) NULL,
	[pic_round] [bit] NULL,
 CONSTRAINT [PK_Template_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template_dimensions]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template_dimensions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dimensions] [varchar](max) NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_Template_dimensions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[template_pricing]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[template_pricing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[dimensions] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_template_pricing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template_type]    Script Date: 10/24/2021 11:24:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Template_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Billing_Shipping_details] ON 

INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (96, N'heyner222@gmail.com', N'heyner111', N'palacios', N'palacios', N'asas', N'asasas', N'asasa     ', N'United States       ', N'asasas         ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', N'asas', N'asas', NULL, 1, 2, 1)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (101, N'heyner222@gmail.com', N'heyner', N'paa', N'asas', N'asas', N'asas', N'asas      ', N'United States       ', N'232-2332-2323  ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'asas', NULL, 1, 2, 2)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (102, N'heyner222@gmail.com', N'qasas', N'asa', N'asas', N'asas', N'asa', N'asas      ', N'United States       ', N'asas           ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'asas', NULL, 1, 2, 3)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (103, N'heyner.palacios@vertikalcompany.com', N'Heyner', N'Palacios', N'Palacios', N'Soyapango', N'San salvador', N'cp 1117   ', N'United States       ', N'503 3454-4543  ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', N'', NULL, NULL, 1, 2, 4)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (104, N'heyner222@gmail.com', N'heyner', N'palacios', N'col los santos 3 pje 9 pol q9 #12 ', N'soyapango', N'san salvador', N'34333     ', N'United States       ', N'343-344-3343   ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, NULL, NULL, 1, 2, 5)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (115, N'heyer@as.com', N'asa', N'a', N'a', N'a', N'a', N'ws        ', N'United States       ', N's              ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'a', NULL, 1, 2, 6)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (121, N'asa@a.com', N'j', N'j', N'j', N'j', N'j', N'j         ', N'United States       ', N'j              ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'j', NULL, 1, 2, 9)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (122, N'asa@a.com', N'm', N'm', N'm', N'm', N'm', N'm         ', N'United States       ', N'm              ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'm', NULL, 1, 2, 10)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (123, N'asas@h.com', N'asas', N'asas', N'asas', N'asas', N'asas', N'asas      ', N'United States       ', N'356-6564-6556  ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'asas', NULL, 1, 2, 11)
INSERT [dbo].[Billing_Shipping_details] ([id], [email], [first_name], [last_name], [b_Adress], [city], [state], [zip_code], [country], [phone], [s_type], [s_name], [s_adress], [s_city], [s_state], [s_zip_code], [s_country], [s_suite], [b_suite], [s_phone], [completed], [userid], [orderid]) VALUES (124, N'asas@gmail.com', N'asa', N'asdas', N'asas', N'asas', N'asas', N'asas      ', N'United States       ', N'asas           ', NULL, NULL, NULL, NULL, NULL, NULL, N'United States  ', NULL, N'asas', NULL, 1, 2, 12)
SET IDENTITY_INSERT [dbo].[Billing_Shipping_details] OFF
GO
SET IDENTITY_INSERT [dbo].[label_color] ON 

INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (1, N'#EF5F23', N'white', 79, N'Header', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (2, N'black', N'white', 79, N'Header', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (3, N'red', N'white', 79, N'Header', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (4, N'#EF5F23', N'black', 80, N'Agent', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (5, N'black', N'white', 80, N'Agent', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (6, N'red', N'black', 80, N'Agent', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (7, N'#EF5F23', N'black', 81, N'Phone', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (8, N'black', N'white', 81, N'Phone', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (9, N'red', N'black', 81, N'Phone', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (10, N'#EF5F23', N'black', 82, N'Website', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (11, N'black', N'black', 82, N'Website', N'R-2436-4')
INSERT [dbo].[label_color] ([id], [background], [color], [labelid], [label_name], [templateid]) VALUES (12, N'red', N'black', 82, N'Website', N'R-2436-4')
SET IDENTITY_INSERT [dbo].[label_color] OFF
GO
SET IDENTITY_INSERT [dbo].[labels] ON 

INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (1, N'R-1824-9', N'Header                   ', N'For Sale                                          ', NULL, N'480px     ', N'          ', N'15px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'45px      ', N'470px     ', N'65px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (2, N'R-1824-9', N'Company                  ', N'Company Name                                      ', NULL, N'490px     ', NULL, N'25px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'60px      ', N'320px     ', N'210px     ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (6, N'R-1824-9', N'Agent                    ', N'Agent Name                                        ', NULL, N'500px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'60px      ', N'465px     ', N'70px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (7, N'R-1824-9', N'Phone                    ', N'000-000-0000                                      ', NULL, N'510px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'60px      ', N'465px     ', N'80px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (8, N'R-1824-9', N'Website                  ', N'www.yourwebsite.com                               ', NULL, N'520px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'30px      ', N'465px     ', N'45px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (9, N'R-1824-9', N'Photo                    ', N'                                                  ', NULL, N'895px     ', NULL, N'353px     ', NULL, NULL, NULL, NULL, N'95px      ', N'165px     ', N'930px     ', N'353px     ', NULL, NULL, N'square')
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (10, N'R-2424-32', N'Company                  ', N'Company Name                                      ', NULL, N'470px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'40px      ', N'460px     ', N'100px     ', NULL, NULL, N'bold                ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (11, N'R-2424-32', N'Agent                    ', N'Agent Name                                        ', NULL, N'420px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'45px      ', N'460px     ', N'100px     ', NULL, NULL, N'bold                ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (12, N'R-2424-32', N'Phone                    ', N'(245) 456.7890                                    ', NULL, N'340px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'60px      ', N'460px     ', N'100px     ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (13, N'R-2524-29', N'Agent                    ', N'Agent Name                                        ', NULL, N'300px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'50px      ', N'460px     ', N'60px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (14, N'R-2524-29', N'Phone                    ', N'123.456.7890                                      ', NULL, N'295px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'70px      ', N'460px     ', N'80px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (15, N'R-2524-29', N'Website                  ', N'www.yourwebsite.com                               ', NULL, N'300px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'30px      ', N'460px     ', N'50px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (16, N'BC-000-03', N'Header                   ', N'hello                                             ', NULL, N'300px     ', NULL, N'10px      ', N'Brush Script MT                                                                                     ', N', cursive                                                                                           ', N'#F8CF50             ', N'200px     ', N'480px     ', N'240px     ', NULL, NULL, N'lighter             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (17, N'BC-000-03', N'Agent                    ', N'FULL NAME                                         ', NULL, N'330px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'480px     ', N'30px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (18, N'BC-000-03', N'Title                    ', N'TITLE                                             ', NULL, N'325px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'480px     ', N'30px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (19, N'BC-000-02', N'Agent                    ', N'FULL NAME                                         ', NULL, N'200px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'30px      ', N'480px     ', N'30px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (20, N'BC-000-02', N'Title                    ', N'Job Title                                         ', NULL, N'160px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'20px      ', N'480px     ', N'20px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (21, N'BC-000-04', N'Company                  ', N'Company Name                                      ', NULL, N'150px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'dimgrey             ', N'50px      ', N'480px     ', N'60px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (22, N'BC-000-04', N'Website                  ', N'Web / Other                                       ', NULL, N'110px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'dimgrey             ', N'30px      ', N'480px     ', N'30px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (23, N'BC-000-05', N'Header                   ', N'AL FRESCO DINING                                  ', NULL, N'260px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'40px      ', N'480px     ', N'60px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (24, N'BC-000-05', N'Company                  ', N'COMPANY NAME                                      ', NULL, N'360px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'480px     ', N'30px      ', NULL, NULL, N'lighter             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (25, N'BC-000-05', N'Title                    ', N'LOCATION                                          ', NULL, N'310px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'480px     ', N'30px      ', NULL, NULL, N'lighter             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (26, N'BC-000-06', N'Company                  ', N'Company Name                                      ', NULL, N'270px     ', NULL, N'120px     ', N'Roboto                                                                                              ', NULL, N'darkgray            ', N'35px      ', N'380px     ', N'50px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (27, N'BC-000-06', N'Agent                    ', N'Full Name                                         ', NULL, N'180px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'black               ', N'35px      ', N'500px     ', N'30px      ', NULL, NULL, N'bolder              ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (28, N'BC-000-06', N'Title                    ', N'Job Title                                         ', NULL, N'215px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'black               ', N'25px      ', N'500px     ', N'30px      ', NULL, NULL, N'lighter             ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (29, N'BC-000-06', N'Phone                    ', N'Phone / Other                                     ', NULL, N'130px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'black               ', N'25px      ', N'250px     ', N'30px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (30, N'BC-000-06', N'Email                    ', N'Email / Other                                     ', NULL, N'205px     ', NULL, N'250px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'25px      ', N'250px     ', N'30px      ', NULL, NULL, N'lighter             ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (31, N'BC-000-07', N'Agent                    ', N'FULL NAME                                         ', NULL, N'130px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'white               ', N'30px      ', N'500px     ', N'35px      ', NULL, NULL, N'ligther             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (32, N'BC-000-07', N'Title                    ', N'Job Title                                         ', NULL, N'130px     ', NULL, NULL, N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'500px     ', N'25px      ', NULL, NULL, N'ligther             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (33, N'BC-000-08', N'Company                  ', N'COMPANY NAME                                      ', NULL, N'240px     ', NULL, N'120px     ', N'Roboto                                                                                              ', NULL, N'#525654             ', N'25px      ', N'375px     ', N'30px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (34, N'BC-000-08', N'Message                  ', N'COMPANY MESSAGE                                   ', N'          ', N'390px     ', NULL, N'120px     ', N'Roboto                                                                                              ', NULL, N'#525654             ', N'15px      ', N'375px     ', N'20px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (35, N'BC-000-08', N'Agent                    ', N'Full Name                                         ', NULL, N'160px     ', NULL, NULL, N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'225px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (37, N'BC-000-08', N'Phone                    ', N'Mobile / Other                                    ', NULL, N'140px     ', NULL, NULL, N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'225px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (38, N'BC-000-08', N'Website                  ', N'Web / Other                                       ', NULL, N'150px     ', NULL, N'225px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'275px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (39, N'BC-000-08', N'Title                    ', N'Job Title                                         ', NULL, N'230px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'225px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (40, N'BC-000-08', N'Email                    ', N'Email / Other                                     ', NULL, N'210px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'225px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (41, N'BC-000-08', N'Adress_1                 ', N'Adress Line 1                                     ', NULL, N'355px     ', NULL, N'225px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'275px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (42, N'BC-000-08', N'Adress_2                 ', N'Adress Line 2                                     ', NULL, N'360px     ', NULL, N'225px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'275px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (43, N'BC-000-08', N'Other                    ', N'Phone / Other                                     ', NULL, N'350px     ', NULL, N'225px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'275px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (44, N'BC-000-09', N'Agent                    ', N'First name                                        ', NULL, N'170px     ', NULL, N'80px      ', N'Roboto                                                                                              ', NULL, N'gold                ', N'30px      ', N'400px     ', N'30px      ', NULL, NULL, N'lighter             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (45, N'BC-000-09', N'Other                    ', N'LAST NAME                                         ', NULL, N'200px     ', NULL, N'80px      ', N'Roboto                                                                                              ', NULL, N'gold                ', N'30px      ', N'400px     ', N'30px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (46, N'BC-000-09', N'Title                    ', N'job title                                         ', NULL, N'140px     ', NULL, N'80px      ', N'Roboto                                                                                              ', NULL, N'gold                ', N'20px      ', N'400px     ', N'20px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (47, N'BC-000-10', N'Company                  ', N'COMPANY                                           ', NULL, N'130px     ', NULL, NULL, N'Roboto                                                                                              ', NULL, N'black               ', N'90px      ', N'500px     ', N'95px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (48, N'BC-000-11', N'Company                  ', N'COMPANY NAME                                      ', NULL, N'250px     ', NULL, N'          ', N'Roboto                                                                                              ', NULL, N'black               ', N'35px      ', N'500px     ', N'40px      ', NULL, NULL, N'lighter             ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (49, N'BC-000-11', N'Agent                    ', N'FULL NAME                                         ', NULL, N'175px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'20px      ', N'490px     ', N'25px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (50, N'BC-000-11', N'Phone                    ', N'PHONE / OTHER                                     ', NULL, N'180px     ', NULL, N'250px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'15px      ', N'240px     ', N'20px      ', NULL, NULL, N'bold                ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (51, N'BC-000-11', N'Website                  ', N'WEB / OTHER                                       ', NULL, N'140px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'15px      ', N'240px     ', N'20px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (52, N'BC-000-11', N'Title                    ', N'JOB TITLE                                         ', NULL, N'234px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'15px      ', N'240px     ', N'20px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (53, N'BC-000-11', N'Email                    ', N'EMAIL / OTHER                                     ', NULL, N'220px     ', NULL, N'10px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'15px      ', N'240px     ', N'20px      ', NULL, NULL, N'bold                ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (54, N'BC-000-11', N'Adress_1                 ', N'ADRESS LINE 1                                     ', NULL, N'247px     ', NULL, N'250px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'15px      ', N'240px     ', N'20px      ', NULL, NULL, N'bold                ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (55, N'BC-000-11', N'Adress_2                 ', N'ADRESS LINE 2                                     ', NULL, N'248px     ', NULL, N'250px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'15px      ', N'240px     ', N'20px      ', NULL, NULL, N'bold                ', N'right               ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (56, N'R-1824-11', N'Header                   ', N'FOR SALE                                          ', NULL, N'370px     ', NULL, N'30px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'30px      ', N'300px     ', N'35px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (57, N'R-1824-11', N'Agent                    ', N'Agent Name                                        ', NULL, N'300px     ', NULL, N'120px     ', N'Roboto                                                                                              ', NULL, N'white               ', N'35px      ', N'150px     ', N'100px     ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (58, N'R-1824-11', N'Phone                    ', N'000-0000-0000                                     ', NULL, N'280px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'70px      ', N'460px     ', N'70px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (59, N'R-1824-11', N'Website                  ', N'www.yourweb.com                                   ', NULL, N'290px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'40px      ', N'460px     ', N'40px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (60, N'R-1824-11', N'Photo                    ', NULL, NULL, N'620px     ', NULL, N'260px     ', NULL, NULL, NULL, N'          ', N'220px     ', N'220px     ', N'950px     ', N'250px     ', NULL, NULL, N'round')
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (61, N'R-1824OH-5', N'Header                   ', N'Open House                                        ', NULL, N'465px     ', NULL, N'20px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'70px      ', N'390px     ', N'70px      ', NULL, NULL, N'bolder              ', N'center              ', N'')
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (62, N'R-1824OH-5', N'Agent                    ', N'Agent Name                                        ', NULL, N'300px     ', NULL, N'130px     ', N'Roboto                                                                                              ', NULL, N'#475D29             ', N'50px      ', N'350px     ', N'50px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (63, N'R-1824OH-5', N'Phone                    ', N'123-456-7890                                      ', NULL, N'280px     ', NULL, N'110px     ', N'Roboto                                                                                              ', NULL, N'#475D29             ', N'60px      ', N'370px     ', N'60px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (64, N'R-1824OH-5', N'Website                  ', N'www.website.com                                   ', NULL, N'265px     ', NULL, N'110px     ', N'Roboto                                                                                              ', NULL, N'#475D29             ', N'40px      ', N'370px     ', N'40px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (65, N'R-2418-37', N'Agent                    ', N'AGENT NAME                                        ', NULL, N'550px     ', NULL, N'40px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'90px      ', N'420px     ', N'220px     ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (66, N'R-2418-37', N'Phone                    ', N'123-456-7890                                      ', NULL, N'510px     ', NULL, N'40px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'70px      ', N'420px     ', N'70px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (67, N'R-2418-37', N'Website                  ', N'www.website.com                                   ', NULL, N'500px     ', NULL, N'40px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'50px      ', N'420px     ', N'50px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (68, N'BC-PR-000-01', N'Agent                    ', N'Mary James                                        ', NULL, N'145px     ', NULL, N'330px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'20px      ', N'150px     ', N'25px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (69, N'BC-PR-000-01', N'Phone                    ', N'631.922.5158                                      ', NULL, N'145px     ', NULL, N'330px     ', N'Roboto                                                                                              ', NULL, N'#9d0208             ', N'20px      ', N'150px     ', N'22px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (70, N'BC-PR-000-01', N'Website                  ', N'info@prealtyny.com                                ', NULL, N'175px     ', NULL, N'35px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'15px      ', N'160px     ', N'17px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (71, N'BC-PR-000-01', N'Photo                    ', NULL, NULL, N'380px     ', NULL, N'330px     ', N'Roboto                                                                                              ', NULL, NULL, NULL, N'150px     ', N'150px     ', N'          ', N'          ', NULL, NULL, N'round')
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (72, N'BC-PR-000-01', N'Title                    ', N'Lic. RE Salesperson                               ', NULL, N'357px     ', NULL, N'325px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'11px      ', N'150px     ', N'13px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (73, N'BC-PR-000-01', N'Email                    ', N'maryj@hotmail.com                                 ', NULL, N'350px     ', NULL, N'325px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'12px      ', N'150px     ', N'12px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (74, N'BC-PR-000-01', N'Other                    ', N'@premierteamli                                    ', NULL, N'352px     ', NULL, N'199px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'13px      ', N'100px     ', N'13px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (75, N'BC-PR-000-01', N'Adress_1                 ', N'150 Motor Parkway Suite 205A Hauppauge, NY 11570  ', NULL, N'520px     ', NULL, N'35px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'14px      ', N'180px     ', N'50px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (76, N'BC-PR-000-01', N'Adress_2                 ', N'Office: 516.243.7570                              ', NULL, N'530px     ', NULL, N'35px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'15px      ', N'180px     ', N'17px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (77, N'BC-PR-000-01', N'Facebook                 ', N'Mary James, Realtor                               ', NULL, N'458px     ', NULL, N'367px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'12px      ', N'130px     ', N'14px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (78, N'BC-PR-000-01', N'Instagram                ', N'@premierteamli                                    ', NULL, N'468px     ', NULL, N'375px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'12px      ', N'130px     ', N'14px      ', NULL, NULL, N'bold                ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (79, N'R-2436-4', N'Header                   ', N'For Sale                                          ', NULL, N'460px     ', NULL, N'30px      ', N'Roboto                                                                                              ', NULL, N'white               ', N'70px      ', N'300px     ', N'70px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (80, N'R-2436-4', N'Agent                    ', N'Agent Name                                        ', NULL, N'400px     ', NULL, N'30px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'40px      ', N'250px     ', N'45px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (81, N'R-2436-4', N'Phone                    ', N'123-456-789                                       ', NULL, N'510px     ', NULL, N'30px      ', N'Roboto                                                                                              ', NULL, N'black               ', N'45px      ', N'250px     ', N'50px      ', NULL, NULL, N'bolder              ', N'left                ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (82, N'R-2436-4', N'Website                  ', N'www.websitegoeshere.com                           ', NULL, N'240px     ', NULL, N'200px     ', N'Roboto                                                                                              ', NULL, N'black               ', N'25px      ', N'300px     ', N'25px      ', NULL, NULL, N'bolder              ', N'center              ', NULL)
INSERT [dbo].[labels] ([id], [template], [name], [description], [p_top], [p_bottom], [p_right], [p_left], [Font], [Font_type], [Color], [size], [width], [height], [pic_bottom], [pic_left], [font_weight], [text_position], [shape]) VALUES (83, N'R-2436-4', N'Photo                    ', NULL, NULL, N'440px     ', NULL, N'23px      ', NULL, NULL, NULL, N'          ', N'95px      ', N'150px     ', NULL, NULL, NULL, NULL, N'square')
SET IDENTITY_INSERT [dbo].[labels] OFF
GO
SET IDENTITY_INSERT [dbo].[Marketing_order_details] ON 

INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (113, 1, N'31', CAST(0 AS Decimal(18, 0)), 10, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (114, 1, N'44', CAST(0 AS Decimal(18, 0)), 15, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (115, 1, N'51', CAST(0 AS Decimal(18, 0)), 7, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (116, 1, N'52', CAST(0 AS Decimal(18, 0)), 11, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (117, 1, N'53', CAST(0 AS Decimal(18, 0)), 7, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (118, 1, N'54', CAST(0 AS Decimal(18, 0)), 10, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (119, 1, N'55', CAST(0 AS Decimal(18, 0)), 8, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (121, 2, N'56', CAST(0 AS Decimal(18, 0)), 9, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (122, 3, N'57', CAST(0 AS Decimal(18, 0)), 10, CAST(N'2021-10-03' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (123, 4, N'58', CAST(0 AS Decimal(18, 0)), 7, CAST(N'2021-10-05' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (124, 5, N'59', CAST(0 AS Decimal(18, 0)), 8, CAST(N'2021-10-05' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (125, 6, N'60', CAST(50 AS Decimal(18, 0)), 500, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (126, 6, N'61', CAST(46 AS Decimal(18, 0)), 250, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (127, 6, N'62', CAST(90 AS Decimal(18, 0)), 1, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (128, 6, N'63', CAST(208 AS Decimal(18, 0)), 8, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (129, 7, N'64', CAST(50 AS Decimal(18, 0)), 1, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (130, 8, N'65', CAST(50 AS Decimal(18, 0)), 1, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (131, 9, N'66', CAST(50 AS Decimal(18, 0)), 1, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (132, 10, N'67', CAST(255 AS Decimal(18, 0)), 3, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (133, 10, N'68', CAST(46 AS Decimal(18, 0)), 250, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (134, 11, N'70', CAST(46 AS Decimal(18, 0)), 250, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (135, 11, N'71', CAST(46 AS Decimal(18, 0)), 250, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (136, 11, N'72', CAST(255 AS Decimal(18, 0)), 3, CAST(N'2021-10-22' AS Date))
INSERT [dbo].[Marketing_order_details] ([id], [order_id], [template], [unit_price], [items], [creation_date]) VALUES (137, 12, N'73', CAST(49 AS Decimal(18, 0)), 250, CAST(N'2021-10-22' AS Date))
SET IDENTITY_INSERT [dbo].[Marketing_order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[marketing_orders] ON 

INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (1, 2, 7, CAST(50 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(N'2021-09-30' AS Date), N'pi_3JgdZGLIXevd0Zyp0Yb2KW0z', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (2, 2, 1, CAST(50 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(N'2021-10-03' AS Date), N'pi_3JgefpLIXevd0Zyp0iavwyHC', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (3, 2, 1, CAST(50 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(58 AS Decimal(18, 0)), CAST(N'2021-10-03' AS Date), N'pi_3Jgf3mLIXevd0Zyp0EtEvuZy', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (4, 2, 1, CAST(50 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2021-10-05' AS Date), N'pi_3JhMtfLIXevd0Zyp0OZ1iK2b', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (5, 2, 1, CAST(50 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2021-10-05' AS Date), N'pi_3JhPA1LIXevd0Zyp1qQDDQUF', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (6, 2, 4, CAST(419 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-21' AS Date), N'pi_3JnGmLLIXevd0Zyp0mLw3eAE', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (7, 2, 1, CAST(75 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-22' AS Date), N'pi_3JnHVOLIXevd0Zyp0AoMnNhQ', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (8, 2, 1, CAST(75 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-22' AS Date), N'pi_3JnHYeLIXevd0Zyp0zKV51Z7', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (9, 2, 1, CAST(75 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-22' AS Date), N'pi_3JnHbmLIXevd0Zyp1pohSF3b', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (10, 2, 2, CAST(326 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-22' AS Date), N'pi_3JnI4wLIXevd0Zyp0Wa6LaIL', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (11, 2, 3, CAST(372 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-22' AS Date), N'pi_3JnX0XLIXevd0Zyp0fnHSzBy', N'succeded')
INSERT [dbo].[marketing_orders] ([id], [user_id], [items], [ttl_price], [taxes], [shipping], [creation_date], [payment_intent_id], [status]) VALUES (12, 2, 1, CAST(74 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)), CAST(N'2021-10-22' AS Date), N'pi_3JnX8NLIXevd0Zyp02J17oa4', N'succeded')
SET IDENTITY_INSERT [dbo].[marketing_orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Intent] ON 

INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (7, N'pi_3JgdZGLIXevd0Zyp0Yb2KW0z', CAST(44.80 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 2, 7, N'succeded', 1)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (14, N'pi_3JgefpLIXevd0Zyp0iavwyHC', CAST(44.80 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 2, 1, N'succeded', 2)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (15, N'pi_3Jgf3mLIXevd0Zyp0EtEvuZy', CAST(58.30 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 2, 1, N'succeded', 3)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (16, N'pi_3JhMtfLIXevd0Zyp0OZ1iK2b', CAST(0.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 2, 1, N'succeded', 4)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (17, N'pi_3JhPA1LIXevd0Zyp1qQDDQUF', CAST(0.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), 2, 1, N'succeded', 5)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (18, N'pi_3JnGmLLIXevd0Zyp0mLw3eAE', CAST(24.95 AS Decimal(18, 2)), CAST(418.90 AS Decimal(18, 2)), 2, 4, N'succeded', 6)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (19, N'pi_3JnHVOLIXevd0Zyp0AoMnNhQ', CAST(24.95 AS Decimal(18, 2)), CAST(74.90 AS Decimal(18, 2)), 2, 1, N'succeded', 7)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (20, N'pi_3JnHYeLIXevd0Zyp0zKV51Z7', CAST(24.95 AS Decimal(18, 2)), CAST(74.90 AS Decimal(18, 2)), 2, 1, N'succeded', 8)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (21, N'pi_3JnHbmLIXevd0Zyp1pohSF3b', CAST(24.95 AS Decimal(18, 2)), CAST(74.90 AS Decimal(18, 2)), 2, 1, N'succeded', 9)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (22, N'pi_3JnI4wLIXevd0Zyp0Wa6LaIL', CAST(24.95 AS Decimal(18, 2)), CAST(325.80 AS Decimal(18, 2)), 2, 2, N'succeded', 10)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (23, N'pi_3JnX0XLIXevd0Zyp0fnHSzBy', CAST(24.95 AS Decimal(18, 2)), CAST(371.80 AS Decimal(18, 2)), 2, 3, N'succeded', 11)
INSERT [dbo].[Payment_Intent] ([id], [payment_intent_id], [shipping], [price], [user_id], [items], [status], [orderid]) VALUES (24, N'pi_3JnX8NLIXevd0Zyp02J17oa4', CAST(24.95 AS Decimal(18, 2)), CAST(73.95 AS Decimal(18, 2)), 2, 1, N'succeded', 12)
SET IDENTITY_INSERT [dbo].[Payment_Intent] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipts] ON 

INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (1, 2, 1, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JgdZGLIXevd0Zyp0Yb2KW0z.pdf', N'Receipt_pi_3JgdZGLIXevd0Zyp0Yb2KW0z.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (2, 2, 2, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JgefpLIXevd0Zyp0iavwyHC.pdf', N'Receipt_pi_3JgefpLIXevd0Zyp0iavwyHC.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (3, 2, 3, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3Jgf3mLIXevd0Zyp0EtEvuZy.pdf', N'Receipt_pi_3Jgf3mLIXevd0Zyp0EtEvuZy.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (4, 2, 4, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JhMtfLIXevd0Zyp0OZ1iK2b.pdf', N'Receipt_pi_3JhMtfLIXevd0Zyp0OZ1iK2b.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (5, 2, 5, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JhPA1LIXevd0Zyp1qQDDQUF.pdf', N'Receipt_pi_3JhPA1LIXevd0Zyp1qQDDQUF.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (6, 2, 6, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JnGmLLIXevd0Zyp0mLw3eAE.pdf', N'Receipt_pi_3JnGmLLIXevd0Zyp0mLw3eAE.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (7, 2, 7, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JnHVOLIXevd0Zyp0AoMnNhQ.pdf', N'Receipt_pi_3JnHVOLIXevd0Zyp0AoMnNhQ.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (8, 2, 9, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JnHbmLIXevd0Zyp1pohSF3b.pdf', N'Receipt_pi_3JnHbmLIXevd0Zyp1pohSF3b.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (9, 2, 10, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JnI4wLIXevd0Zyp0Wa6LaIL.pdf', N'Receipt_pi_3JnI4wLIXevd0Zyp0Wa6LaIL.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (10, 2, 11, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JnX0XLIXevd0Zyp0fnHSzBy.pdf', N'Receipt_pi_3JnX0XLIXevd0Zyp0fnHSzBy.pdf           ')
INSERT [dbo].[Receipts] ([id], [user_id], [order_id], [location], [file_name]) VALUES (11, 2, 12, N'C:\Users\pablo\Desktop\RealState-Master\Realestate_portal\Content\Receipts\Receipt_pi_3JnX8NLIXevd0Zyp02J17oa4.pdf', N'Receipt_pi_3JnX8NLIXevd0Zyp02J17oa4.pdf           ')
SET IDENTITY_INSERT [dbo].[Receipts] OFF
GO
SET IDENTITY_INSERT [dbo].[saved_labels] ON 

INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (142, 10, N'R-2424-32', 31, N'Vertikal Company', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (143, 11, N'R-2424-32', 31, N'Heyner Palacios', 2, N'45px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (144, 12, N'R-2424-32', 31, N'+503 7280 4308', 2, N'60px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (179, 21, N'BC-000-04', 44, N'Company Name ', 2, N'50px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (180, 22, N'BC-000-04', 44, N' Web / Other ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (221, 33, N'BC-000-08', 51, N'COMPANY NAME ', 2, N'25px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (222, 35, N'BC-000-08', 51, N'Full Name ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (223, 38, N'BC-000-08', 51, N' Web / Other ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (224, 39, N'BC-000-08', 51, N'Job Title ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (225, 37, N'BC-000-08', 51, N'Mobile / Other ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (226, 40, N'BC-000-08', 51, N'Email / Other ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (227, 34, N'BC-000-08', 51, N'COMPANY MESSAGE ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (228, 43, N'BC-000-08', 51, N'Phone / Other ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (229, 41, N'BC-000-08', 51, N'Adress Line 1 ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (230, 42, N'BC-000-08', 51, N'Adress Line 2 ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (231, 26, N'BC-000-06', 52, N'Vertikal company', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (232, 27, N'BC-000-06', 52, N'Heyner Palacios', 2, N'28px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (233, 28, N'BC-000-06', 52, N'Home Advisor', 2, N'25px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (234, 29, N'BC-000-06', 52, N'503-3233-2323', 2, N'25px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (235, 30, N'BC-000-06', 52, N'heyner.palacios@vertikal.com', 2, N'25px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (236, 44, N'BC-000-09', 53, N'Heyner Alonzo', 2, N'24px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (237, 46, N'BC-000-09', 53, N'Home sealer', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (238, 45, N'BC-000-09', 53, N'Palacios Mejia', 2, N'24px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (239, 1, N'R-1824-9', 54, N'On rent ', 2, N'45px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (240, 2, N'R-1824-9', 54, N'Vertikal Company', 2, N'60px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (241, 6, N'R-1824-9', 54, N'Agent Name ', 2, N'60px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (242, 8, N'R-1824-9', 54, N' www.yourwebsite.com ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (243, 7, N'R-1824-9', 54, N'000-000-0000 ', 2, N'60px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (244, 48, N'BC-000-11', 55, N'COMPANY NAME ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (245, 49, N'BC-000-11', 55, N'FULL NAME ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (246, 51, N'BC-000-11', 55, N' WEB / OTHER ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (247, 52, N'BC-000-11', 55, N'JOB TITLE ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (248, 50, N'BC-000-11', 55, N'PHONE / OTHER ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (249, 53, N'BC-000-11', 55, N'EMAIL / OTHER ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (250, 54, N'BC-000-11', 55, N'ADRESS LINE 1 ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (251, 55, N'BC-000-11', 55, N'ADRESS LINE 2 ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (252, 10, N'R-2424-32', 56, N'Vretikal company', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (253, 11, N'R-2424-32', 56, N'heynerpalacios', 2, N'45px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (254, 12, N'R-2424-32', 56, N'2323-2323-2322', 2, N'60px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (255, 16, N'BC-000-03', 57, N'hello ', 2, N'200px     ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (256, 17, N'BC-000-03', 57, N'FULL NAME ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (257, 18, N'BC-000-03', 57, N'TITLE ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (258, 61, N'R-1824OH-5', 58, N'On Rent ', 2, N'64px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (259, 62, N'R-1824OH-5', 58, N'Heyner Palacios', 2, N'46px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (260, 64, N'R-1824OH-5', 58, N'www.vertikalcompany.com', 2, N'32px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (261, 63, N'R-1824OH-5', 58, N'503-7234-3222', 2, N'55px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (262, 56, N'R-1824-11', 59, N'FOR SALE ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (263, 57, N'R-1824-11', 59, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (264, 59, N'R-1824-11', 59, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (265, 58, N'R-1824-11', 59, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (266, 23, N'BC-000-05', 60, N'AL FRESCO DINING ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (267, 24, N'BC-000-05', 60, N'COMPANY NAME ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (268, 25, N'BC-000-05', 60, N'LOCATIONass', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (269, 31, N'BC-000-07', 61, N'heyner', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (270, 32, N'BC-000-07', 61, N'Alonso', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (271, 56, N'R-1824-11', 62, N'FOR SALE ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (272, 57, N'R-1824-11', 62, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (273, 59, N'R-1824-11', 62, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (274, 58, N'R-1824-11', 62, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (275, 10, N'R-2424-32', 63, N'Company Name ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (276, 11, N'R-2424-32', 63, N'Agent Name ', 2, N'45px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (277, 12, N'R-2424-32', 63, N'(245) 456.7890 ', 2, N'60px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (278, 56, N'R-1824-11', 64, N'FOR SALE ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (279, 57, N'R-1824-11', 64, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (280, 59, N'R-1824-11', 64, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (281, 58, N'R-1824-11', 64, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (282, 56, N'R-1824-11', 65, N'FOR SALE ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (283, 57, N'R-1824-11', 65, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (284, 59, N'R-1824-11', 65, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (285, 58, N'R-1824-11', 65, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (286, 56, N'R-1824-11', 66, N'FOR SALE ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (287, 57, N'R-1824-11', 66, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (288, 59, N'R-1824-11', 66, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (289, 58, N'R-1824-11', 66, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (290, 56, N'R-1824-11', 67, N'FOR SALE ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (291, 57, N'R-1824-11', 67, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (292, 59, N'R-1824-11', 67, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (293, 58, N'R-1824-11', 67, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (294, 19, N'BC-000-02', 68, N'FULL NAME ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (295, 20, N'BC-000-02', 68, N'Job Title ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (298, 21, N'BC-000-04', 70, N'asas', 2, N'50px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (299, 22, N'BC-000-04', 70, N' Web / Other ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (300, 16, N'BC-000-03', 71, N'hello ', 2, N'200px     ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (301, 17, N'BC-000-03', 71, N'FULL NAME ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (302, 18, N'BC-000-03', 71, N'TITLE ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (303, 56, N'R-1824-11', 72, N'asas', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (304, 57, N'R-1824-11', 72, N'Agent Name ', 2, N'35px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (305, 59, N'R-1824-11', 72, N' www.yourweb.com ', 2, N'40px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (306, 58, N'R-1824-11', 72, N'000-0000-0000 ', 2, N'70px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (307, 19, N'BC-000-02', 73, N'FULL NAME ', 2, N'30px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (308, 20, N'BC-000-02', 73, N'Job Title ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (309, 68, N'BC-PR-000-01', 74, N'Heyner Palacios', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (310, 70, N'BC-PR-000-01', 74, N' info@prealtyny.com ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (311, 72, N'BC-PR-000-01', 74, N'Lic. RE Salesperson ', 2, N'11px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (312, 69, N'BC-PR-000-01', 74, N'631.922.5158 ', 2, N'20px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (313, 73, N'BC-PR-000-01', 74, N'maryj@hotmail.com ', 2, N'15px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (314, 74, N'BC-PR-000-01', 74, N'@premierteamli ', 2, N'12px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (315, 75, N'BC-PR-000-01', 74, N'150 Motor Parkway Suite 205A Hauppauge, NY 11570 ', 2, N'14px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (316, 76, N'BC-PR-000-01', 74, N'Office: 516.243.7570 ', 2, N'15px      ', NULL)
GO
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (317, 77, N'BC-PR-000-01', 74, N'Mary James, Realtor ', 2, N'12px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (318, 78, N'BC-PR-000-01', 74, N'@premierteamli ', 2, N'12px      ', NULL)
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (319, 79, N'R-2436-4', 75, N'For Sale ', 2, N'70px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (320, 80, N'R-2436-4', 75, N'Agent Name ', 2, N'40px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (321, 82, N'R-2436-4', 75, N' www.websitegoeshere.com ', 2, N'25px      ', N'rgb(0, 0, 0)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (322, 81, N'R-2436-4', 75, N'123-456-789 ', 2, N'45px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (323, 79, N'R-2436-4', 76, N'For Sale ', 2, N'70px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (324, 80, N'R-2436-4', 76, N'Heyner Palacios', 2, N'36px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (325, 82, N'R-2436-4', 76, N' www.websitegoeshere.com ', 2, N'25px      ', N'rgb(0, 0, 0)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (326, 81, N'R-2436-4', 76, N'123-456-789 ', 2, N'45px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (327, 79, N'R-2436-4', 77, N'On rent', 2, N'64px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (328, 80, N'R-2436-4', 77, N'Agent Name ', 2, N'40px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (329, 82, N'R-2436-4', 77, N' www.websitegoeshere.com ', 2, N'25px      ', N'rgb(0, 0, 0)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (330, 81, N'R-2436-4', 77, N'123-456-789 ', 2, N'45px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (331, 79, N'R-2436-4', 78, N'On rent', 2, N'64px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (332, 80, N'R-2436-4', 78, N'Heyner Palacios', 2, N'36px      ', N'rgb(255, 255, 255)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (333, 82, N'R-2436-4', 78, N' www.websitegoeshere.com ', 2, N'25px      ', N'rgb(0, 0, 0)')
INSERT [dbo].[saved_labels] ([id], [labelid], [templateid], [saved_template], [text], [userid], [font_size], [color]) VALUES (334, 81, N'R-2436-4', 78, N'123-456-789 ', 2, N'45px      ', N'rgb(255, 255, 255)')
SET IDENTITY_INSERT [dbo].[saved_labels] OFF
GO
SET IDENTITY_INSERT [dbo].[Saved_Templates] ON 

INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (31, NULL, N'R-2424-32', N'R-2424-32DiegoRodriguez244460.6799914583140.jpg   ', CAST(N'2021-09-21' AS Date), N'3', N'3                        ', N'1                                                 ', 0, 0, 7, 2, 3, N'Content/images/marketing/savedTemplates/R-2424-32DiegoRodriguez244460.6799914583140.jpg', 10, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (44, NULL, N'BC-000-04', N'BC-000-04DiegoRodriguez244456.688790381971.jpg    ', CAST(N'2021-09-17' AS Date), N'1', N'2                        ', N'2                                                 ', 0, 0, 7, 2, 2, N'Content/images/marketing/savedTemplates/BC-000-04DiegoRodriguez244456.688790381971.jpg', 15, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (51, NULL, N'BC-000-08', N'BC-000-08DiegoRodriguez244460.66395921357.jpg     ', CAST(N'2021-09-21' AS Date), N'2', N'2                        ', N'3                                                 ', 0, 0, 7, 2, 10, N'Content/images/marketing/savedTemplates/BC-000-08DiegoRodriguez244460.66395921357.jpg', 7, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (52, NULL, N'BC-000-06', N'BC-000-06DiegoRodriguez244460.678227870486.jpg    ', CAST(N'2021-09-21' AS Date), N'2', N'2                        ', N'3                                                 ', 0, 0, 7, 2, 5, N'Content/images/marketing/savedTemplates/BC-000-06DiegoRodriguez244460.678227870486.jpg', 11, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (53, NULL, N'BC-000-09', N'BC-000-09DiegoRodriguez244461.568687071829.jpg    ', CAST(N'2021-09-22' AS Date), N'2', N'2                        ', N'2                                                 ', 0, 0, 7, 2, 3, N'Content/images/marketing/savedTemplates/BC-000-09DiegoRodriguez244461.568687071829.jpg', 7, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (54, NULL, N'R-1824-9', N'R-1824-9DiegoRodriguez244462.4691717014123.jpg    ', CAST(N'2021-09-23' AS Date), N'3', N'3                        ', N'1                                                 ', 0, 0, 7, 2, 5, N'Content/images/marketing/savedTemplates/R-1824-9DiegoRodriguez244462.4691717014123.jpg', 10, 1, N'Content/images/marketing/photos/R-1824-9DiegoRodriguez244462.468014050944.jpg', NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (55, NULL, N'BC-000-11', N'BC-000-11DiegoRodriguez244466.7118447454113.jpg   ', CAST(N'2021-09-27' AS Date), N'2', N'3                        ', N'2                                                 ', 0, 0, 7, 2, 8, N'Content/images/marketing/savedTemplates/BC-000-11DiegoRodriguez244466.7118447454113.jpg', 8, 1, NULL, NULL, CAST(0.00 AS Decimal(18, 2)), NULL, 1, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (56, NULL, N'R-2424-32', N'R-2424-32DiegoRodriguez244472.729469537138.jpg    ', CAST(N'2021-10-03' AS Date), N'2', N'4                        ', N'3                                                 ', 0, 0, 7, 2, 3, N'Content/images/marketing/savedTemplates/R-2424-32DiegoRodriguez244472.729469537138.jpg', 9, 1, NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (57, NULL, N'BC-000-03', N'BC-000-03DiegoRodriguez244472.768875069432.jpg    ', CAST(N'2021-10-03' AS Date), N'2', N'2                        ', N'3                                                 ', 0, 0, 7, 2, 3, N'Content/images/marketing/savedTemplates/BC-000-03DiegoRodriguez244472.768875069432.jpg', 10, 1, NULL, NULL, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (58, NULL, N'R-1824OH-5', N'R-1824OH-5DiegoRodriguez244474.717910937531.jpg   ', CAST(N'2021-10-05' AS Date), N'2', N'2                        ', N'2                                                 ', 0, 0, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824OH-5DiegoRodriguez244474.717910937531.jpg', 7, 1, NULL, NULL, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (59, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244474.82061672455.jpg     ', CAST(N'2021-10-05' AS Date), N'2', N'2                        ', N'3                                                 ', 0, 0, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244474.82061672455.jpg', 8, 1, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (60, NULL, N'BC-000-05', N'BC-000-05DiegoRodriguez244490.8905919907117.jpg', CAST(N'2021-10-21' AS Date), N'Single Sided 14 Pt Stock', NULL, NULL, NULL, NULL, 7, 2, 3, N'Content/images/marketing/savedTemplates/BC-000-05DiegoRodriguez244490.8905919907117.jpg', 500, 1, NULL, NULL, CAST(50.00 AS Decimal(18, 2)), N'asas', 6, 5, 2)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (61, NULL, N'BC-000-07', N'BC-000-07DiegoRodriguez244490.951756678298.jpg', CAST(N'2021-10-21' AS Date), N'Single Sided 18 Pt Stock', NULL, NULL, NULL, NULL, 7, 2, 2, N'Content/images/marketing/savedTemplates/BC-000-07DiegoRodriguez244490.951756678298.jpg', 250, 1, NULL, NULL, CAST(46.00 AS Decimal(18, 2)), N'sasa', 6, NULL, 2)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (62, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244490.958969097219.jpg', CAST(N'2021-10-21' AS Date), N'A frame', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244490.958969097219.jpg', 1, 1, N'Content/images/marketing/photos/R-1824-11DiegoRodriguez244490.958969097219.jpg', NULL, CAST(89.95 AS Decimal(18, 2)), N'', 6, NULL, 6)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (63, NULL, N'R-2424-32', N'R-2424-32DiegoRodriguez244490.968036226938.jpg', CAST(N'2021-10-21' AS Date), N'Replacement Panels', NULL, NULL, NULL, NULL, 7, 2, 3, N'Content/images/marketing/savedTemplates/R-2424-32DiegoRodriguez244490.968036226938.jpg', 8, 1, NULL, NULL, CAST(208.00 AS Decimal(18, 2)), N'', 6, NULL, 7)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (64, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244491.03058921392.jpg', CAST(N'2021-10-22' AS Date), N'Single Panel Round Rod Signs', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244491.03058921392.jpg', 1, 1, NULL, NULL, CAST(49.95 AS Decimal(18, 2)), N'', 7, NULL, 8)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (65, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244491.033554131952.jpg', CAST(N'2021-10-22' AS Date), N'Single Panel Round Rod Signs', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244491.033554131952.jpg', 1, 1, NULL, NULL, CAST(49.95 AS Decimal(18, 2)), N'', 8, NULL, 8)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (66, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244491.03585069444.jpg', CAST(N'2021-10-22' AS Date), N'Single Panel Round Rod Signs', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244491.03585069444.jpg', 1, 1, NULL, NULL, CAST(49.95 AS Decimal(18, 2)), N'', 9, NULL, 8)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (67, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244491.056076192110.jpg', CAST(N'2021-10-22' AS Date), N'A frame', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244491.056076192110.jpg', 3, 1, NULL, NULL, CAST(254.85 AS Decimal(18, 2)), N'', 10, NULL, 6)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (68, NULL, N'BC-000-02', N'BC-000-02DiegoRodriguez244491.056494768535.jpg', CAST(N'2021-10-22' AS Date), N'Single Sided 18 Pt Stock', NULL, NULL, NULL, NULL, 7, 2, 2, N'Content/images/marketing/savedTemplates/BC-000-02DiegoRodriguez244491.056494768535.jpg', 250, 1, NULL, NULL, CAST(46.00 AS Decimal(18, 2)), N'', 10, NULL, 2)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (70, NULL, N'BC-000-04', N'BC-000-04DiegoRodriguez244491.688066041710.jpg', CAST(N'2021-10-22' AS Date), N'Single Sided 18 Pt Stock', NULL, NULL, NULL, NULL, 7, 2, 2, N'Content/images/marketing/savedTemplates/BC-000-04DiegoRodriguez244491.688066041710.jpg', 250, 1, NULL, NULL, CAST(46.00 AS Decimal(18, 2)), N'', 11, NULL, 2)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (71, NULL, N'BC-000-03', N'BC-000-03DiegoRodriguez244491.688574155146.jpg', CAST(N'2021-10-22' AS Date), N'Single Sided 18 Pt Stock', NULL, NULL, NULL, NULL, 7, 2, 3, N'Content/images/marketing/savedTemplates/BC-000-03DiegoRodriguez244491.688574155146.jpg', 250, 1, NULL, NULL, CAST(46.00 AS Decimal(18, 2)), N'', 11, NULL, 2)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (72, NULL, N'R-1824-11', N'R-1824-11DiegoRodriguez244491.7198518518116.jpg', CAST(N'2021-10-22' AS Date), N'A frame', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-1824-11DiegoRodriguez244491.7198518518116.jpg', 3, 1, NULL, NULL, CAST(254.85 AS Decimal(18, 2)), N'', 11, NULL, 7)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (73, NULL, N'BC-000-02', N'BC-000-02DiegoRodriguez244491.7257435301122.jpg', CAST(N'2021-10-22' AS Date), N'Double Sided 14 Pt Stock', NULL, NULL, NULL, NULL, 7, 2, 2, N'Content/images/marketing/savedTemplates/BC-000-02DiegoRodriguez244491.7257435301122.jpg', 250, 1, NULL, NULL, CAST(49.00 AS Decimal(18, 2)), N'', 12, NULL, 4)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (74, NULL, N'BC-PR-000-01', N'BC-PR-000-01DiegoRodriguez244492.718451446837.jpg', CAST(N'2021-10-23' AS Date), N'Double Sided 14 Pt Stock', NULL, NULL, NULL, NULL, 9, 2, 10, N'Content/images/marketing/savedTemplates/BC-PR-000-01DiegoRodriguez244492.718451446837.jpg', 1000, 0, N'Content/images/marketing/photos/BC-PR-000-01DiegoRodriguez244492.64928422452.jpg', NULL, CAST(60.00 AS Decimal(18, 2)), N'', NULL, NULL, 1)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (75, N'ndefined', N'R-2436-4', N'R-2436-4DiegoRodriguez244493.924001296389.jpg', CAST(N'2021-10-24' AS Date), N'Replacement Panels', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-2436-4DiegoRodriguez244493.924001296389.jpg', 2, 0, NULL, NULL, NULL, N'', NULL, NULL, 7)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (76, N'ndefined', N'R-2436-4', N'R-2436-4DiegoRodriguez244493.9282033333134.jpg', CAST(N'2021-10-24' AS Date), N'Replacement Panels', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-2436-4DiegoRodriguez244493.9282033333134.jpg', 2, 0, NULL, NULL, NULL, N'', NULL, NULL, 7)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (77, N'ndefined', N'R-2436-4', N'R-2436-4DiegoRodriguez244493.936767627311.jpg', CAST(N'2021-10-24' AS Date), N'A frame', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-2436-4DiegoRodriguez244493.936767627311.jpg', 1, 0, NULL, NULL, CAST(89.95 AS Decimal(18, 2)), N'', NULL, NULL, 6)
INSERT [dbo].[Saved_Templates] ([id], [path], [Templateid], [description], [Creation_date], [Material], [Size], [Holes], [Laminate], [clearcoat], [category], [user_id], [label_num], [location], [amount], [completed], [photo_path], [logo_path], [price], [Comments], [orderid], [type], [dimension]) VALUES (78, N'Content/images/marketing/EmptyTemplates/YardSigns/R-2436-4-white.jpg', N'R-2436-4', N'R-2436-4DiegoRodriguez244493.9581798495111.jpg', CAST(N'2021-10-24' AS Date), N'Single Panel Round Rod Signs', NULL, NULL, NULL, NULL, 7, 2, 4, N'Content/images/marketing/savedTemplates/R-2436-4DiegoRodriguez244493.9581798495111.jpg', 3, 0, NULL, NULL, NULL, N'', NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[Saved_Templates] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping_Details] ON 

INSERT [dbo].[Shipping_Details] ([id], [carrier], [price], [type], [dates]) VALUES (1, N'Sample', CAST(0.00 AS Decimal(18, 2)), N'Normal', 7)
INSERT [dbo].[Shipping_Details] ([id], [carrier], [price], [type], [dates]) VALUES (3, N'Sample', CAST(44.80 AS Decimal(18, 2)), N'Semi Express', 5)
INSERT [dbo].[Shipping_Details] ([id], [carrier], [price], [type], [dates]) VALUES (5, N'Sample', CAST(58.30 AS Decimal(18, 2)), N'Express 2', 3)
INSERT [dbo].[Shipping_Details] ([id], [carrier], [price], [type], [dates]) VALUES (6, N'Sample', CAST(133.11 AS Decimal(18, 2)), N'Ultra express', 1)
SET IDENTITY_INSERT [dbo].[Shipping_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[signs_description] ON 

INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (1, N'Black painted metal A-Frame sign with 2 - 4mm Bubble-X panels printed in full color. ', 6)
INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (2, N'NO frame', 7)
INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (3, N'Black powder coated round rod frames with pointed ends for easy ground installation. Includes a 24" x 18" 4mm Bubble-X sign panel printed in color on both sides.', 8)
INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (4, N'None', 1)
INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (5, N'None', 2)
INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (7, N'None', 4)
INSERT [dbo].[signs_description] ([id], [description], [dimension]) VALUES (8, N'None', 5)
SET IDENTITY_INSERT [dbo].[signs_description] OFF
GO
SET IDENTITY_INSERT [dbo].[Template_categories] ON 

INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (2, N'Baird & Werner           ', N'Content/images/marketing/Companies/b&w.jpg')
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (3, N'Berkshire                ', N'Content/images/marketing/Companies/berkshire.jpg')
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (4, N'Better Home And Gardens  ', N'Content/images/marketing/Companies/bhg.jpg')
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (5, N'Century 21               ', N'Content/images/marketing/Companies/century21.jpg')
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (6, N'Coldwell                 ', N'Content/images/marketing/Companies/coldwell.jpg')
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (7, N'Independent Realtor      ', NULL)
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (8, N'Vivid Homes              ', N'Content/images/marketing/Companies/vividhomes.jpg')
INSERT [dbo].[Template_categories] ([id], [category], [path]) VALUES (9, N'Premium Group Realty     ', N'Content/images/marketing/Companies/premiumgrouprealty.jpg')
SET IDENTITY_INSERT [dbo].[Template_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Template_colors] ON 

INSERT [dbo].[Template_colors] ([id], [templateid], [color], [path]) VALUES (1, N'R-2436-4', N'black', N'Content/images/marketing/ColorTemplate/R-2436-4-white-(black).jpg')
INSERT [dbo].[Template_colors] ([id], [templateid], [color], [path]) VALUES (2, N'R-2436-4', N'red', N'Content/images/marketing/ColorTemplate/R-2436-4-white-(red).jpg')
INSERT [dbo].[Template_colors] ([id], [templateid], [color], [path]) VALUES (4, N'R-2436-4', N'#EF5F23', N'Content/images/marketing/EmptyTemplates/YardSigns/R-2436-4-white.jpg')
SET IDENTITY_INSERT [dbo].[Template_colors] OFF
GO
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-02', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-02.jfif', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-02-cleaned.jpg', N'BC-000-02-cleaned.jpg', 0, 0, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"380px"', N'"223px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-03', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-03.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-03-cleaned.jpg', N'BC-000-03-cleaned.jpg', 1, 0, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"624px"', N'"339px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-04', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-04.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-04-cleaned.jpg', N'BC-000-04-cleaned.jpg', 0, 1, 0, 0, 0, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"611px"', N'"342px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-05', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-05.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-05-cleaned.jpg', N'BC-000-05-cleaned.jpg', 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"623px"', N'"342px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-06', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-06.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-06-cleaned.jpg', N'BC-000-06-cleaned.jpg', 0, 1, 1, 1, 1, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"628px"', N'"342px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-07', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-07.PNG', N'500px', N'300px', N'
Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-07-cleaned.jpg
', N'BC-000-07-cleaned.jpg', 0, 0, 1, 0, 0, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"599px"', N'"326px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-08', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-08.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-08-cleaned.jpg', N'BC-000-08-cleaned.jpg', 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 0, NULL, N'"601px"', N'"332px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-09', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-09.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-09-cleaned.jpg', N'BC-000-09-cleaned.jpg', 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, NULL, NULL, 0, N'', N'"736px"', N'"452px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-10', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-10.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-10-cleaned.jpg', N'BC-000-10-cleaned.jpg', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, N'False', N'"564px"', N'"307px"', N'"500px"', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-000-11', 7, N'Content/images/marketing/Templates/BussinesCards/BC-000-11.PNG', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-000-11-cleaned.jpg', N'BC-000-11-cleaned.jpg', 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, NULL, NULL, 0, NULL, N'"572px"', N'"311px"', N'"500px', N'"300px"', NULL, 5, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'BC-PR-000-01', 9, N'Content/images/marketing/Templates/BussinesCards/BC-PR-000-01.jpg', N'500px', N'300px', N'Content/images/marketing/EmptyTemplates/BussinesCards/BC-PR-000-01-cleaned.jpg', N'BC-PR-000-01-cleaned.jpg', 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, NULL, NULL, 1, N'Content/images/marketing/EmptyTemplates/Photos/profile-pic-round.png', N'"524px"', N'"337px"', N'"500px"', N'"300px"', NULL, 5, NULL, 1)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-1824-11', 7, N'Content/images/marketing/Templates/YardSigns/R-1824-11.png', N'500px', N'400px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-1824-11-blank.jpg', N'R-1824-11-blank.jpg', 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, N'Content/images/marketing/EmptyTemplates/Photos/profile-pic-round.png', N'"450px"', N'"338px"', N'"700px"', N'"500px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-1824-9', 7, N'Content/images/marketing/Templates/YardSigns/R-1824-9.jpg', N'500px', N'500px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-1824-9-Blank.png', N'R-1824-9-Blank.png', 0, 1, 1, 1, 1, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Content/images/marketing/EmptyTemplates/Photos/Girl-profile-Picture.jpg', N'"1728px"', N'"1296px"', N'"700px"', N'"500px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-1824OH-5', 7, N'Content/images/marketing/Templates/YardSigns/R-1824OH-5.png', N'500px', N'500px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-1824OH-5-white.jpg', N'R-1824OH-5-white.jpg', 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, N'', N'"450px"', N'"338px"', N'"700px"', N'"500px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-2418-37', 7, N'Content/images/marketing/Templates/YardSigns/R-2418-37.png', N'500px', N'600px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-2418-37-white.jpg
', N'R-2418-37-white.jpg', 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'"450px"', N'"600px"', N'"700px"', N'"600px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-2424-32', 7, N'Content/images/marketing/Templates/YardSigns/R-2424-32.png', N'500px', N'500px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-2424-32.white.jpg', N'R-2424-32.white.jpg', 0, 1, 1, 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"450px"', N'"450px"', N'"700px"', N'"500px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-2436-4', 7, N'Content/images/marketing/Templates/YardSigns/R-2436-4.png', N'500px', N'500px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-2436-4-white.jpg', N'R-2436-4-white.jpg', 1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 1, N'
Content/images/marketing/EmptyTemplates/Photos/profile-square.jpg', N'"450px"', N'"300px"', N'"700px"', N'400px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-2524-29', 7, N'Content/images/marketing/Templates/YardSigns/R-2524-29.png', N'500px', N'500px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-2524-29-white.jpg', N'R-2524-29-white.jpg', 0, 0, 1, 1, 0, 1, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, N'"450px"', N'"469px"', N'"700px"', N'"500px"', NULL, 3, NULL, NULL)
INSERT [dbo].[Template_Details] ([id], [category], [path], [width], [height], [cleaned_path], [cleaned_name], [header], [company_name], [agent_name], [phone], [photo], [logo], [website], [title], [email], [message], [other], [adress_1], [adress_2], [instagram], [facebook], [profile_pic], [pic_path], [original_width], [original_height], [saved_width], [saved_height], [logo_path], [type], [price], [pic_round]) VALUES (N'R-OHAR-21', 7, N'Content/images/marketing/Templates/YardSigns/R-OHAR-21.png', N'500px', N'500px', N'Content/images/marketing/EmptyTemplates/YardSigns/R-OHAR-21-white.jpg', N'R-OHAR-21-white.jpg', 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, N'', N'"450px"', N'"338px"', N'"700px"', N'"500px"', NULL, 3, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Template_dimensions] ON 

INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (1, N'Single Sided 14 Pt Stock', 5)
INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (2, N'Single Sided 18 Pt Stock', 5)
INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (4, N'Double Sided 14 Pt Stock', 5)
INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (5, N'Double Sided 18 Pt Stock', 5)
INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (6, N'A frame', 3)
INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (7, N'Replacement Panels', 3)
INSERT [dbo].[Template_dimensions] ([id], [dimensions], [type]) VALUES (8, N'Single Panel Round Rod Signs', 3)
SET IDENTITY_INSERT [dbo].[Template_dimensions] OFF
GO
SET IDENTITY_INSERT [dbo].[template_pricing] ON 

INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (1, CAST(44.00 AS Decimal(18, 2)), 1, 250)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (2, CAST(50.00 AS Decimal(18, 2)), 1, 500)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (3, CAST(55.00 AS Decimal(18, 2)), 1, 1000)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (4, CAST(46.00 AS Decimal(18, 2)), 2, 250)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (5, CAST(53.00 AS Decimal(18, 2)), 2, 500)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (6, CAST(61.00 AS Decimal(18, 2)), 2, 1000)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (11, CAST(49.00 AS Decimal(18, 2)), 4, 250)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (12, CAST(55.00 AS Decimal(18, 2)), 4, 500)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (13, CAST(60.00 AS Decimal(18, 2)), 4, 1000)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (14, CAST(51.00 AS Decimal(18, 2)), 5, 250)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (15, CAST(58.00 AS Decimal(18, 2)), 5, 500)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (16, CAST(66.00 AS Decimal(18, 2)), 5, 1000)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (17, CAST(89.95 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (18, CAST(169.90 AS Decimal(18, 2)), 6, 2)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (19, CAST(254.85 AS Decimal(18, 2)), 6, 3)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (20, CAST(331.80 AS Decimal(18, 2)), 6, 4)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (21, CAST(414.75 AS Decimal(18, 2)), 6, 5)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (22, CAST(60.00 AS Decimal(18, 2)), 7, 2)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (23, CAST(112.00 AS Decimal(18, 2)), 7, 4)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (24, CAST(168.00 AS Decimal(18, 2)), 7, 6)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (25, CAST(208.00 AS Decimal(18, 2)), 7, 8)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (26, CAST(260.00 AS Decimal(18, 2)), 7, 10)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (27, CAST(49.95 AS Decimal(18, 2)), 8, 1)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (28, CAST(95.00 AS Decimal(18, 2)), 8, 2)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (29, CAST(139.95 AS Decimal(18, 2)), 8, 3)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (30, CAST(179.95 AS Decimal(18, 2)), 8, 4)
INSERT [dbo].[template_pricing] ([id], [price], [dimensions], [quantity]) VALUES (31, CAST(224.95 AS Decimal(18, 2)), 8, 5)
SET IDENTITY_INSERT [dbo].[template_pricing] OFF
GO
SET IDENTITY_INSERT [dbo].[Template_type] ON 

INSERT [dbo].[Template_type] ([id], [type]) VALUES (3, N'Yard Sign Panel     ')
INSERT [dbo].[Template_type] ([id], [type]) VALUES (5, N'Bussines Cards      ')
SET IDENTITY_INSERT [dbo].[Template_type] OFF
GO
ALTER TABLE [dbo].[Billing_Shipping_details]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Shipping_details_marketing_orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[marketing_orders] ([id])
GO
ALTER TABLE [dbo].[Billing_Shipping_details] CHECK CONSTRAINT [FK_Billing_Shipping_details_marketing_orders]
GO
ALTER TABLE [dbo].[Billing_Shipping_details]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Shipping_details_Sys_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Sys_Users] ([ID_User])
GO
ALTER TABLE [dbo].[Billing_Shipping_details] CHECK CONSTRAINT [FK_Billing_Shipping_details_Sys_Users]
GO
ALTER TABLE [dbo].[label_color]  WITH CHECK ADD  CONSTRAINT [FK_label_color_label_color] FOREIGN KEY([templateid])
REFERENCES [dbo].[Template_Details] ([id])
GO
ALTER TABLE [dbo].[label_color] CHECK CONSTRAINT [FK_label_color_label_color]
GO
ALTER TABLE [dbo].[label_color]  WITH CHECK ADD  CONSTRAINT [FK_label_color_labels] FOREIGN KEY([labelid])
REFERENCES [dbo].[labels] ([id])
GO
ALTER TABLE [dbo].[label_color] CHECK CONSTRAINT [FK_label_color_labels]
GO
ALTER TABLE [dbo].[labels]  WITH CHECK ADD  CONSTRAINT [FK_labels_Templates] FOREIGN KEY([template])
REFERENCES [dbo].[Template_Details] ([id])
GO
ALTER TABLE [dbo].[labels] CHECK CONSTRAINT [FK_labels_Templates]
GO
ALTER TABLE [dbo].[Marketing_order_details]  WITH CHECK ADD  CONSTRAINT [FK_Marketing_order_details_marketing_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[marketing_orders] ([id])
GO
ALTER TABLE [dbo].[Marketing_order_details] CHECK CONSTRAINT [FK_Marketing_order_details_marketing_orders]
GO
ALTER TABLE [dbo].[marketing_orders]  WITH CHECK ADD  CONSTRAINT [FK_marketing_orders_Sys_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Sys_Users] ([ID_User])
GO
ALTER TABLE [dbo].[marketing_orders] CHECK CONSTRAINT [FK_marketing_orders_Sys_Users]
GO
ALTER TABLE [dbo].[Payment_Intent]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Intent_marketing_orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[marketing_orders] ([id])
GO
ALTER TABLE [dbo].[Payment_Intent] CHECK CONSTRAINT [FK_Payment_Intent_marketing_orders]
GO
ALTER TABLE [dbo].[Payment_Intent]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Intent_Sys_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Sys_Users] ([ID_User])
GO
ALTER TABLE [dbo].[Payment_Intent] CHECK CONSTRAINT [FK_Payment_Intent_Sys_Users]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_marketing_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[marketing_orders] ([id])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_marketing_orders]
GO
ALTER TABLE [dbo].[Receipts]  WITH CHECK ADD  CONSTRAINT [FK_Receipts_Sys_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Sys_Users] ([ID_User])
GO
ALTER TABLE [dbo].[Receipts] CHECK CONSTRAINT [FK_Receipts_Sys_Users]
GO
ALTER TABLE [dbo].[saved_labels]  WITH CHECK ADD  CONSTRAINT [FK_saved_labels_labels] FOREIGN KEY([labelid])
REFERENCES [dbo].[labels] ([id])
GO
ALTER TABLE [dbo].[saved_labels] CHECK CONSTRAINT [FK_saved_labels_labels]
GO
ALTER TABLE [dbo].[saved_labels]  WITH CHECK ADD  CONSTRAINT [FK_saved_labels_Sys_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Sys_Users] ([ID_User])
GO
ALTER TABLE [dbo].[saved_labels] CHECK CONSTRAINT [FK_saved_labels_Sys_Users]
GO
ALTER TABLE [dbo].[saved_labels]  WITH CHECK ADD  CONSTRAINT [FK_saved_labels_Template_Details] FOREIGN KEY([templateid])
REFERENCES [dbo].[Template_Details] ([id])
GO
ALTER TABLE [dbo].[saved_labels] CHECK CONSTRAINT [FK_saved_labels_Template_Details]
GO
ALTER TABLE [dbo].[Saved_Templates]  WITH CHECK ADD  CONSTRAINT [FK_Saved_Templates_marketing_orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[marketing_orders] ([id])
GO
ALTER TABLE [dbo].[Saved_Templates] CHECK CONSTRAINT [FK_Saved_Templates_marketing_orders]
GO
ALTER TABLE [dbo].[Saved_Templates]  WITH CHECK ADD  CONSTRAINT [FK_Saved_Templates_Template_Details] FOREIGN KEY([Templateid])
REFERENCES [dbo].[Template_Details] ([id])
GO
ALTER TABLE [dbo].[Saved_Templates] CHECK CONSTRAINT [FK_Saved_Templates_Template_Details]
GO
ALTER TABLE [dbo].[Saved_Templates]  WITH CHECK ADD  CONSTRAINT [FK_Saved_Templates_Template_dimensions] FOREIGN KEY([dimension])
REFERENCES [dbo].[Template_dimensions] ([id])
GO
ALTER TABLE [dbo].[Saved_Templates] CHECK CONSTRAINT [FK_Saved_Templates_Template_dimensions]
GO
ALTER TABLE [dbo].[Saved_Templates]  WITH CHECK ADD  CONSTRAINT [FK_Saved_Templates_Template_type] FOREIGN KEY([type])
REFERENCES [dbo].[Template_type] ([id])
GO
ALTER TABLE [dbo].[Saved_Templates] CHECK CONSTRAINT [FK_Saved_Templates_Template_type]
GO
ALTER TABLE [dbo].[Saved_Templates]  WITH CHECK ADD  CONSTRAINT [FK_Templates_Sys_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Sys_Users] ([ID_User])
GO
ALTER TABLE [dbo].[Saved_Templates] CHECK CONSTRAINT [FK_Templates_Sys_Users]
GO
ALTER TABLE [dbo].[Saved_Templates]  WITH CHECK ADD  CONSTRAINT [FK_Templates_Template_category] FOREIGN KEY([category])
REFERENCES [dbo].[Template_categories] ([id])
GO
ALTER TABLE [dbo].[Saved_Templates] CHECK CONSTRAINT [FK_Templates_Template_category]
GO
ALTER TABLE [dbo].[signs_description]  WITH CHECK ADD  CONSTRAINT [FK_signs_description_Template_dimensions] FOREIGN KEY([dimension])
REFERENCES [dbo].[Template_dimensions] ([id])
GO
ALTER TABLE [dbo].[signs_description] CHECK CONSTRAINT [FK_signs_description_Template_dimensions]
GO
ALTER TABLE [dbo].[Template_colors]  WITH CHECK ADD  CONSTRAINT [FK_Template_colors_Template_Details] FOREIGN KEY([templateid])
REFERENCES [dbo].[Template_Details] ([id])
GO
ALTER TABLE [dbo].[Template_colors] CHECK CONSTRAINT [FK_Template_colors_Template_Details]
GO
ALTER TABLE [dbo].[Template_Details]  WITH CHECK ADD  CONSTRAINT [FK_Template_Details_Template_categories] FOREIGN KEY([category])
REFERENCES [dbo].[Template_categories] ([id])
GO
ALTER TABLE [dbo].[Template_Details] CHECK CONSTRAINT [FK_Template_Details_Template_categories]
GO
ALTER TABLE [dbo].[Template_Details]  WITH CHECK ADD  CONSTRAINT [FK_Template_Details_Template_type] FOREIGN KEY([type])
REFERENCES [dbo].[Template_type] ([id])
GO
ALTER TABLE [dbo].[Template_Details] CHECK CONSTRAINT [FK_Template_Details_Template_type]
GO
ALTER TABLE [dbo].[Template_dimensions]  WITH CHECK ADD  CONSTRAINT [FK_Template_dimensions_Template_type] FOREIGN KEY([type])
REFERENCES [dbo].[Template_type] ([id])
GO
ALTER TABLE [dbo].[Template_dimensions] CHECK CONSTRAINT [FK_Template_dimensions_Template_type]
GO
ALTER TABLE [dbo].[template_pricing]  WITH CHECK ADD  CONSTRAINT [FK_template_pricing_Template_dimensions] FOREIGN KEY([dimensions])
REFERENCES [dbo].[Template_dimensions] ([id])
GO
ALTER TABLE [dbo].[template_pricing] CHECK CONSTRAINT [FK_template_pricing_Template_dimensions]
GO
