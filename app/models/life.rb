class Life < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :user, :title, :description, :price, presence: true
  validates :price, format: { with: /\A\d+.\d{2}\z/, message: 'Format must be #.##' }

  def pending_requests
    Booking.where(life: self, status: 0)
  end

  def booked_dates
    Booking.where(life: self, status: 1).map { |b| b.date_range(b).to_a }.flatten
  end
end
