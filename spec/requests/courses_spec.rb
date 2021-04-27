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

    let(:user) do
      FactoryBot.create(
        :user,
        username: 'zeilotech',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it 'it returns all courses' do
      token = AuthenticationTokenService.encode(user.id)
      get '/api/v1/courses',
          headers: {
            'Authorization' => "Bearer #{token}"
          }
      expect(response).to have_http_status(:ok)
      expect(response_body.size).to eq(2)
      expect(response_body['data'].size).to eq(5)
    end
  end
end
