class AddEmailToEntrant < ActiveRecord::Migration[5.2]
  def change
    add_column :entrants, :email, :string
  end
end
