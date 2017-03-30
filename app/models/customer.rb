class Customer < ApplicationRecord
  has_many :bookings
  has_many :custome_bookings

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    return first_name + " " + last_name
  end
end
