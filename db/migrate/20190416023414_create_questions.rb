class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :prompt
      t.string :correct_answer
      t.string :wrong_answer_1
      t.string :wrong_answer_2
      t.string :wrong_answer_3
      t.string :user_email

      t.timestamps
    end
  end
end
