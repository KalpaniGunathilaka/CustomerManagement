create or alter procedure dbo.usp_Customer_GetById
	@CustomerId int

As
BEGIN
	SET NOCOUNT ON;
	select CustomerId,CustomerCode,CustomeName,Address,DateOfBirth,CustomerType,Email,PhoneNumber,IsActive,CreatedDate
	from dbo.Customer
	where CustomerId=@CustomerId;

END
GO