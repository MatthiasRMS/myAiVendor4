class Room < ApplicationRecord
  has_many :messages
  belongs_to :bot
end
