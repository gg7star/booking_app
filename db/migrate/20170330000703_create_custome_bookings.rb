class CreateCustomeBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :custome_bookings do |t|
      t.string :name
      t.integer :customer_id

      t.timestamps
    end
  end
end
