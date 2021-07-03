module Api
  module V1 
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: [:create, :index, :show]
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /users
      def index
        @users = User.all
        @serialized_users = UserBlueprint.render(@users, view: :index)
        render status: 200, json: @serialized_users
      end

      # GET /users/1
      def show
        @serialized_user = UserBlueprint.render(@user, view: :index)
        render status: 200, json: @serialized_user
      end

      # POST /users
      def create
        @user = User.new(user_params)
        if @user.save
          command = AuthenticateUser.call(params[:user][:email], params[:user][:password])
          render status: 200, json: {
            user: @user,
            auth_token: command.result
          }
        else
          render status: 400, json: {
            error: @user.errors.full_messages
          }
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        @user.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
    end
  end
end 