class AddPointsToEntrant < ActiveRecord::Migration[5.2]
  def change
    add_column :entrants, :points, :integer, :null => false, :default => 0
  end
end
