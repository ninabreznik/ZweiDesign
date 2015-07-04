class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.integer :subtotal_price

      t.timestamps
    end
  end
end
