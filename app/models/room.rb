class Room < ApplicationRecord  
  has_one_attached :room_image
  belongs_to :user
  has_many :reservations

  validates :room_name, :room_introducution, :charge, :address, :room_image, presence: true

  def self.looks_word(area)
    Room.where("address LIKE?","%#{area}%")
  end

  def self.lools_word_area(area,word)
    Room.where(["address LIKE? AND room_name LIKE? OR room_introducution LIKE?","%#{area}%","%#{word}%","%#{word}%"])
  end

end
