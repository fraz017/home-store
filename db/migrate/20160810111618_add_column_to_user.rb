class AddColumnToUser < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :mobile_number, :string
  	add_column :users, :company_name, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :pincode, :string
  	add_column :users, :street_1, :string
  	add_column :users, :street_2, :string
  	add_column :users, :landline_number, :string
  end
end
