class CreateGames < ActiveRecord::Migration[8.0]
  def change
    create_table :games, id: :bigint do |t|
      t.string :game_name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
