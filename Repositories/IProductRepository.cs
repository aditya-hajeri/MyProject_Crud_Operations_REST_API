using Crud_Operations_REST_API.Models;

namespace Crud_Operations_REST_API.Repositories.Interface;

public interface IProductRepository
{
    Task<IEnumerable<Product>> GetAllProductsync();
    Task<Product?> GetProductByIdAsync(int Product_Id);
    Task<int> CreateProductAsync(Create_Product product);
    Task UpdateAsync(Product product);
    Task PatchAsync(Update_PATCH_Data patchproduct);
    Task DeleteAsync(int Product_Id);
}
