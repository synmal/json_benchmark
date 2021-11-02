class CommentBlueprint < Blueprinter::Base
  identifier :id

  fields :id, :content
  field :author do |post|
    post.user.username
  end
end