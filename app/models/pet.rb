class Pet < ApplicationRecord
  belongs_to :user
  has_many :offers, class_name: "offer", foreign_key: "reference_id"
end
