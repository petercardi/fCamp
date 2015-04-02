class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :hours, presence: true
end
