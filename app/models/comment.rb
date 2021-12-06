class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def author
    self.user.username
  end
end
