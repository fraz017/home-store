class CreateCustomerInfos < ActiveRecord::Migration
  def change
    create_table :customer_infos do |t|
      t.integer :customer_id
      t.string :customer_code
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :authorization_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
