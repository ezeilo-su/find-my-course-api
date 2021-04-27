require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  let(:course) do
    FactoryBot.create(
      :course,
      title: "REST APIs in Rails",
      description: "Learn how to create RESTFul API-only apps using Ruby on Rails",
      duration: "6 months",
    )
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

  before do    
    post '/api/v1/favorites',
    params: {
      favorite: {
       course_slug: course.slug               
      }
    },
    headers: {
      'Authorization' => "Bearer #{token}"
    }
  end
  
  describe 'POST /favorites' do
    it 'it adds to favorites' do
      expect(response).to have_http_status(:created)
      expect(response_body).to eq(JSON.parse(CourseSerializer.new(course).serialized_json)) 
    end
  end

  describe "GET /favorites" do
    it 'returns all favorites' do
      get '/api/v1/favorites',
           headers: {
             'Authorization' => "Bearer #{token}"
           }
      expect(response).to have_http_status(:ok)
      expect(response_body['data'].size).to eq(1) 
    end
  end

  describe 'DELETE /favorites' do
    it 'removes a course from favorites' do
      delete "/api/v1/favorites/#{course.slug}",
      headers: {
        'Authorization' => "Bearer #{token}"
      }      
    end
  end
end
