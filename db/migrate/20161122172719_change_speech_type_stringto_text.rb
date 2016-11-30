class ChangeSpeechTypeStringtoText < ActiveRecord::Migration
  def change
    change_column :responses, :speech, :text
  end
end
