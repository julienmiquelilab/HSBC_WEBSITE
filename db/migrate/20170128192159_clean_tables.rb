class CleanTables < ActiveRecord::Migration
  def change
    rename_table :user_questions, :user_feedbacks
    drop_table :responses
  end
end
