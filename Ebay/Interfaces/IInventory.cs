using Ebay.Models;

namespace Ebay.Interfaces
{
    public interface IInventory
    {
        Task<IList<Product>> GetAllInventoriesAsync();

        Task<IList<Product>> GetFeaturedInventoriesAsync();

        Task<Product?> GetInventoryByIdAsync(int id);

        Task<IList<Category>> GetCategoriesAsync();

    }
}
