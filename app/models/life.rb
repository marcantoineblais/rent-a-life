class Life < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validate :user, :title, :description, :price, presence: true
end
