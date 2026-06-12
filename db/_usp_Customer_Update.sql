CREATE OR ALTER PROCEDURE dbo.usp_Customer_Update
    @CustomerId   INT,
    @CustomerName NVARCHAR(150),
    @Address      NVARCHAR(250) = NULL,
    @DateOfBirth  DATE,
    @CustomerType TINYINT,
    @Email        NVARCHAR(150) = NULL,
    @PhoneNumber  NVARCHAR(20)  = NULL,
    @IsActive     BIT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Customer
    SET CustomerName = @CustomerName,
        Address      = @Address,
        DateOfBirth  = @DateOfBirth,
        CustomerType = @CustomerType,
        Email        = @Email,
        PhoneNumber  = @PhoneNumber,
        IsActive     = @IsActive
    WHERE CustomerId = @CustomerId;

    -- Return how many rows changed (0 means "not found")
    SELECT @@ROWCOUNT;
END
GO