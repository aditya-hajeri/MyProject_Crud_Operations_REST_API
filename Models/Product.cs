
using System;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace Crud_Operations_REST_API.Models
{
    public class Product
    {
        public int Product_Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public decimal Price { get; set; }
        public string? Office {  get; set; } // Using Question Mark - we can able to assign nullable value.
    }

    public class Create_Product
    {
        public required string Name { get; set; } 
        public required decimal Price { get; set; }
        public string? Office { get; set; }
    }

    // PATCH is used to update a single or specific value in the database.
    // We can send only the fields that need to be updated, while the remaining fields we can keep null.
    // To achieve this, a proper query must be written in the stored procedure using - ISNULL(@fieldname, ColumnName).
    // This query should update only the specified fields and keep the previous values as it is for all other fields.
    public class Update_PATCH_Data
    {
        public int Product_Id { get; set; }
        public string? Name { get; set; } = string.Empty;
        public decimal? Price { get; set; }
        public string? Office { get; set; } // Using Question Mark - we can able to assign nullable value.
    }
}
