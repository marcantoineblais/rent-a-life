class Life < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :user, :title, :description, :price, presence: true
  validates :price, format: { with: /\A\d+.\d{2}\z/, message: 'Format must be #.##' }
end
