class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.integer :numbers
      t.string :right_numbers

      t.timestamps
    end
  end
end
