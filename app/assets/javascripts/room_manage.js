// 4/11/2019 - Wrote manageRoom fucntion - Tom Paoloni
// 4/16/2019 - Simplified - Tom Paoloni

// Function is run when the room manager page is loaded

function manageRoom() {
  //Create a new client to connect to Faye
  var client = new Faye.Client('http://localhost:3000/faye');
  var entrants = [];
  var cids = [];

  // Get the created room's room code
  var roomCode = $("#room-code").data("room-code")

  // Subscribe to the cooresponding roomcode channel to get incoming entrants
  var connectSubscription = client.subscribe('/rooms/connected/' + roomCode, function(data) {
    // Create a new table row for every entrant that joins
    $('<tr id="'+ data.cid +'"></tr>').html('<td>' + data.user + '</td>').appendTo('#entrant-table tbody');
    entrants.push(data);
    cids.push(data.cid);
  });

  var disconnectSubscription = client.subscribe('/rooms/disconnected/' + roomCode, function(data) {
    $('#' + data.cid).remove();

    var index = entrants.indexOf(data.cid);
    entrants.splice(index, 1);
  });

  document.getElementById('start-raffle').addEventListener('click', startRaffle);

  function startRaffle() {
    var randomEntrant = entrants[Math.floor(Math.random() * entrants.length)].user;
    client.publish('/rooms/start/' + roomCode, { winner: randomEntrant });
  }

  document.getElementById('end-raffle').addEventListener('click', endRaffle);

  function endRaffle() {
    var randomEntrant = entrants[Math.floor(Math.random() * entrants.length)].user;
    client.publish('/rooms/end/' + roomCode, {});
    setTimeout(moveOn, 500)
  }

  function moveOn() {
    window.location.replace('/results/' + roomCode);
  }
}

