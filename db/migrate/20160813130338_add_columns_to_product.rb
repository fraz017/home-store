class AddColumnsToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :availablity, :integer
  	add_column :products, :price, :string
  	add_column :products, :condition, :string
  	add_column :products, :description, :text
  	add_column :products, :specification, :text
  	add_column :products, :sku, :string
  	add_column :products, :details, :string
  	remove_column :products, :quantity
  end
end
