class CreateBillingAddresses < ActiveRecord::Migration
  def change
    create_table :billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.text :address
      t.string :pincode
      t.string :area
      t.string :landmark
      t.string :city
      t.string :state
      t.string :country
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
