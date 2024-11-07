using Ebay.Models;

namespace Ebay.Interfaces
{
    public interface IShop
    {
        Task CreateCartAsync(Cart cart);

        Task CreateCartItemAsync(CartItem cartItems);

        Task<Cart?> GetCartByUserIdAsync(string userId);

        Task<List<CartItem>> GetCartItemByUserIdAsync(string userId);

        Task<CartItem?> GetCartItemByProductIdForUserAsync(string userId, int productId);

        Task UpdateCartItemAsync(CartItem cartItems);

        Task RemoveCartItemAsync(string userId, int productId);

        Task RemoveCartItemAsync(IEnumerable<CartItem> cartItems);
    }
}
