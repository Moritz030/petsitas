class Request < ApplicationRecord
  belongs_to :user
  has_one :pet, class_name: "pet", foreign_key: "pet_id"
end
