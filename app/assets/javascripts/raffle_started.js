function endRaffle() {
    // Get room code
    var roomCode = $("#play-flex").data("room-code")

    // Make a new websocket client
    var client = new Faye.Client('http://http://68.183.129.46:22/faye');

    // Watch for publishes to /rooms/end/room-code. On a publish, leave the raffle play
    // page and move to the raffle end screen
    var connectionSubscription = client.subscribe('/rooms/end/' + roomCode, function(data) {
        window.location.replace("/results/" + roomCode);
    });
}