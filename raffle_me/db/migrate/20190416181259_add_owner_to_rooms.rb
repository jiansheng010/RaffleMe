class AddOwnerToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :owner, :string
  end
end
