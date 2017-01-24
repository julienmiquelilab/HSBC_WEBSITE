class AddTableForChatBot < ActiveRecord::Migration
  def change
    drop_table :slack_requests

    create_table :utterances do |t|
      t.string :text
      t.integer :intent_id
    end

    create_table :intents do |t|
      t.string :response_text
    end

    create_table :user_questions do |t|
      t.string :asked_question
      t.string :retrieved_response
      t.boolean :is_correct
      t.datetime :date
    end

    add_foreign_key :utterances, :intents

  end
end
