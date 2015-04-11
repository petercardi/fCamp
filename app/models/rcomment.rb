class Rcomment < ActiveRecord::Base

  belongs_to :user
  belongs_to :review

  validates_presence_of :comment, message: 'with a blank? Really??'

end
