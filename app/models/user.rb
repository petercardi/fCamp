class User < ActiveRecord::Base

  has_secure_password

  has_many :quotes
  has_many :reviews
  has_many :restaurants, through: :reviews
  has_many :rcomments

  validates :first_name, :last_name, :password, presence: true
  validates :email, presence: true, uniqueness: true
  # validates_exclusion_of :password, in: /passwo[o0]rd/i, message: 'P-A-S-S-W-O-R-D? P-L-E-A-S-E.'

  def fnln
    "#{first_name} #{last_name}"
  end

end
