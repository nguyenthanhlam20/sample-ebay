using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Shop;
public class CartModel(IShop shopcontext) : PageModel
{

    private readonly IShop _shop = shopcontext;

    public IEnumerable<CartItem>? CartItem { get; set; }

    public async Task OnGetAsync()
    {
        CartItem = await _shop.GetCartItemByUserIdAsync("1");
    }

    public async Task<IActionResult> OnPostUpdateAsync(int id)
    {
        int updatedQuantity = Convert.ToInt32(Request.Form["Quantity"]);
        var cartItem = await _shop.GetCartItemByProductIdForUserAsync("1", id);

        if (cartItem != null)
        {
            cartItem.Quantity = updatedQuantity;
            await _shop.UpdateCartItemAsync(cartItem);
        }

        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostDeleteAsync(int id)
    {
        await _shop.RemoveCartItemAsync("1", id);
        return RedirectToPage();
    }
}
