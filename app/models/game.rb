class Game < ApplicationRecord
  has_many :client_games
  has_many :clients, through: :client_games

  validates :game_name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
