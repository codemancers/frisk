module Api::V1
  class PostsController < ApiController
    def index
      posts = [ {title: 'MyTitle', body: 'MyBody'} ]
      render json: posts.to_json, status: :ok
    end
  end
end
