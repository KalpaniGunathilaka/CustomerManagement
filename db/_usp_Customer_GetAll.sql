CREATE OR ALTER PROCEDURE dbo.usp_Customer_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT CustomerId, CustomerCode, CustomerName, Address, DateOfBirth,
           CustomerType, Email, PhoneNumber, IsActive, CreatedDate
    FROM dbo.Customer
    ORDER BY CustomerId DESC;
END
GO