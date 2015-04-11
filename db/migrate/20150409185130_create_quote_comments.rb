class CreateQuoteComments < ActiveRecord::Migration
  def change
    create_table :qcomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :quote_id
      t.timestamps
    end
  end
end
