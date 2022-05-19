class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lives
  has_many :bookings, through: :lives

  validates :first_name, :last_name, :email, presence: true, uniqueness: true

  def fullname
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
