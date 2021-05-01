class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :picture
  validates :picture, :name, :location, :species, :description, presence: true
end
