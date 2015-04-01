class User < ActiveRecord::Base
  has_many :reviews
  has_many :restaurants, through: :reviews

  def fnln
    "#{first_name} #{last_name}"
  end

end
