class Booking < ApplicationRecord
  belongs_to :life
  belongs_to :user

  validates :life, :user, :start_date, :end_date, presence: true
  validate :before_end, :dates_taken

  enum status: { pending: 0, accepted: 1, refused: 2, cancelled: 3 }

  def before_end
    if start_date && end_date
      unless start_date < end_date
        errors.add(:start_date, "Start date must be before end date.")
        errors.add(:end_date, "End date must be after start date.")
      end
    end
  end

  def date_range(inst = self)
    Range.new(inst.start_date, inst.end_date).to_a
  end

  def booked_dates
    life.booked_dates
  end

  def pending_bookings
    life.pending_bookings
  end

  def dates_taken
    if booked_dates.any? { |b| date_range.include?(b) } && !refused?
      errors.add(:start_date, "Dates are already booked.")
      errors.add(:end_date, "Dates are already booked.")
      errors.add(:status, "Dates are already booked.")
    end
  end

  def self.accept_or_refuse
    statuses.except :cancelled, :pending
  end

  def possible_conflicts
    pending_bookings.to_a.select do |b|
      b.date_range.any? { |date| self.date_range.include?(date) } unless b == self
    end
  end
end
