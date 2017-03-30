class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner

  validates :customer, presence: true
  validates :cleaner, presence: true
end
