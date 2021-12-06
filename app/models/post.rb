class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  # Used by jBuilder
  def author
    self.user.username
  end
end
