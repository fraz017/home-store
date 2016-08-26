class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :transaction_date
      t.string :status
      t.string :reference
      t.string :domain
      t.references :order, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
