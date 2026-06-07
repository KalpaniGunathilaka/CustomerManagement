CREATE OR ALTER PROCEDURE dbo.usp_Customer_Insert
    @CustomerName NVARCHAR(150),
    @Address      NVARCHAR(250) = NULL,
    @DateOfBirth  DATE,
    @CustomerType TINYINT,
    @Email        NVARCHAR(150) = NULL,
    @PhoneNumber  NVARCHAR(20)  = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @NewId INT;

        INSERT INTO dbo.Customer
            (CustomerCode, CustomerName, Address, DateOfBirth, CustomerType, Email, PhoneNumber, IsActive, CreatedDate)
        VALUES
            (N'', @CustomerName, @Address, @DateOfBirth, @CustomerType, @Email, @PhoneNumber, 1, GETDATE());

        SET @NewId = CAST(SCOPE_IDENTITY() AS INT);

        -- Build a padded code, e.g. id 7 -> 'CUST-00007'
        DECLARE @Code NVARCHAR(20) =
            N'CUST-' + RIGHT(N'00000' + CAST(@NewId AS NVARCHAR(10)), 5);

        UPDATE dbo.Customer
        SET CustomerCode = @Code
        WHERE CustomerId = @NewId;

        COMMIT TRANSACTION;

        -- Return the freshly created row to the caller
        SELECT CustomerId, CustomerCode, CustomerName, Address, DateOfBirth,
               CustomerType, Email, PhoneNumber, IsActive, CreatedDate
        FROM dbo.Customer
        WHERE CustomerId = @NewId;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
        THROW;   -- re-raise so the C# layer sees the real error
    END CATCH
END
GO