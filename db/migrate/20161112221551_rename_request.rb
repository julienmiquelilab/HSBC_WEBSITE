class RenameRequest < ActiveRecord::Migration
  def change
    rename_table :requests, :responses
  end
end
