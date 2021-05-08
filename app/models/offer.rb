class Offer < ApplicationRecord
  has_many :requests, dependent: :destroy
  belongs_to :pet
  has_one :user, through: :pet
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  include PgSearch::Model
  pg_search_scope :pet_search,
    associated_against: {
      pet: [ :species, :description ]
    },
    using: {
      tsearch: { prefix: true }
    }
  # pg_search_scope :pet_location_search,
  #   associated_against: {
  #     pet: [ :location ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  #   }

  private

  def end_date_after_start_date
    errors.add(:end_date, "should be after start date") if end_date <= start_date
  end
end
