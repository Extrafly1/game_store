class CreateClientGames < ActiveRecord::Migration[8.0]
  def change
    create_table :client_games do |t|
      t.references :client, null: false, foreign_key: true, type: :bigint
      t.references :game, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end


