using CustomerManagement.Domain.Entities;

namespace CustomerManagement.Application.Interfaces;

public interface ICustomerRepository
{
    Task<Customer?> CreateAsync(Customer customer);
    Task<bool> UpdateAsync(Customer customer);

    Task<bool> DeleteAsync(int CustomerId);

    Task<Customer?> GetByIdAsync(int CustomerId);

    Task<IEnumerable<Customer>> GetAllAsync(
    string? search,
    int page,
    int pageSize);

}