class CreateReviewComments < ActiveRecord::Migration
  def change
    create_table :rcomments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :review_id
      t.timestamps
    end
  end
end
