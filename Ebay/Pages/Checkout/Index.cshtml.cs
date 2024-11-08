using AuthorizeNet.Api.Contracts.V1;
using Ebay.Hubs;
using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using System.ComponentModel.DataAnnotations;

namespace Ebay.Pages.Checkout;

public class IndexModel(IShop shop, IPayment payment, IOrder order, IHubContext<NotifyHub> notifyHub) : PageModel
{
    private readonly IShop _shop = shop;
    private readonly IPayment _paymnet = payment;
    private readonly IOrder _order = order;
    private readonly IHubContext<NotifyHub> _notifyHub = notifyHub;

    [BindProperty]
    public CheckoutInput Input { get; set; }

    public void OnGet()
    {
    }

    public async Task<IActionResult> OnPostAsync()
    {
        if (ModelState.IsValid)
        {

            var order = new Order
            {
                UserId = "1",
                FirstName = Input.FirstName,
                LastName = Input.LastName,
                Address = Input.Address,
                Address2 = Input.Address2,
                City = Input.City,
                State = Input.State,
                Zip = Input.Zip,
                CreditCard = Input.CreditCard.ToString(),
                Timestamp = DateTime.Now.ToString()
            };

            await _order.SaveOrderAsync(order);

            order = await _order.GetLatestOrderForUserAsync("1");

            IEnumerable<CartItem> cartItems = await _shop.GetCartItemByUserIdAsync("1");
            IList<OrderItem> orderItems = new List<OrderItem>();
            decimal total = 0;

            foreach (var cartItem in cartItems)
            {
                var orderItem = new OrderItem
                {
                    OrderId = order.Id,
                    ProductId = cartItem.ProductId,
                    Quantity = cartItem.Quantity
                };
                orderItems.Add(orderItem);
                total += cartItem.Product.Price * cartItem.Quantity;
            }

            double finalCost = Decimal.ToDouble(total) * 1.1;
            foreach (var item in orderItems)
            {
                await _order.SaveOrderItemAsync(item);
                await _order.UpdateProductQuantityAsync(item);
            }

            string creditCardNumber;
            string creditCardExpiration;

            string cardType = Input.CreditCard.ToString();
            switch (cardType)
            {
                case "0":
                    creditCardNumber = "4111111111111111";
                    creditCardExpiration = "0723";
                    break;
                case "1":
                    creditCardNumber = "5424000000000015";
                    creditCardExpiration = "0922";
                    break;
                case "2":
                    creditCardNumber = "370000000000002";
                    creditCardExpiration = "1222";
                    break;
                default:
                    creditCardNumber = "4111111111111111";
                    creditCardExpiration = "0723";
                    break;
            }

            var creditCard = new creditCardType
            {
                cardNumber = creditCardNumber,
                expirationDate = creditCardExpiration
            };

            var billingAdress = new customerAddressType
            {
                firstName = Input.FirstName,
                lastName = Input.LastName,
                address = Input.Address + Input.Address2,
                city = Input.City,
                state = Input.State,
                zip = Input.Zip
            };

            if (_paymnet.Run(finalCost, creditCard, billingAdress))
            {
                await _shop.RemoveCartItemAsync(cartItems);
                await _notifyHub.Clients.All.SendAsync("ReloadPage");

                var lastedOrder = await _order.GetLatestOrderForUserAsync("1");
                return Redirect("/Checkout/Receipt?orderId=" + lastedOrder.Id);
            }
        }
        return Page();
    }

    public class CheckoutInput
    {
        [Display(Name = "Purchased Date:")]
        public DateTime Date { get; set; }

        [Required]
        [Display(Name = "First Name:")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name:")]
        public string LastName { get; set; }

        [Required]
        public string Address { get; set; }

        [Display(Name = "Address 2:")]
        public string Address2 { get; set; }

        [Required]
        public string City { get; set; }

        [Required]
        public string State { get; set; }

        [Required]
        [DataType(DataType.PostalCode)]
        [Compare("Zip", ErrorMessage = "The is an invalid zip code")]
        public string Zip { get; set; }

        [Required]
        public CreditCard CreditCard { get; set; }
    }

    public enum CreditCard
    {
        Visa = 0,
        Mastercard,
        [Display(Name = "Amenrican Express")]
        AmericanExpress
    }
}
