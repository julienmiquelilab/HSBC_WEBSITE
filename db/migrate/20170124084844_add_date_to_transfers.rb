class AddDateToTransfers < ActiveRecord::Migration
  def change
    add_column :transfers, :date, :datetime
  end
end
