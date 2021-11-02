require 'benchmark/ips'

class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, comments: [:user])

    # render json: @posts
    # render 'posts/index_jb'
    # render 'posts/index_jbuilder'
    # render json: PostBlueprint.render(@posts)

    result = Benchmark.ips do |x|
      x.report('jb') { render_to_string 'posts/index_jb' }
      x.report('jbuilder') { render_to_string 'posts/index_jbuilder' }
      x.report('blueprinter') { PostBlueprint.render_as_json(@posts) }
      x.compare!
    end
    render plain: result.data.to_s
  end
end
