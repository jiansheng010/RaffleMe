#
# Used for manages websocket connections while the server is running
#
# 4/16/2019 - Created RoomSocketController - Tom Paoloni
#
class RoomSocketController < FayeRails::Controller
  #
  # Watches for websocket posts to the /rooms channel
  # On a publish, this means an entrant has joined a room
  # and so the entrant is added to the database
  #
  channel '/rooms' do
    subscribe do
      entrant_params = {
        username: message['user'],
        room_code: message['room_code'],
        client_id: message['cid'],
        email: message['email']
      }

      entrant = Entrant.new(entrant_params)
      entrant.save
    end
  end

  #
  # Watches for when an entrant leaves the final page of
  # the raffle. On leaving, that entrant is destroyed
  #
  channel '/rooms/end/**' do
    monitor :unsubscribe do
      entrant = Entrant.find_by(client_id: client_id)
      entrant&.destroy
    end
  end

  #
  # Watches for when someone ends a default room
  # connected to a /rooms/connected/room-code channel
  #
  # On leaving, the room is removed from the db
  #
  channel '/rooms/connected/**' do
    monitor :unsubscribe do
      room = Room.find_by(room_code: channel[-4..-1])
      room&.destroy if room&.owner.nil?
    end
  end

  #
  # Watches for the creation of a raffle entrant
  # On creation, a message is published to the management
  # page for that room.
  #
  observe Entrant, :after_create do |new_entrant|
    client = Faye::Client.new('http://68.183.129.46:22/faye')
    client.publish("/rooms/connected/#{new_entrant[:room_code]}", { user: new_entrant[:username], cid: new_entrant[:client_id] })
  end

  #
  # Watches for when an entrant is removed from the database
  # On removal, a message is sent to the room management
  # page to remove that user from the list
  #
  observe Entrant, :after_destroy do |destroyed_entrant|
    RoomSocketController.publish(
      "/rooms/disconnected/#{destroyed_entrant[:room_code]}",
      cid: destroyed_entrant[:client_id]
    )
  end
end
