class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  attachment :room_image
  def room
		return Room.find_by(id: self.room_id)
	end
end
