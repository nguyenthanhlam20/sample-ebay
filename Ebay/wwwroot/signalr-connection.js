let connection = null;

function initializeSignalRConnection() {
    if (!connection) {
        connection = new signalR.HubConnectionBuilder()
            .withUrl("/notify-hub") // Replace with your hub URL
            .build();

        connection.start()
            .then(() => console.log("SignalR connection established."))
            .catch(err => console.error("Error establishing SignalR connection:", err));

        // Define event listeners here, if needed
        connection.on("ReloadPage", function () {

            if (location.href.includes("Shop")) {
                location.reload();
            }
        });

        connection.on("CartChange", function () {
            fetch("/cart/count").then(response => response.json())
                .then(result => {
                    var count = parseInt(result);

                    const cartItems = document.getElementById("cart-items");
                    if (count > 0) {
                        cartItems.innerHTML = result;
                        cartItems.style.display = "block";
                    } else {
                        cartItems.style.display = "none";
                    }
                      
                });
        });
    }

    return connection;
}

// Call this function on each page where you need the SignalR connection
initializeSignalRConnection();