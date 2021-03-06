
CREATE DATABASE Test1
 ON 
( NAME = Test, 
	FILENAME = 'E:\Test1.mdf' , 
	SIZE = 10MB , 
	MAXSIZE = 30MB, 
	FILEGROWTH = 1MB )
 LOG ON 
( NAME = Test1_log, 
	FILENAME = 'E:\Test1_log.ldf' , 
	SIZE = 10MB ,
	 MAXSIZE = 30MB , 
	 FILEGROWTH = 1MB )
COLLATE Chinese_PRC_CS_AS;
GO
Use Test1;
GO
CREATE TABLE [dbo].[Category] (
    [CategoryId]    INT           IDENTITY (1, 1) NOT NULL,
    [CategoryName]  NVARCHAR (80) NOT NULL,
    [CategoryState] INT           ,
    PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

CREATE TABLE [dbo].[Accessories] (
    [AccId]        INT             IDENTITY (1, 1) NOT NULL,
    [CategoryId]   INT             NOT NULL,
    [AccName]      NVARCHAR (80)   NOT NULL,
    [Producer]     NVARCHAR (80)   NOT NULL,
    [Manufacturer] NVARCHAR (80)   NOT NULL,
    [Batch]        NVARCHAR (80)   NOT NULL,
    [AccImage]     NVARCHAR (80)   NULL,
    [AccDescn]     NVARCHAR (255)  NULL,
    [ListPrice]    DECIMAL (10, 2) NOT NULL,
    [Quantity]     INT             NOT NULL,
    [PraiseQty]    INT             NULL,
    [AccDate]      DATETIME        NOT NULL,
    [AccState]     INT             ,
    PRIMARY KEY CLUSTERED ([AccId] ASC),
    FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([CategoryId])
);

CREATE TABLE [dbo].[UserInfo] (
    [UserId]    INT             IDENTITY (1, 1) NOT NULL,
    [UserName]  NVARCHAR (80)   NOT NULL,
    [UserPsd]   NVARCHAR (80)   NOT NULL,
    [PayPsd]    NVARCHAR (80)   NULL,
    [Email]     NVARCHAR (80)   NOT NULL,
    [Amount]    DECIMAL (10, 2) NULL,
    [UserType]  NVARCHAR (5)    NOT NULL,
    [JoinDate]  DATETIME        NULL,
    [UserState] INT             ,
    PRIMARY KEY CLUSTERED ([UserId] ASC)
);

CREATE TABLE [dbo].[Order] (
    [OrderId]     INT            IDENTITY (202200, 1) NOT NULL,
    [UserId]      INT            NOT NULL,
    [UserName]    NVARCHAR (80)  NOT NULL,
    [OrderDate]   DATETIME       NOT NULL,
    [UserAddress] NVARCHAR (255) NOT NULL,
    [Zip]         NVARCHAR (6)   NOT NULL,
    [Tel]         NVARCHAR (80)  NOT NULL,
    [CourierNum]  NVARCHAR (80)  NULL,
    [Status]      NVARCHAR (10)  NOT NULL,
    [OrderState]  INT            ,
    PRIMARY KEY CLUSTERED ([OrderId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[UserInfo] ([UserId]) ON DELETE CASCADE
);

CREATE TABLE [dbo].[OrderItem] (
    [ItemId]     INT             IDENTITY (1, 1) NOT NULL,
    [OrderId]    INT             NOT NULL,
    [ProName]    NVARCHAR (80)   NOT NULL,
    [ProPrice]   DECIMAL (10, 2) NOT NULL,
    [ProQty]     INT             NOT NULL,
    [TotalPrice] DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC),
    FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Order] ([OrderId]) ON DELETE CASCADE
);

CREATE TABLE [dbo].[Comment] (
    [CommentId]    INT            IDENTITY (1, 1) NOT NULL,
    [AccId]        INT            NOT NULL,
    [UserId]       INT            NOT NULL,
    [TextContent]  NVARCHAR (255) NOT NULL,
    [ComDateTime]  DATETIME       NOT NULL,
    [CommentState] INT            ,
    PRIMARY KEY CLUSTERED ([CommentId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[UserInfo] ([UserId]) ON DELETE CASCADE,
    FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accessories] ([AccId]) ON DELETE CASCADE
);

CREATE TABLE [dbo].[Collections] (
    [CollectionId] INT             IDENTITY (1, 1) NOT NULL,
    [AccId]        INT             NOT NULL,
    [UserId]       INT             NOT NULL,
    [AccName]      NVARCHAR (80)   NOT NULL,
    [ListPrice]    DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([CollectionId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[UserInfo] ([UserId]) ON DELETE CASCADE,
    FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accessories] ([AccId]) ON DELETE CASCADE
);

CREATE TABLE [dbo].[CartItem] (
    [CartItemId] INT             IDENTITY (1, 1) NOT NULL,
    [UserId]     INT             NOT NULL,
    [AccId]      INT             NOT NULL,
    [ProName]    NVARCHAR (80)   NOT NULL,
    [ProPrice]   DECIMAL (10, 2) NOT NULL,
    [ProQty]     INT             NOT NULL,
    PRIMARY KEY CLUSTERED ([CartItemId] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[UserInfo] ([UserId]) ON DELETE CASCADE,
    FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accessories] ([AccId]) ON DELETE CASCADE
);

GO
insert into Category values('家具配件');
insert into Category values('服装配件');
insert into Category values('门窗配件');
insert into Category values('通用配件');
insert into Category values('五金工具');
insert into UserInfo values(1,'admin',' 202cb962ac59075b964b07152d234b70',' 202cb962ac59075b964b07152d234b70','1400866589@qq.com',NULL,200.00,'管理员','2022/2/26 11:14:52',1);
