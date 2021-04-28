module Api
  module V1
    class FavoritesController < ApplicationController
      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user

      def create
        course = Course.find_by(slug: favorite_params[:course_slug])
        favorite = Favorite.new(user_id: @user.id, course_id: course.id)
        if favorite.save
          render json: all_favs, status: :created
        else
          render json: { error: favorite.errors.messages }, status: :unprocessable_entity
        end
      end

      def index
        render json: all_favs
      end

      def destroy
        fav_course = Course.find_by(slug: params[:slug])
        favorite = Favorite.find_by(course_id: fav_course.id)

        if favorite.destroy
          render json: all_favs
        else
          render json: { error: favorite.errors.messages }, status: :unprocessable_entity
        end
      end

      private

      def options
        @options ||= { include: %i[reviews] }
      end

      def authenticate_user
        # Authorization: Bearer <token>
        token, _options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        @user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized
      end

      def favorite_params
        params.require(:favorite).permit(:course_slug)
      end

      def all_favs
        CourseSerializer.new(@user.favorite_courses, options).serialized_json
      end
      
    end
  end
end
