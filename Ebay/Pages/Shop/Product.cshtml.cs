using Ebay.Hubs;
using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;

namespace Ebay.Pages.Shop;
public class ProductModel(IInventory inventory, IShop shop, IHubContext<NotifyHub> notifyHub) : PageModel
{
    private readonly IInventory _inventory = inventory;
    private readonly IShop _shop = shop;
    private readonly IHubContext<NotifyHub> _notifyHub = notifyHub;

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
        if (ModelState.IsValid && cart != null)
        {
            var cartItem = new CartItem
            {
                CartId = cart.Id,
                ProductId = id,
                Quantity = Input?.Quantity ?? 1
            };

            if (await _shop.GetCartItemByProductIdForUserAsync(user.Id, id) != null)
            {
                var existingCartItem = await _shop.GetCartItemByProductIdForUserAsync(user.Id, id);
                existingCartItem!.Quantity += Input?.Quantity ?? 1;
                await _shop.UpdateCartItemAsync(existingCartItem);
            }
            else
            {
                await _shop.CreateCartItemAsync(cartItem);
                await _notifyHub.Clients.All.SendAsync("CartChange");
            }
        }
        return Redirect("/Shop/Cart");
    }


    public class ProductInput
    {
        public int Quantity { get; set; } = 1;
    }
}