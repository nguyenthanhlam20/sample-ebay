using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages;
public class IndexModel(IInventory context) : PageModel
{
    private readonly IInventory _context = context;

    public IList<Category>? Categories { get; set; }

    public async Task OnGetAsync()
    {
        Categories = await _context.GetCategoriesAsync();
    }
}