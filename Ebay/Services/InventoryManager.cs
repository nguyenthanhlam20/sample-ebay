using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.EntityFrameworkCore;

namespace Ebay.Services
{
    public class InventoryManager(EbayContext context) : IInventory
    {
       
        private EbayContext _context = context;

      
        public async Task<IList<Product>> GetAllInventoriesAsync() => await _context.Products.ToListAsync();

        public async Task<IList<Category>> GetCategoriesAsync()
            => await _context.Categories.ToListAsync();

      
        public async Task<IList<Product>> GetFeaturedInventoriesAsync() => await _context.Products
                .Where(x => x.IsFeatured == true)
                .ToListAsync();

      
        public async Task<Product?> GetInventoryByIdAsync(int id) 
            => await _context.Products.FirstOrDefaultAsync(x => x.Id == id);

    }
}
