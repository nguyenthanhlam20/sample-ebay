using Ebay.Hubs;
using Ebay.Interfaces;
using Ebay.Models;
using Ebay.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add builder.Services to the container.
builder.Services.AddRazorPages();
builder.Services.AddControllers();
builder.Services.AddSignalR();

var connectionString = builder.Configuration.GetConnectionString("DB");
builder.Services.AddDbContext<EbayContext>(options =>
{
    options.UseSqlServer(connectionString);
});

builder.Services.AddScoped<IInventory, InventoryManager>();
builder.Services.AddScoped<IShop, ShopManager>();
builder.Services.AddScoped<IPayment, PaymentManager>();
builder.Services.AddScoped<IOrder, OrderManager>();

builder.Services.AddAuthorization();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app
    .UseAuthentication()
    .UseRouting()
    .UseAuthorization()
    .UseEndpoints(r =>
    {
        r.MapRazorPages();
        r.MapControllers();
        r.MapHub<NotifyHub>("/notify-hub");
    });

app.Run();
