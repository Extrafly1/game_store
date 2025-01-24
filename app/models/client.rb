class Client < ApplicationRecord
  has_secure_password
  has_many :client_games
  has_many :games, through: :client_games

  validates :email, presence: true, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }
  validates :password, presence: true, length: { minimum: 6 }, on: :create  # Валидируем пароль только при создании
end
