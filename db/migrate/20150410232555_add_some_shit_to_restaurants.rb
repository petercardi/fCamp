class AddSomeShitToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :beer, :boolean
    add_column :restaurants, :wine, :boolean
    add_column :restaurants, :full_bar, :boolean
    add_column :restaurants, :vegetarian, :boolean
    add_column :restaurants, :vegan, :boolean
    add_column :restaurants, :price_range, :integer
    add_column :restaurants, :quick, :boolean
  end
end
