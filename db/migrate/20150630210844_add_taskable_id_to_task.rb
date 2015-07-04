class AddTaskableIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :taskable_id, :integer
  end
end
