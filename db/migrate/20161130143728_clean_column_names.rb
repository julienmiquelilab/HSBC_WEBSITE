class CleanColumnNames < ActiveRecord::Migration
  def change
    remove_column :card_types, :overdraft_value_max
    add_column :card_types, :advantages, :text
  end
end
