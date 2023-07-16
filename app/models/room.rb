class Room < ApplicationRecord
  #has_many :users, through: :reservations
  belongs_to :user, optional: true
  has_many :reservations
  attachment :room_image

  def self.ransackable_attributes(auth_object = nil)
    ['adress_or_title_or_body']
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :price, presence: true
  validates :adress, presence: true
end
