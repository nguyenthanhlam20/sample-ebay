using Ebay.Interfaces;
using Ebay.Models;
using Ebay.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add builder.Services to the container.
builder.Services.AddRazorPages();

builder.Services.AddControllersWithViews();

builder.Services.AddScoped<IInventory, InventoryManager>();

builder.Services.AddScoped<IShop, ShopManager>();

builder.Services.AddScoped<IPayment, PaymentManager>();

builder.Services.AddScoped<IOrder, OrderManager>();

var connectionString = builder.Configuration.GetConnectionString("DB");
builder.Services.AddDbContext<EbayContext>(options =>
{
    options.UseSqlServer(connectionString);
});

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

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapRazorPages();
    endpoints.MapDefaultControllerRoute();
});

app.Run();
