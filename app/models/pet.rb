class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_many :requests, through: :offers, dependent: :destroy
  has_one_attached :picture
  validates :user, :picture, :name, :location, :species, :description, presence: true
end
