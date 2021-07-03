module Api
  module V1 
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      skip_before_action :authenticate_request, only: [:show, :index]


      # GET /posts
      def index
        @posts = Post.all
        @serialized_posts = PostBlueprint.render(@posts)
        render status: 200, json: @serialized_posts
      end

      # GET /posts/1
      def show
        serialize_post = PostBlueprint.render(@post, view: :show)
        render status: 200, json: serialize_post
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      def destroy
        @post.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
          @post = Post.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def post_params
          params.require(:post).permit(:content, :user_id)
        end
    end
  end 
end 
