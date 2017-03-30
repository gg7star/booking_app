class CustomeBooking < ApplicationRecord
  belongs_to :customer
  validates :name, presence: true
  validates :customer, presence: true
end
