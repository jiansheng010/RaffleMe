class AddClientIdToEntrants < ActiveRecord::Migration[5.2]
  def change
    add_column :entrants, :client_id, :string
  end
end
