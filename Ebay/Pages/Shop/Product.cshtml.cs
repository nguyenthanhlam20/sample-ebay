using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Shop;
public class ProductModel(IInventory inventory, IShop shop) : PageModel
{
    private readonly IInventory _inventory = inventory;
    private readonly IShop _shop = shop;

    public Product? SingleProduct { get; set; }

    [BindProperty]
    public ProductInput? Input { get; set; }

    public async Task OnGetAsync(int id)
    {
        SingleProduct = await _inventory.GetInventoryByIdAsync(id);
    }

    public async Task<IActionResult> OnPostAsync(int id)
    {
        var user = new { Id = "1" };

        var cart = await _shop.GetCartByUserIdAsync(user.Id);
        if (ModelState.IsValid)
        {
            CartItem cartItem = new CartItem
            {
                CartId = cart.Id,
                ProductId = id,
                Quantity = Input?.Quantity ?? 1
            };
            if (await _shop.GetCartItemByProductIdForUserAsync(user.Id, id) != null)
            {
                CartItem existingCartItem = await _shop.GetCartItemByProductIdForUserAsync(user.Id, id);
                existingCartItem.Quantity += Input?.Quantity ?? 1;
                await _shop.UpdateCartItemAsync(existingCartItem);
            }
            else
            {
                await _shop.CreateCartItemAsync(cartItem);
            }
        }
        return Redirect("/Shop/Cart");
    }

    public class ProductInput
    {
        public int Quantity { get; set; } = 1;
    }
}