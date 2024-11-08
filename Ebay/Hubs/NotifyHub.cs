using Microsoft.AspNetCore.SignalR;

namespace Ebay.Hubs;

public class NotifyHub : Hub
{
    public async Task NotifyPageReload()
    {
        await Clients.All.SendAsync("ReloadPage");
    }

    public async Task NotifyCartChange()
    {
        await Clients.All.SendAsync("CartChange");
    }
}
