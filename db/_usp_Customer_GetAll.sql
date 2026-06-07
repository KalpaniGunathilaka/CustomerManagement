create or alter procedure dbo.usp_Customer_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	SELECT CustomerId,CustomerCode,CustomerName,Address,DateOfBirth,
	CustomerType,Email,PhoneNumber,IsActive,CreatedDate
	from dbo.Customer order by CustomerId desc;

End
Go
