class Booking < ApplicationRecord
  belongs_to :life
  belongs_to :user

  validate :life, :user, presence: true
end
