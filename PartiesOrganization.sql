CREATE DATABASE inz1;

USE inz1;

CREATE TABLE [dbo].[USERS] (
    [EMAIL]     VARCHAR (100) NOT NULL,
    [FIRSTNAME] VARCHAR (100) NULL,
    [LASTNAME]  VARCHAR (100) NULL,
    [PASSWORD]  VARCHAR (MAX) NULL,
    [PHONE]     VARCHAR (15)  NULL,
    [ROLE]      VARCHAR (10)  NULL,
    PRIMARY KEY CLUSTERED ([EMAIL] ASC)
);

CREATE TABLE [dbo].[PRODUCTS] (
    [PRODUCT_ID]      INT           IDENTITY (1, 1) NOT NULL,
    [PRODUCTS_NAME]   VARCHAR (100) NULL,
    [PRICE]           VARCHAR (100) NULL,
    [PRODUCTS_WEIGHT] VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([PRODUCT_ID] ASC)
);

CREATE TABLE [dbo].[HALLS] (
    [HALL_ID] INT           IDENTITY (1, 1) NOT NULL,
    [NAME]    VARCHAR (100) NULL,
    [SIZE]    VARCHAR (100) NULL,
    [PLACES]  VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([HALL_ID] ASC)
);

CREATE TABLE [dbo].[DISHES] (
    [DISH_ID]     INT           IDENTITY (1, 1) NOT NULL,
    [DISHES_NAME] VARCHAR (100) NULL,
    [DESCRIPTION] VARCHAR (500) NULL,
    [VEGAN]       VARCHAR (5)   NULL,
    [VEGTARIAN]   VARCHAR (5)   NULL,
    PRIMARY KEY CLUSTERED ([DISH_ID] ASC)
);

CREATE TABLE [dbo].[COSTS] (
    [COST_ID]        INT NOT NULL,
    [NUMER_OF_MEALS] INT NULL,
    [PRICE]          INT NULL,
    PRIMARY KEY CLUSTERED ([COST_ID] ASC)
);

CREATE TABLE [dbo].[BOOKINGS] (
    [BOOKING_ID]    INT           IDENTITY (1, 1) NOT NULL,
    [DATE_OF_PARTY] VARCHAR (100) NULL,
    [PLACES]        VARCHAR (100) NULL,
    [HALL]          INT           NULL,
    [TENANT]        VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([BOOKING_ID] ASC),
    FOREIGN KEY ([HALL]) REFERENCES [dbo].[HALLS] ([HALL_ID]),
    FOREIGN KEY ([TENANT]) REFERENCES [dbo].[USERS] ([EMAIL])
);

CREATE TABLE [dbo].[INGREDIENTS] (
    [INGREDIENT_ID] INT           IDENTITY (1, 1) NOT NULL,
    [DISH]          INT           NULL,
    [PRODUCT]       INT           NULL,
    [WEIGHT]        VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([INGREDIENT_ID] ASC),
    FOREIGN KEY ([PRODUCT]) REFERENCES [dbo].[PRODUCTS] ([PRODUCT_ID]),
    FOREIGN KEY ([DISH]) REFERENCES [dbo].[DISHES] ([DISH_ID])
);

CREATE TABLE [dbo].[MENU] (
    [MENU_ID]      INT         IDENTITY (1, 1) NOT NULL,
    [DISH]         INT         NULL,
    [BOOGING]      INT         NULL,
    [MEALS_NUMBER] VARCHAR (5) NULL,
    PRIMARY KEY CLUSTERED ([MENU_ID] ASC),
    FOREIGN KEY ([BOOGING]) REFERENCES [dbo].[BOOKINGS] ([BOOKING_ID]),
    FOREIGN KEY ([DISH]) REFERENCES [dbo].[DISHES] ([DISH_ID])
);
