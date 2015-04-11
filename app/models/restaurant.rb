class Restaurant < ActiveRecord::Base

  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :hours, presence: true
  validates :phone_number, allow_blank: true, numericality: true

  def avg_rating
    reviews = self.reviews
    scores = 0
    reviews.each do |r|
      scores += r.rating
    end
    avg = scores / reviews.count
    avg.round(1)
  end

end
