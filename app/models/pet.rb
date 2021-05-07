class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_many :requests, through: :offers, dependent: :destroy
  has_one_attached :picture
  validates :user, :picture, :name, :location, :species, :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
