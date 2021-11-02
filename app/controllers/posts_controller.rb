class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, comments: [:user])

    render json: @posts
  end
end
