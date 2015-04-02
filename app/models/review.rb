class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :header, length: { minimum: 5 }
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 1..5
end
