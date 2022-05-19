class Life < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  monetize :price_cents
  validates :user, :title, :description, :price_cents, presence: true
  # validates :price, format: { with: /\A\d+.\d{2}\z/, message: 'Format must be 0.00' }

  def pending_requests
    Booking.where(life: self, status: :pending)
  end

  def booked_dates
    Booking.where(life: self, status: :accepted).map { |b| b.date_range(b).to_a unless b.id == id }.flatten
  end
end
