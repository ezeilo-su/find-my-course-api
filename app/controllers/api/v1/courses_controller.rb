module Api
  module V1
    class CoursesController < ApplicationController
      def index
        courses = Course.all
        render json: CourseSerializer.new(courses, options).serialized_json, status: :ok
      end
      
      private

      def options
        @options ||= { include: %i[reviews] }
      end
    end
  end
end