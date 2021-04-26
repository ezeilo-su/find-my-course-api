module Api
  module V1
    class AuthenticationController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      def create
        p params.require(:username).inspect
        p params.require(:password).inspect
        render json: { token: '123' }, status: :created
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
