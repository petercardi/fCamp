class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  validates :header, length: { minimum: 5 }
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 0..5, message: "must be between 0 and 5 in half-point increments"
  
end
