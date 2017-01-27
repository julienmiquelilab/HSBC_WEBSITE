class AddFeedBackColumn < ActiveRecord::Migration
  def change
    add_column :intents, :feedback_yes ,:boolean
    add_column :intents, :feedback_no ,:boolean
  end
end
