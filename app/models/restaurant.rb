class Restaurant < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :hours, presence: true
  validates :phone_number, allow_blank: true, numericality: true
end
