class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :hours
      t.string :website
      t.text :description
      t.timestamps
    end
  end
end
