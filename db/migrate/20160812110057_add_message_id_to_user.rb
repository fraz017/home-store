class AddMessageIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :message_id, :string
  end
end
