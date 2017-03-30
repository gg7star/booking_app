class CreateCleaners < ActiveRecord::Migration[5.0]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.decimal :quality_score

      t.timestamps
    end
  end
end
