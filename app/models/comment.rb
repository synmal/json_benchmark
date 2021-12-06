class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Used by jBuilder
  def author
    self.user.username
  end
end
