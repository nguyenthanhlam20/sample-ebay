using Ebay.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Ebay.Components
{
    /// <summary>
    /// The MiniCartViewComponent class inherits ViewComponent class then brings in dependencies
    /// The InvokeAsync method utilizes UserManager to bring in the user and call GetUserId to access the user id
    /// A variable is created to store all the cart items of the user by calling GetCartItemByUserIdAsync that takes an user id and returns all the cart items where the items' user id matches.
    /// </summary>
    public class MiniCartViewComponent(IShop shop) : ViewComponent
    {
        private readonly IShop _shop = shop;

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var cartItems = await _shop.GetCartItemByUserIdAsync("1");

            return View(cartItems);
        }
    }
}
