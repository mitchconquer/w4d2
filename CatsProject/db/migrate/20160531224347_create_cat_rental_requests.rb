class CreateCatRentalRequests < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.string :status, null: false, default: "PENDING"
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :cat_id, null: false
      t.timestamps null: false
    end
    add_index :cat_rental_requests, [:cat_id, :status], unique: true
  end
end
