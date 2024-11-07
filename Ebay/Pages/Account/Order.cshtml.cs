using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Ebay.Pages.Account
{
    /// <summary>
    /// A constructor that brings in SignInManager depdency to be used in the class
    /// </summary>
    /// <param name="signInManager">SignInManager context</param>
    public class OrderModel(IOrder order) : PageModel
    {

        private readonly IOrder _order = order;

        /// <summary>
        /// A property to be available on the Model property in the Razor Page
        /// </summary>
        public IEnumerable<Order> Orders { get; set; }
        public IEnumerable<OrderItem> OrderItem { get; set; }

        /// <summary>
        /// Create a user which grab the user id from the database
        /// Then get the user's orders by using user id to look for the corresponding order data
        /// Once gets the user's orders, get the order items that are associated with the orders
        /// </summary>
        /// <returns></returns>
        public async Task OnGetAsync()
        {
            Orders = await _order.GetOrdersByUserIdAsync("1");
            OrderItem = await _order.GetOrderItemAsync();
        }
    }
}