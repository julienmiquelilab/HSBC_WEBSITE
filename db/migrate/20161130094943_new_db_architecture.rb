class NewDbArchitecture < ActiveRecord::Migration
  def change
    remove_column :responses, :user_id, :integer
    drop_table :transactions
    drop_table :bank_accounts
    drop_table :users

    create_table :clients do |t|
     t.string :lastname
     t.string :firstname
     t.date :birthdate
     t.string :email
     t.string :login
     t.string :password
     t.integer :agency_id
     t.integer :advisor_id
    end

    create_table :agencies do |t|
     t.string :name
     t.string :address
     t.string :phone_number
    end

    create_table :account_types do |t|
     t.string :type
     t.integer :overdraft_max
     t.integer :overdraft_min
     t.integer :rate
     t.integer :celling
    end

    create_table :advisors do |t|
     t.string :lastname
     t.string :firstname
     t.string :email
     t.string :phone_number
     t.integer :agency_id
    end

    create_table :accounts do |t|
     t.integer :balance
     t.integer :overdraft_value_max
     t.integer :type_account_id
     t.integer :client_id
    end

    create_table :card_types do |t|
     t.integer :type
     t.integer :overdraft_value_max
     t.integer :type_account_id
    end

    create_table :transfers do |t|
     t.integer :amount
     t.text :desciption
     t.integer :receiver_account_id
     t.integer :sender_account_id
    end


  end
end
