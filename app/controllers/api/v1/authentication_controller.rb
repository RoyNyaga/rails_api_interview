module Api
  module V1 
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate_request
     
      def authenticate
        
        command = AuthenticateUser.call(params[:email], params[:password])
        if command.success?
          render status: 200, json: { auth_token: command.result }
        else
          render status: 401, json: { error: command.errors }
        end
      end
    end 
  end 
end 