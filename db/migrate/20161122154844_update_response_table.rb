class UpdateResponseTable < ActiveRecord::Migration
  def change
    remove_column :responses, :slots, :jsonb
    remove_column :responses, :response_text, :string
    add_column :responses, :speech, :string
    add_column :responses, :display_text, :text
    add_column :responses, :data, :string
    add_column :responses, :source, :string
    add_column :responses, :parameter_value, :string
    rename_column :responses, :intent, :action
  end
end
