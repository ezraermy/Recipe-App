class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :measurement_unit
      t.integer :price
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
    add_index :foods, :user_id
    add_index :foods, :name
  end
end