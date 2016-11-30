class RenameTypingErrors < ActiveRecord::Migration
  def change
    rename_column :transfers, :desciption, :description
  end
end
