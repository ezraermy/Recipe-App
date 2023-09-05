class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
    add_index :recipes, :user_id
    add_index :recipes, :name
  end
end
