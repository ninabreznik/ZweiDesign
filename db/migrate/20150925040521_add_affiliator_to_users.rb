class AddAffiliatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :affiliator, :string
  end
end
