class Request < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_one :pet, through: :offer
  attribute :status, :string, default: 'open'
  validates :user, :message, :offer, presence: true
end
