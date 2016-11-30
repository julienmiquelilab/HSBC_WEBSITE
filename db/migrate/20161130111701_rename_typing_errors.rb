class RenameTypingErrors < ActiveRecord::Migration
  def change
    rename_column :transfers, :desciption, :description
    rename_column :account_types, :type, :kind
    rename_column :accounts, :type_account_id, :account_type_id
    rename_column :card_types, :type, :kind
    change_column :card_types, :kind, :string
    remove_column :card_types, :type_account_id
    add_column :accounts, :card_type_id, :integer

  end
end
