class AddTotalPriceToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :total_price, :integer
  end
end
