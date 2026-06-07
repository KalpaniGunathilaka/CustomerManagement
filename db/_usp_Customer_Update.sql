create or alter procedure dbo.usp_Customer_Update
	@CustomerId int,
	@CustomeName nvarchar(150),
	@Address nvarchar(250)=null,
	@DateOfBirth Date,
	@CustomerType tinyint,
	@Email nvarchar(150)=null,
	@PhoneNumber nvarchar(20) = null,
	@IsActive bit

AS 
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Customer set 
		CustomeName=@CustomeName,
		Address=@Address,
		DateOfBirth=@DateOfBirth,
		CustomerType=@CustomerType,
		Email=@Email,
		PhoneNumber=@PhoneNumber,
		IsActive=@IsActive
	WHERE CustomerId=@CustomerId;

	SELECT @@ROWCOUNT;

END
GO

		