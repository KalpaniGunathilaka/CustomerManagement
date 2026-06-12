CREATE OR ALTER PROCEDURE dbo.usp_Customer_GetById
    @CustomerId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT CustomerId, CustomerCode, CustomerName, Address, DateOfBirth,
           CustomerType, Email, PhoneNumber, IsActive, CreatedDate
    FROM dbo.Customer
    WHERE CustomerId = @CustomerId;
END
GO