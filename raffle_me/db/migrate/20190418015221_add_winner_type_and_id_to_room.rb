class AddWinnerTypeAndIdToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :winner_id, :integer
    add_column :rooms, :random_winner, :boolean
  end
end
