class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  attachment :room_image
end
