CREATE OR ALTER PROCEDURE dbo.usp_Customer_Delete
    @CustomerId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM dbo.Customer WHERE CustomerId = @CustomerId;
    SELECT @@ROWCOUNT;
END
GO