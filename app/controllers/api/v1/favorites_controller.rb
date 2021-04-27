module Api
  module V1
    class FavoritesController < ApplicationController

      include ActionController::HttpAuthentication::Token

      before_action :authenticate_user

      def create
        course = Course.find_by(slug: favorite_params[:course_slug])
        favorite = Favorite.new(user_id: @user.id, course_id: course.id)
        if favorite.save          
          render json: CourseSerializer.new(@user.favorite_courses).serialized_json, status: :created
        else
          render json: { error: favorites.errors.messages }, status: :unprocessable_entity
        end
      end

      # def destroy
      #   review = Review.find(params[:id])
      #   if review.destroy
      #     head :no_content
      #   else
      #     render json: { error: review.errors.messages }, status: :unprocessable_entity
      #   end
      # end
            
      private

      def options
        @options ||= { include: %i[reviews] }
      end

      def authenticate_user
        # Authorization: Bearer <token>
        token, options = token_and_options(request)
        user_id = AuthenticationTokenService.decode(token)
        @user = User.find(user_id)
      rescue ActiveRecord::RecordNotFound
        render status: :unauthorized
      end

      def favorite_params
        params.require(:favorite).permit(:course_slug)
      end
    end
  end
end