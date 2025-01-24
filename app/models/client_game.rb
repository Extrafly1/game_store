class ClientGame < ApplicationRecord
  belongs_to :client
  belongs_to :game
end
