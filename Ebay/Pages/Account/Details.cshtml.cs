using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Account;

/// <summary>
/// A constructor that brings in UserManager<ApplicationUser> and IOrder interface to enable the implementation of show the order details that contains only the user's orders
/// </summary>
/// <param name="userManager"></param>
/// <param name="order"></param>
public class DetailsModel(IOrder order) : PageModel
{

    private readonly IOrder _order = order;

    /// <summary>
    /// A property to be available on the Model property in the Razor Page
    /// </summary>
    public IEnumerable<OrderItem> OrderItem { get; set; }

    /// <summary>
    /// Get all the order items by sending over the order id that is requested
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task OnGetAsync(int id)
    {
        OrderItem = await _order.GetOrderItemByOrderIdAsync(id);
    }
}