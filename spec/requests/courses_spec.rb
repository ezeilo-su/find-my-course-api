require 'rails_helper'

RSpec.describe 'Courses', type: :request do
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

  let(:user) do
    FactoryBot.create(
      :user,
      username: 'zeilotech',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  let(:token) { AuthenticationTokenService.encode(user.id) }
  describe 'GET /courses' do
    it 'it returns all courses' do
      get '/api/v1/courses',
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:ok)
      expect(response_body.size).to eq(2)
      expect(response_body['data'].size).to eq(5)
    end
  end

  describe 'GET /course/id' do
    it 'returns a single course' do
      get "/api/v1/courses/#{Course.last.slug}",
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:ok)
    end

    it 'returns error if record is not found' do
      get '/api/v1/courses/no-record',
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
