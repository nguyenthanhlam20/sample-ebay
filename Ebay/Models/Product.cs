using System;
using System.Collections.Generic;

namespace Ebay.Models;

public partial class Product
{
    public int Id { get; set; }

    public string Sku { get; set; } = null!;

    public string Name { get; set; } = null!;

    public decimal Price { get; set; }

    public string Description { get; set; } = null!;

    public string Image { get; set; } = null!;

    public bool IsFeatured { get; set; }

    public int? CategoryId { get; set; }

    public int? Inventory { get; set; }

    public virtual ICollection<CartItem> CartItem { get; set; } = new List<CartItem>();

    public virtual Category? Category { get; set; }

    public virtual ICollection<OrderItem> OrderItem { get; set; } = new List<OrderItem>();
}
