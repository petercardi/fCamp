class Qcomment < ActiveRecord::Base

  belongs_to :user
  belongs_to :quote

  validates :comment, presence: true

end
