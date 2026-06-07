create or alter procedure dbo.usp_Customer_Delete
	@CustomerId int
	
AS
BEGIN
	SET NOCOUNT ON;
	DELETE FROM dpo.Customer where CustomerId = @CustomerId;
	select @@ROWCOUNT;
END
GO
