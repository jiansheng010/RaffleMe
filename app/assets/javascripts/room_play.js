// 4/11/2019 - Wrote playRoom fucntion - Tom Paoloni
// 4/16/2019 - Simplified - Tom Paoloni
// 4/16/2019 - Modified subscribe content to redirect - JS Teoh

function playRoom() {
  $('.playing').hide();
  var roomCode = $('#room-intro').data('room-code');
  var username = $('#room-intro').data('username');
  var email = $('#room-intro').data('email');

  // Create a new client to connect to Faye
  var client = new Faye.Client('http://68.183.129.46:22/faye');
  client.publish('/rooms', { user: username, room_code: roomCode, email: email });

  // Move to a new page when a room manager hits "Start Raffle"
  var startSub = client.subscribe('/rooms/start/' + roomCode, function(data) {
    window.location.replace("/raffle_started/" + roomCode + "/" + username);
  });

  // Logic for home button allowing users to be deleted when they leave the raffle
  document.getElementById('home-button').addEventListener('click', function(){
    client.unsubscribe('/rooms/start/' + roomCode)
  });
}