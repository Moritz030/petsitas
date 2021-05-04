class Request < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  attribute :status, :string, default: 'open'
  validates :user, :message, :offer, presence: true
end
