using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Checkout;

public class HistoryModel(IOrder order) : PageModel
{
    private readonly IOrder _order = order;

    public IList<Order>? Orders { get; set; }

    public async Task OnGetAsync()
    {
        Orders = await _order.GetOrdersAsync();
    }
}