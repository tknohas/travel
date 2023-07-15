class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true
  attachment :room_image
  def room
		return Room.find_by(id: self.room_id)
	end

  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :people_number, presence: true
  validate :check_in_check_out

  def check_in_check_out
    return if check_in.nil? || check_out.nil?
    if check_out <= check_in
      errors.add(:check_out, "にはチェックイン日より後の日付を入力してください") 
    end
  end
end
