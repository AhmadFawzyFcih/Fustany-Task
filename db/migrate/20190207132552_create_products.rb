class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :user_id , :null => false
      t.integer :category_id, :null => false
      t.string :name , :null => false
      t.text :description , :null => true
      t.text :image, :null => true
      t.timestamps
    end
    add_index("products", "user_id")
    add_index("products", "category_id")
  end
end
