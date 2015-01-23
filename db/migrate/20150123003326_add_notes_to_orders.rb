class AddNotesToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :notes, :text
    add_column :orders, :notes, :text, default: "Vaši osebni zapiski o stranki in projektu.Vidni so samo vam."
  end
end
