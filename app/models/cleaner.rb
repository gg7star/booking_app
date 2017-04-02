class Cleaner < ApplicationRecord
  has_many :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :quality_score, in: 0.0..5.0, message: 'This site is only for 0.0 ~ 5.0'

  def name
    return first_name + " " + last_name
  end
end
