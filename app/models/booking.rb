class Booking < ApplicationRecord
  belongs_to :life
  belongs_to :user

  validates :life, :user, :start_date, :end_date, presence: true
  validate :before_end, :dates_taken

  enum status: { pending: 0, accepted: 1, refused: 2, cancelled: 3 }

  def before_end
    errors.add(:start_date, "Start date must be before end date.") unless start_date < end_date
  end

  def date_range(inst = self)
    Range.new(inst.start_date, inst.end_date).to_a
  end

  def booked_dates
    life.booked_dates
  end

  def dates_taken
    if booked_dates.any? { |b| date_range.include?(b) }
      errors.add(:start_date, "Dates are already booked.")
    end
  end

  def self.accept_or_refuse
    statuses.except :cancelled, :pending
  end
end
