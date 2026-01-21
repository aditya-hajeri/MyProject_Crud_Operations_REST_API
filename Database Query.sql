USE [Curde_Operations]
GO
/****** Object:  Table [dbo].[Product_Details] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Details](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Price] [decimal](18, 0) NULL,
	[Office] [nvarchar](20) NULL,
 CONSTRAINT [PK_Product_Details] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product_Details] ON 
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (1, N'TTTT', CAST(11111 AS Decimal(18, 0)), N'Pune')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (3, N'CCC       ', CAST(4000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (4, N'DDD       ', CAST(6000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (5, N'EEE       ', CAST(2000 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (6, N'TTT', CAST(7000 AS Decimal(18, 0)), N'Y')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (7, N'III', CAST(700000 AS Decimal(18, 0)), N'Y')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (8, N'ee', CAST(330 AS Decimal(18, 0)), N's')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (9, N'rr', CAST(3330 AS Decimal(18, 0)), N'q')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (10, N'ooooo', CAST(9990 AS Decimal(18, 0)), N'f')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (11, N'Hanuman', CAST(111111 AS Decimal(18, 0)), N'Lanka')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (12, N'Krishana', CAST(900000 AS Decimal(18, 0)), N'Dvarka')
GO
INSERT [dbo].[Product_Details] ([Product_Id], [Name], [Price], [Office]) VALUES (13, N'Ram', CAST(8000000 AS Decimal(18, 0)), N'A')
GO
SET IDENTITY_INSERT [dbo].[Product_Details] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateProduct]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adityasing Hajeri
-- Description:	Create Product
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateProduct] 
	-- Add the parameters for the stored procedure here
	@Name nvarchar(20), @Price decimal, @Office nvarchar
AS
BEGIN
	insert into Product_Details (Name, Price, Office) values (@Name, @Price, @Office)
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteProduct]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adityasing Hajeri
-- Description:	Create Product
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteProduct] 
	-- Add the parameters for the stored procedure here
	@Product_Id int
AS
BEGIN
	delete from Product_Details where Product_Id = @Product_Id
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllProducts]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adityasing Hajeri
-- Description:	Featch All Product
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAllProducts]

AS
BEGIN
	SELECT * FROM Product_Details
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetProductById]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adityasing Hajeri
-- Description:	Featch Product
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetProductById]
	@Product_Id decimal
AS
BEGIN
	Select * from Product_Details
	where Product_Id = @Product_Id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_Patch_Product] 41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Update_Patch_Product]
	@Product_Id INT,
    @Name    NVARCHAR(100) = NULL,
    @Price   DECIMAL(10,2) = NULL,
    @Office  NVARCHAR(100) = NULL
as
update Product_Details 
SET
      Name = COALESCE(NULLIF(@Name, 'null'), Name),
      Office = COALESCE(NULLIF(@Office, 'null'), Office),
      Price = COALESCE(@Price, Price)
WHERE Product_Id = @Product_Id;

SELECT @@ROWCOUNT;
GO
