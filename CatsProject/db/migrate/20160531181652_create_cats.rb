class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birthdate, null: false
      t.timestamps null: false
      t.integer :age, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, length: 1, null: false
      t.text :description, null: false
    end
  end
end
