class User < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, through: :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def fnln
    "#{first_name} #{last_name}"
  end

end
