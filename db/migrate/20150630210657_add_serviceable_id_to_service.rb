class AddServiceableIdToService < ActiveRecord::Migration
  def change
    add_column :services, :serviceable_id, :integer
  end
end
