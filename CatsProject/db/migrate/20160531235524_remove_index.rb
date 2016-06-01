class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index(:cat_rental_requests, [:cat_id, :status])
    change_column :cat_rental_requests, :status, :string, null: true 
  end
end
