using System;
using System.Collections.Generic;

namespace Ebay.Models;

public partial class Cart
{
    public int Id { get; set; }

    public string UserId { get; set; } = null!;

    public virtual ICollection<CartItem> CartItem { get; set; } = new List<CartItem>();
}
