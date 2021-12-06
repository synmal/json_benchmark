require 'benchmark/ips'

class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, comments: [:user])

    # render json: @posts
    # render 'posts/index_jb.json.jb'
    # render 'posts/index_jbuilder'
    # render json: PostBlueprint.render(@posts)
    # x.report('as_json') { @posts.to_json }

    result = Benchmark.ips do |x|
      x.config iterations: 5

      x.report('jb') { render_to_string 'posts/index_jb.json.jb' }
      x.report('jbuilder') { render_to_string 'posts/index_jbuilder.json.jbuilder' }
      x.report('blueprinter') { PostBlueprint.render_as_json(@posts) }
      x.compare!
    end
    render plain: result.data.to_s
  end
end
