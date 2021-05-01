class Offer < ApplicationRecord
  has_many :requests
  belongs_to :pet
  validates :start_date, :end_date, pesence: true
end
