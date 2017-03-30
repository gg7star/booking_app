class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :customer, foreign_key: true
      t.references :cleaner, foreign_key: true

      t.timestamps
    end
  end
end
