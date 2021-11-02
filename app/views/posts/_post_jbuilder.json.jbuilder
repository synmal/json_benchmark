json.id post.id
json.content post.content
json.author post.user.username
json.comments do
  json.array! post.comments, partial: 'comments/comment_jbuilder', as: :comment
end