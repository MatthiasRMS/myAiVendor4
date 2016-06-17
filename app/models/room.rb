class Room < ApplicationRecord
  has_many :messages, :dependent => :delete_all
  belongs_to :bot
end
