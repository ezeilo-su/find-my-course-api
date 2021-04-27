require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  describe 'POST /favorites' do
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

    it 'it adds to favorites' do
      token = AuthenticationTokenService.encode(user.id)
      post '/api/v1/favorites',
           params: {
             favorite: {
              course_slug: course.slug               
             }
           },
           headers: {
             'Authorization' => "Bearer #{token}"
           }
      expect(response).to have_http_status(:created)
      expect(response_body).to eq(JSON.parse(CourseSerializer.new(user.favorite_courses).serialized_json)) 
    end
  end

  # describe "GET /favorites" do
  #   it "works! (now write some real specs)" do
  #     get favorites_path
  #     expect(response).to have_http_status(200)
  #   end
  # end
end
