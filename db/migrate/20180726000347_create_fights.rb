class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.datetime :created_at, null: false
    end
    add_foreign_key :fights, :fighters, column: :winner_id
    add_foreign_key :fights, :fighters, column: :loser_id
  end
end