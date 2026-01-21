using Crud_Operations_REST_API.Data;
using Crud_Operations_REST_API.Models;
using Crud_Operations_REST_API.Repositories.Interface;
using Microsoft.AspNetCore.Mvc;


using Swashbuckle.AspNetCore.Annotations;

namespace Crud_Operations_REST_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProductsController : ControllerBase
    {
        private readonly IProductRepository _repo;

        public ProductsController(IProductRepository repo)
        {
            _repo = repo;
        }

        // HTTP GET - Read Data, Fetch Data from Database.
        [HttpGet] 
        [Route("GetAll_Product")]
        public async Task<IActionResult> GetAllProduct()
        => Ok(await _repo.GetAllProductsync());


        // HTTP GET - Read Data, Fetch Data from Database.
        [HttpGet("Get_Product")]
        public async Task<IActionResult> GetProductById(int Product_Id)
        {
            var result = await _repo.GetProductByIdAsync(Product_Id);
            return result is null ? NotFound() : Ok(result);
        }


        // HTTP POST - Creat Data, Creat New Resource.
        [HttpPost("Create_Product")]
        public async Task<IActionResult> CreateProduct(Create_Product product)
        {
            int id = await _repo.CreateProductAsync(product);
            return CreatedAtAction(nameof(GetProductById),new { Product_Id = id },product);
        }

        // HTTP PUT - Update Data, Replace the resource completely.
        [HttpPut("Update_Product")]
        public async Task<IActionResult> Put(Product product)
        {
            await _repo.UpdateAsync(product);
            return NoContent();
        }

        // HTTP PATCH - Used to update specific field.
        [HttpPatch("Patch_Product")]
        public async Task<IActionResult> Patch(Update_PATCH_Data patchproduct)
        {
            await _repo.PatchAsync(patchproduct);
            return NoContent();
        }
        
        // HTTP DELETE - Remove Data, Delete the resource.
        [HttpDelete("Delete_Product")]
        public async Task<IActionResult> Delete(int Product_Id)
        {
            await _repo.DeleteAsync(Product_Id);
            return NoContent();
        }


    }
}
