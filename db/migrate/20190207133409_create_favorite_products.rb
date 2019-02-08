class CreateFavoriteProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_products do |t|
      t.integer :user_id, :null => false
      t.integer :product_id, :null => false
      t.timestamps
    end
    add_index("favorite_products", "user_id")
    add_index("favorite_products", "product_id")
  end
end
