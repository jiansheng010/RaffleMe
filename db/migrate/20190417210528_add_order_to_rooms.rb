class AddOrderToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :order, :string
  end
end
