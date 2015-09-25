class AddTrackinIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tracking_id, :string
  end
end
