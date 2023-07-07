class Room < ApplicationRecord
  #has_many :users, through: :reservations
  belongs_to :user, optional: true
  has_many :reservations
  attachment :room_image
end
