require 'benchmark/ips'

class PostsController < ApplicationController
  def index
    # NOTE: Render this
    # [
    #   {
    #     "id": "1",
    #     "content": "Post Content",
    #     "author": "Post Author",
    #     "comments": [
    #       {
    #         "id": "1",
    #         "content": "Comment content",
    #         "author": "Comment author"
    #       },
    #       ...
    #     ],
    #   },
    #   ...
    # ]

    @posts = Post.includes(:user, comments: [:user])

    # render json: @posts.as_json(
    #   only: [:id, :content],
    #   methods: [:author],
    #   include: [
    #     comments: {
    #       only: [ :id, :content ],
    #       methods: [:author]
    #     }
    #   ]
    # )

    # render 'posts/index_jb.json.jb'
    # render 'posts/index_jbuilder.json.jbuilder'
    # render json: PostBlueprint.render(@posts)
    # x.report('as_json') { render_to_string json: @posts }

    result = Benchmark.ips do |x|
      # x.config iterations: 5

      x.report('jb') { render_to_string 'posts/index_jb.json.jb' }

      x.report('jbuilder') { render_to_string 'posts/index_jbuilder.json.jbuilder' }

      x.report('blueprinter') { render_to_string json: PostBlueprint.render(@posts) }

      x.report('as_json') {
        render_to_string json: @posts.as_json(
          only: [:id, :content],
          methods: [:author],
          include: [
            comments: {
              only: [ :id, :content ],
              methods: [:author]
            }
          ]
        )
      }

      x.compare!
    end

    render json: result.data
  end
end
