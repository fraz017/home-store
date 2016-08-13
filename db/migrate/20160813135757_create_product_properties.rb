class CreateProductProperties < ActiveRecord::Migration
  def change
    create_table :product_properties do |t|
      t.belongs_to :product, index: true
      t.belongs_to :property, index: true
      t.string :value
      
      t.timestamps null: false
    end
  end
end
