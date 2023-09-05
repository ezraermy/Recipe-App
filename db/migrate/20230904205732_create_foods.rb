class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :measurement_unit, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :quantity, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :foods, [:name, :user_id], unique: true
  end
end
