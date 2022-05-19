class Life < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  monetize :price_cents
  validates :user, :title, :description, :address, :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }

  def pending_requests
    Booking.where(life: self, status: :pending)
  end

  def booked_dates
    Booking.where(life: self, status: :accepted).map { |b| b.date_range(b).to_a unless b.id == id }.flatten
  end

  def pending_bookings
    Booking.where(life: self, status: :pending)
  end
end
