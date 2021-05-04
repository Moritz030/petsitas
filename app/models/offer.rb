class Offer < ApplicationRecord
  has_many :requests
  belongs_to :pet
  has_one :user, through: :pet
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    errors.add(:end_date, "should be after start date") if end_date <= start_date
  end
end
