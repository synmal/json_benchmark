class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, comments: [:user])

    # render json: @posts
    # render 'posts/index_jb'
    render 'posts/index_jbuilder'
  end
end
