class AddTimestampsToIntentTable < ActiveRecord::Migration
  def change
    change_table :intents do |t|
      t.timestamps
    end
    change_table :utterances do |t|
      t.timestamps
    end
  end
end
