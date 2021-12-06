class PostBlueprint < Blueprinter::Base
  identifier :id

  fields :id, :content
  field :author do |post|
    post.user.username
  end

  association :comments, blueprint: CommentBlueprint

  # NOTE: Able to support "view"
  # view :normal do
  #   fields :first_name, :last_name
  # end

  # view :extended do
  #   include_view :normal
  #   field :address
  #   association :projects
  # end
end