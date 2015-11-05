class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :price
      t.integer :user_id
      t.integer :lead_id

      t.timestamps
    end
  end
end
