module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        p params.require(:password).inspect
        user = User.find_by(username: params.require(:username))
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
    end
  end
end
