class AddTaskableTypeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :taskable_type, :string
  end
end
