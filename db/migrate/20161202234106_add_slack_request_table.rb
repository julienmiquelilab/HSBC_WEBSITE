class AddSlackRequestTable < ActiveRecord::Migration
  def change
    create_table  :slack_requests do |t|
      t.string :request
    end
  end
end
