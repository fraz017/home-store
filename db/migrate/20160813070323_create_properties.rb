class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :properties_sub_categories, id: false do |t|
      t.belongs_to :property, index: true
      t.belongs_to :sub_category, index: true
    end
  end
end
