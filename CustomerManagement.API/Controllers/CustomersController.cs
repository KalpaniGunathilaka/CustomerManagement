using CustomerManagement.Application.DTOs;
using CustomerManagement.Application.Interfaces;
using CustomerManagement.Application.Services;
using Microsoft.AspNetCore.Mvc;

namespace CustomerManagement.API.Controllers;

[ApiController]
[Route("api/[controller]")]   // -> /api/customers
public class CustomersController : ControllerBase
{
    private readonly ICustomerService _service;

    public CustomersController(ICustomerService service) => _service = service;

    // GET /api/customers
    [HttpGet]
    public async Task<IActionResult> GetAll(
    string? search,
    int page = 1,
    int pageSize = 10)
    {
        var customers = await _service.GetAllAsync(
            search,
            page,
            pageSize);

        return Ok(customers);
    }

    // GET /api/customers/5
    [HttpGet("{id:int}")]
    public async Task<IActionResult> GetById(int id)
    {
        var customer = await _service.GetByIdAsync(id);
        if (customer is null)
            return NotFound($"Customer with Id {id} was not found.");
        return Ok(customer);
    }

    // POST /api/customers
    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CustomerCreateDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var created = await _service.CreateAsync(dto);
        if (created is null)
            return StatusCode(500, "Failed to create the customer.");

        // 201 Created + a Location header pointing at the new resource
        return CreatedAtAction(nameof(GetById), new { id = created.CustomerId }, created);
    }

    // PUT /api/customers/5
    [HttpPut("{id:int}")]
    public async Task<IActionResult> Update(int id, [FromBody] CustomerUpdateDto dto)
    {
        if (!ModelState.IsValid) return BadRequest(ModelState);

        var updated = await _service.UpdateAsync(id, dto);
        if (!updated)
            return NotFound($"Customer with Id {id} was not found.");
        return NoContent();   // 204
    }

    // DELETE /api/customers/5
    [HttpDelete("{id:int}")]
    public async Task<IActionResult> Delete(int id)
    {
        var deleted = await _service.DeleteAsync(id);
        if (!deleted)
            return NotFound($"Customer with Id {id} was not found.");
        return NoContent();
    }
}