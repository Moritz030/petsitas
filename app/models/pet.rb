class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers, class_name: "offer", foreign_key: "reference_id"
  has_one_attached :picture
  validates :picture, :name, :location, :species, :description, presence: true
end
