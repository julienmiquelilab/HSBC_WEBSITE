class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :balance
      t.integer :category
      t.integer :user_id
      t.timestamps null: false
    end
    add_foreign_key :bank_accounts, :users

  end
end
