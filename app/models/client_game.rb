class ClientGame < ApplicationRecord
  belongs_to :client
  belongs_to :game

  # Валидация на уникальность комбинации client_id и game_id
  validates :client_id, uniqueness: { scope: :game_id, message: "игра уже добавлена" }
end
