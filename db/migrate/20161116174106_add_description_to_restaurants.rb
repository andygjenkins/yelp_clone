class AddDescriptionToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :description, :string
    add_column :restaurants, :text, :string
  end
end
