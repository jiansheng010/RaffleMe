class CreateEntrants < ActiveRecord::Migration[5.2]
  def change
    create_table :entrants do |t|
      t.string :username
      t.string :room_code

      t.timestamps
    end
  end
end
