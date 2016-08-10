class RemoveColumnFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :name
  	remove_column :users, :nickname
  end
end
