class User < ActiveRecord::Base

  has_secure_password

  has_many :quotes
  has_many :reviews
  has_many :restaurants, through: :reviews

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def fnln
    "#{first_name} #{last_name}"
  end

end
