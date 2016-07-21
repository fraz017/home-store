class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.string :name
      t.boolean :state
      t.integer :intensity

      t.timestamps null: false
    end
  end
end
