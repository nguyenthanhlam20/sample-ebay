using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Shop
{
    public class IndexModel(IInventory context) : PageModel
    {
       
        private readonly IInventory _context = context;

        public IList<Product>? Products { get; set; }
        public IList<Category>? Categories { get; set; }

        [BindProperty]
        public int CategoryId { get; set; } = -1;

        public async Task OnGetAsync(int categoryId = -1)
        {
            CategoryId = categoryId;

            var products = await _context.GetAllInventoriesAsync();
            if(CategoryId == -1)
            {
                Products = products;
            } else
            {
                Products = products.Where(x => x.CategoryId == CategoryId).ToList();
            }
            Categories = await _context.GetCategoriesAsync();
        }
    }
}
