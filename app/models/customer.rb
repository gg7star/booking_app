class Customer < ApplicationRecord
  has_many :bookings
  has_many :custome_bookings

  def name
    return first_name + " " + last_name
  end
end
