class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :responses, :action, :intent_name
  end
end
