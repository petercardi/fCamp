class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :header
      t.float :rating
      t.text :body
    end
  end
end
