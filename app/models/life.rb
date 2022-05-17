class Life < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :user, :title, :description, :price, presence: true
  validates :price, format: { with: /\A\d+.\d{2}\z/, message: 'Format must be #.##' }

  def pending_requests
    Booking.where(life: self, status: :pending)
  end

  def booked_dates
    Booking.where(life: self, status: :accepted).map { |b| b.date_range(b).to_a unless b.id == id }.flatten
  end
end
