class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :sub_category_id
      t.integer :quantity
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
