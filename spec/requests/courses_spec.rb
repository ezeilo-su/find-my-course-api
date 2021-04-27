require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  describe 'GET /courses' do
    before do
      5.times do |i|
        FactoryBot.create(
          :course,
          title: "REST APIs in Rails-#{i + 1}",
          description: 'Learn how to create RESTFul API-only apps using Ruby on Rails',
          duration: '6 months'
        )
      end
    end

    it 'it returns all courses' do
      get '/api/v1/courses',
          headers: {
            'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwidXNlcl9pZCI6IjEifQ.VV1SeoouiWqjlgs-3Z6zKBfNQ2K9TfajiBre_qJiOZQ'
          }
      expect(response).to have_http_status(:success)
      expect(response_body.size).to eq(2)
      expect(response_body['data'].size).to eq(5)
    end
  end
end
