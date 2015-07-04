class AddServiceableTypeToService < ActiveRecord::Migration
  def change
    add_column :services, :serviceable_type, :string
  end
end
