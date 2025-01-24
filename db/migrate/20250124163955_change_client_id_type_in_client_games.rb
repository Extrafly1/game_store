class ChangeClientIdTypeInClientGames < ActiveRecord::Migration[8.0]
  def change
    change_column :client_games, :client_id, :bigint
  end
end

