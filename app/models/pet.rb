class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_one_attached :picture
  validates :picture, presence: true
end
