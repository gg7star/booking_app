class Cleaner < ApplicationRecord
  has_many :bookings

  def name
    return first_name + " " + last_name
  end
end
