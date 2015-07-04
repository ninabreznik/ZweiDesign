class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :measures
      t.string :location
      t.string :unit
      t.integer :amount
      t.integer :price_per_unit
      t.integer :total_price

      t.timestamps
    end
  end
end
