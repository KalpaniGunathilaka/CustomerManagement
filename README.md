# Customer Management API

A RESTful Customer Management API built using ASP.NET Core Web API, Clean Architecture, ADO.NET, SQL Server, and Stored Procedures.

---

## Technologies Used

- ASP.NET Core Web API (.NET 8)
- SQL Server
- ADO.NET
- Stored Procedures
- Swagger / OpenAPI
- Clean Architecture

---

## Project Structure

### Domain Layer

Contains the core business entities and enums.

- Customer
- CustomerType

### Application Layer

Contains DTOs, interfaces, and business logic.

- CustomerCreateDto
- CustomerUpdateDto
- CustomerResponseDto
- ICustomerRepository
- ICustomerService
- CustomerService

### Infrastructure Layer

Handles database communication using ADO.NET and Stored Procedures.

- SqlConnectionFactory
- CustomerRepository

### API Layer

Handles HTTP requests and responses.

- CustomersController
- Program.cs
- Swagger Configuration

---

## Features

### CRUD Operations

- Create Customer
- Get All Customers
- Get Customer By Id
- Update Customer
- Delete Customer

### Bonus Features

- Soft Delete
- Search and Paging
- Global Exception Handling Middleware
- DateOfBirth Validation

---

## API Endpoints

| Method | Endpoint | Description |
|----------|----------|----------|
| GET | /api/customers | Get all customers |
| GET | /api/customers/{id} | Get customer by id |
| POST | /api/customers | Create customer |
| PUT | /api/customers/{id} | Update customer |
| DELETE | /api/customers/{id} | Delete customer |

---

## Database Scripts

The `db` folder contains:

- 01_CreateTable.sql
- 02_Insert.sql
- 03_Update.sql
- 04_Delete.sql
- 05_GetById.sql
- 06_GetAll.sql

---

## How to Run

### 1. Clone the Repository

```bash
git clone <repository-url>
```

### 2. Run Database Scripts

Execute all SQL scripts inside the `db` folder using SQL Server Management Studio (SSMS).

### 3. Configure Connection String

Update the connection string in:

```json
appsettings.json
```

### 4. Run the Application

Open the solution in Visual Studio and run the API project.

### 5. Open Swagger

Navigate to:

```
https://localhost:xxxx/swagger
```

and test all endpoints.

---

## Architecture Flow

Client Request

↓

API Controller

↓

Service Layer

↓

Repository Layer

↓

Stored Procedure

↓

SQL Server Database

↓

Response

---

## Author

Kalpani Gunathilaka
