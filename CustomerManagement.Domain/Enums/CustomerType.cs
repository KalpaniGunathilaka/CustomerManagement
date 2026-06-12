namespace CustomerManagement.Domain.Enums;

// Stored in the DB as a TINYINT (1 or 2).
public enum CustomerType : byte
{
    Personal = 1,
    Business = 2
}