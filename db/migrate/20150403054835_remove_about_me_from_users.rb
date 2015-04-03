class RemoveAboutMeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :about_me
  end
end
