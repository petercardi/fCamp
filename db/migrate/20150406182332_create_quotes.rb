class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote
      t.string :author
      t.integer :user_id
      t.timestamps
    end
  end
end
