class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :bank_account_id
      t.integer :amount
      t.string :transmitter

      t.timestamps null: false
    end
    add_foreign_key :transactions, :bank_accounts

  end
end
