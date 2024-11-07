using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.EntityFrameworkCore;

namespace Ebay.Services;

public class ShopManager(EbayContext context) : IShop
{
    private readonly EbayContext _context = context;

    public async Task CreateCartAsync(Cart cart)
    {
        await _context.Carts.AddAsync(cart);
        await _context.SaveChangesAsync();
    }

    public async Task CreateCartItemAsync(CartItem cartItems)
    {
        await _context.CartItem.AddAsync(cartItems);
        await _context.SaveChangesAsync();
    }


    public async Task<Cart?> GetCartByUserIdAsync(string userId)
        => await _context.Carts.FirstOrDefaultAsync(cart => cart.UserId == userId);

    public async Task<List<CartItem>> GetCartItemByUserIdAsync(string userId)
    {
        var cart = await GetCartByUserIdAsync(userId);
        if (cart == null)
        {
            return new();
        }
        else
        {
            var result = await _context.CartItem
                            .Where(cartItem => cartItem.CartId == cart.Id)
                            .Include(x => x.Product)
                            .ToListAsync();
            return result;
        }
    }

    public async Task<CartItem?> GetCartItemByProductIdForUserAsync(string userId, int productId)
    {
        var cartItems = await GetCartItemByUserIdAsync(userId);
        return cartItems.FirstOrDefault(cart => cart.ProductId == productId);
    }

    public async Task RemoveCartItemAsync(string userId, int productId)
    {
        var cartItem = await GetCartItemByProductIdForUserAsync(userId, productId);
        if (cartItem != null)
        {
            _context.CartItem.Remove(cartItem);
            await _context.SaveChangesAsync();
        }
    }

    public async Task RemoveCartItemAsync(IEnumerable<CartItem> cartItems)
    {
        _context.CartItem.RemoveRange(cartItems);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateCartItemAsync(CartItem cartItem)
    {
        _context.CartItem.Update(cartItem);
        await _context.SaveChangesAsync();
    }
}
