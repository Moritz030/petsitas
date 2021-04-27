class Offer < ApplicationRecord
  has_many :requests
  belongs_to :pet
end
