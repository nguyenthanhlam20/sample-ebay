using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Checkout;

public class ReceiptModel(IOrder order) : PageModel
{
    private readonly IOrder _order = order;

    public IList<OrderItem>? OrderItem { get; set; }

    public async Task<IActionResult> OnGetAsync(int orderId)
    {
         OrderItem = await _order.GetOrderItemByOrderIdAsync(orderId);

        return Page();
    }
}