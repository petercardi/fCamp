class Quote < ActiveRecord::Base

  belongs_to :user

  validates :quotation, :author, presence: true
  validates :quotation, length: { minimum: 10 }

end
