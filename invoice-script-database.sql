USE [invoicing]
GO
/****** Object:  Table [dbo].[client]    Script Date: 25/03/2022 6:54:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[idclient] [int] IDENTITY(1,1) NOT NULL,
	[document] [varchar](15) NULL,
	[firstname] [varchar](80) NOT NULL,
	[lastname] [varchar](80) NOT NULL,
	[phone] [varchar](16) NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[idclient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 25/03/2022 6:54:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[idinvoice] [int] IDENTITY(1,1) NOT NULL,
	[idclient] [int] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[idinvoice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoiceproduct]    Script Date: 25/03/2022 6:54:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoiceproduct](
	[idinvoiceproduct] [int] IDENTITY(1,1) NOT NULL,
	[idinvoice] [int] NOT NULL,
	[idproduct] [int] NOT NULL,
	[value] [decimal](18, 0) NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_invoiceproduct] PRIMARY KEY CLUSTERED 
(
	[idinvoiceproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 25/03/2022 6:54:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[idproduct] [int] IDENTITY(1,1) NOT NULL,
	[productname] [varchar](255) NOT NULL,
	[value] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[idproduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [fkinvoiceclient] FOREIGN KEY([idclient])
REFERENCES [dbo].[client] ([idclient])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [fkinvoiceclient]
GO
ALTER TABLE [dbo].[invoiceproduct]  WITH CHECK ADD  CONSTRAINT [fkIPidinvoice] FOREIGN KEY([idinvoice])
REFERENCES [dbo].[invoice] ([idinvoice])
GO
ALTER TABLE [dbo].[invoiceproduct] CHECK CONSTRAINT [fkIPidinvoice]
GO
ALTER TABLE [dbo].[invoiceproduct]  WITH CHECK ADD  CONSTRAINT [fkIPidproduct] FOREIGN KEY([idproduct])
REFERENCES [dbo].[product] ([idproduct])
GO
ALTER TABLE [dbo].[invoiceproduct] CHECK CONSTRAINT [fkIPidproduct]
GO
