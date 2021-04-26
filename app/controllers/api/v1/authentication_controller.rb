module Api
  module V1
    class AuthenticationController < ApplicationController
      class AuthenticationError < StandardError;  end

      rescue_from ActionController::ParameterMissing, with: :parameter_missing
      rescue_from AuthenticationError, with: :handle_unauthenticated

      def create
        raise AuthenticationError unless user.authenticate(params.require(:password))
        token = AuthenticationTokenService.call(user.id)

        render json: { token: token }, status: :created
      end

      private

      def auth_params
        params.require(:authenticate).permit(%i[username password])
      end

      def parameter_missing(err)
        render json: { error: err.message }, status: :unprocessable_entity
      end

      def handle_unauthenticated
        head :unauthorized
      end

      def user
        @user ||= User.find_by(username: params.require(:username))
      end
      
    end
  end
end
