class AddUserToTables < ActiveRecord::Migration
  def change
  	add_column :rooms, :user_id, :integer
  	add_column :switches, :room_id, :integer
  end
end
