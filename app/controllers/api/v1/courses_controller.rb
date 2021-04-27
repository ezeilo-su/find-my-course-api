module Api
  module V1
    class CoursesController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user, only: :index # , except: [ :index ]

      def index
        courses = Course.all
        render json: CourseSerializer.new(courses, options).serialized_json, status: :ok
      end

      private

      def options
        @options ||= { include: %i[reviews] }
      end

      def authenticate_user
        # Authorization: Bearer <token>
        token, options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized
      end
    end
  end
end
