module Api
  module V1 
    class CommentsController < ApplicationController
      before_action :set_comment, only: [:show, :update, :destroy]
    
      # GET /comments
      def index
        @comments = Comment.all
    
        render json: @comments
      end
    
      # GET /comments/1
      def show
        render status: 200, json: @comment
      end
    
      # POST /comments
      def create
        @comment = Comment.new(comment_params)
    
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /comments/1
      def update
        if @comment.update(comment_params)
          render json: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /comments/1
      def destroy
        @comment.destroy
        render status: 200, json: { message: "comment was successfully deleted"}
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_comment
          @comment = Comment.find_by(id: params[:id])
          render status: 404, json: {message: "comment not found"} unless @comment
        end
    
        # Only allow a list of trusted parameters through.
        def comment_params
          params.require(:comment).permit(:content, :user_id, :post_id)
        end
    end
  end
end     