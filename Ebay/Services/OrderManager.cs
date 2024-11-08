using Ebay.Interfaces;
using Ebay.Models;
using Microsoft.EntityFrameworkCore;

namespace Ebay.Services;
public class OrderManager(EbayContext context) : IOrder
{

    private readonly EbayContext _context = context;

    public async Task SaveOrderAsync(Order order)
    {
        await _context.Orders.AddAsync(order);
        await _context.SaveChangesAsync();
    }

    public async Task<Order?> GetLatestOrderForUserAsync(string userId)
    {
        var orders = await GetOrdersByUserIdAsync(userId);
        return orders.OrderByDescending(order => order.Id).FirstOrDefault();
    }

    public async Task SaveOrderItemAsync(OrderItem orderItem)
    {
        await _context.OrderItem.AddAsync(orderItem);
        await _context.SaveChangesAsync();
    }

    public async Task<IEnumerable<Order>> GetOrdersByUserIdAsync(string userId) 
        => await _context.Orders.Where(order => order.UserId == userId).ToListAsync();

    public async Task<IList<Order>> GetOrdersAsync() 
        => await _context.Orders.ToListAsync();

    public async Task<IList<OrderItem>> GetOrderItemByOrderIdAsync(int orderId) 
        => await _context.OrderItem
        .Where(orderItems => orderItems.OrderId == orderId)
        .Include(x => x.Product)
        .Include(x => x.Order)
        .ToListAsync();

    public async Task<IEnumerable<OrderItem>> GetOrderItemAsync() 
        => await _context.OrderItem.Include(x => x.Product).ToListAsync();

    public async Task UpdateOrderItemAsync(OrderItem orderItem)
    {
        _context.OrderItem.Update(orderItem);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateProductQuantityAsync(OrderItem orderItems)
    {
        var product = await _context.Products
            .FirstOrDefaultAsync(x => x.Id == orderItems.ProductId);

        if (product is not null)
        {
            product.Inventory -= orderItems.Quantity;
            await _context.SaveChangesAsync();
        }
    }
}
