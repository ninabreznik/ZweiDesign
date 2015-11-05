class AddProjectIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :project_id, :integer
  end
end
