using Dapper;
using System.Data;
using Crud_Operations_REST_API.Data;
using Crud_Operations_REST_API.Models;
//using Crud_Operations_REST_API.Repositories;
using Crud_Operations_REST_API.Repositories.Interface;

namespace Crud_Operations_REST_API.Repositories
{
    public class ProductRepository: IProductRepository
    {
        private readonly DapperContext _context;

        public ProductRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Product>> GetAllProductsync()
        {
            using var db = _context.CreateConnection();
            return await db.QueryAsync<Product>(
                "sp_GetAllProducts", commandType: CommandType.StoredProcedure);
        }

        public async Task<Product?> GetProductByIdAsync(int Product_Id)
        {
            using var db = _context.CreateConnection();
            return await db.QueryFirstOrDefaultAsync<Product>(
                "sp_GetProductById", new { Product_Id = Product_Id },
                commandType: CommandType.StoredProcedure);
        }

        public async Task<int> CreateProductAsync(Create_Product product)
        {
            using var db = _context.CreateConnection();
            return await db.ExecuteScalarAsync<int>(
                "sp_CreateProduct", new { product.Name, product.Price, product.Office },
                commandType: CommandType.StoredProcedure);
        }

        public async Task UpdateAsync(Product product)
        {
            using var db = _context.CreateConnection();
            await db.ExecuteAsync(
                "sp_Update_Patch_Product",
                new { product.Product_Id, product.Name, product.Price, product.Office },
                commandType: CommandType.StoredProcedure);
        }

        public async Task PatchAsync(Update_PATCH_Data patch_product)
        {
            using var db = _context.CreateConnection();
            await db.ExecuteAsync(
                "sp_Update_Patch_Product",
                new { patch_product.Product_Id, patch_product.Name, patch_product.Price, patch_product.Office },
                commandType: CommandType.StoredProcedure);
        }

        public async Task DeleteAsync(int id)
        {
            using var db = _context.CreateConnection();
            await db.ExecuteAsync(
                "sp_DeleteProduct", new { Product_Id = id },
                commandType: CommandType.StoredProcedure);
        }
    }
}