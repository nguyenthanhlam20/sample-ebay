using Ebay.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Ebay.Controllers;

[Route("cart")]
public class CartController(IShop shop) : ControllerBase
{
    private readonly IShop _shop = shop;

    [HttpGet("count")]
    public async Task<IActionResult> CountAsync()
    {
        var items = await _shop.GetCartItemByUserIdAsync("1");
        return Ok(items.Count);
    }
}
