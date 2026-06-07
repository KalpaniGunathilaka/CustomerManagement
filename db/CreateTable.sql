CREATE DATABASE CustomerDb;
GO
USE CustomerDb;
GO

CREATE TABLE dbo.Customer
(
    CustomerId    INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CustomerCode  NVARCHAR(20)  NOT NULL,
    CustomerName  NVARCHAR(150) NOT NULL,
    Address       NVARCHAR(250) NULL,
    DateOfBirth   DATE          NOT NULL,
    CustomerType  TINYINT       NOT NULL,   -- 1 = Personal, 2 = Business
    Email         NVARCHAR(150) NULL,
    PhoneNumber   NVARCHAR(20)  NULL,
    IsActive      BIT           NOT NULL DEFAULT(1),
    CreatedDate   DATETIME      NOT NULL DEFAULT(GETDATE())
);
GO