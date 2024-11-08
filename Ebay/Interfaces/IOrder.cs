using Ebay.Models;

namespace Ebay.Interfaces;
public interface IOrder
{
    Task SaveOrderAsync(Order order);

    Task<Order?> GetLatestOrderForUserAsync(string userId);

    Task SaveOrderItemAsync(OrderItem orderItem);

    Task<IEnumerable<Order>> GetOrdersByUserIdAsync(string userId);

    Task<IList<Order>> GetOrdersAsync();

    Task<IList<OrderItem>> GetOrderItemByOrderIdAsync(int orderId);

    Task<IEnumerable<OrderItem>> GetOrderItemAsync();

    Task UpdateOrderItemAsync(OrderItem orderItems);
    Task UpdateProductQuantityAsync(OrderItem orderItems);
}
