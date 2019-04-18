class AddEntrantsIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :entrants, [:username, :room_code], unique: true
  end
end
