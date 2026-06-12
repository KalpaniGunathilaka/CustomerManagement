using System.Text.Json.Serialization;
using CustomerManagement.Application;
using CustomerManagement.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

// Controllers + show enums as text ("Personal"/"Business") in JSON & Swagger
builder.Services.AddControllers()
    .AddJsonOptions(options =>
        options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter()));

// Our own layers
builder.Services.AddApplication();
builder.Services.AddInfrastructure();

// Swagger / OpenAPI
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new()
    {
        Title = "Customer Management API",
        Version = "v1",
        Description = "A simple CRUD API built with Clean Architecture & ADO.NET."
    });
});

var app = builder.Build();

// Show Swagger UI in development
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Customer Management API v1");
    });
}

app.UseHttpsRedirection();
app.MapControllers();
app.Run();