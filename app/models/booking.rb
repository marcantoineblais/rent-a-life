class Booking < ApplicationRecord
  belongs_to :life
  belongs_to :user

  validates :life, :user, :start_date, :end_date, presence: true
  validate :before_end, :dates_taken

  def before_end
    errors.add(:start_date, "Start date must be before end date.") unless start_date < end_date
  end

  def date_range(inst = self)
    Range.new(inst.start_date, inst.end_date).to_a
  end

  def booked_dates
    Booking.where(life: life).map { |b| date_range(b).to_a unless b.id == id }.compact.flatten
  end

  def dates_taken
    if booked_dates.any? { |b| p date_range.include?(b) }
      errors.add(:start_date, "Dates are already booked.")
    end
  end
end
