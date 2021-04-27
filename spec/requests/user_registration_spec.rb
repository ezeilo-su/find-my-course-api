require 'rails_helper'

RSpec.describe 'UserRegistrations', type: :request do
  describe 'POST /signup' do
    it 'registers a user when all fields are valid' do
        expect {
          post '/api/v1/signup', params: {
          user: {
            username: 'zeilotech',
            password: 'password',
            password_confirmation: 'password'
          }
        }
      }.to change { User.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      user = User.find_by(username: 'zeilotech')
      expected_token = AuthenticationTokenService.encode(user.id)
      expect(response_body).to eq({
                                    'token' => expected_token.to_s,
                                    'username' => user.username
                                  })
    end

    it 'returns error when username is missing' do
      post '/api/v1/signup', params: {
        user: {
          password: 'password',
          password_confirmation: 'password'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response_body).to eq({ 'error' => { 'username' => ["can't be blank",
                                                                'is too short (minimum is 6 characters)'] } })
    end

    it 'returns error when password is missing' do
      post '/api/v1/signup', params: {
        user: {
          username: 'zeilotech',
          password_confirmation: 'password'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response_body).to eq({ 'error' => { 'password' => ["can't be blank"] } })
    end

    it 'returns error when username is too short' do
      post '/api/v1/signup', params: {
        user: {
          username: 'zeil',
          password: 'password',
          password_confirmation: 'password'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({ 'error' => { 'username' => ['is too short (minimum is 6 characters)'] } })
    end

    it 'returns error when username is too long' do
      post '/api/v1/signup', params: {
        user: {
          username: 'a' * 50,
          password: 'password',
          password_confirmation: 'password'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({ 'error' => { 'username' => ['is too long (maximum is 30 characters)'] } })
    end

    it 'returns error when password is too short' do
      post '/api/v1/signup', params: {
        user: {
          username: 'zeilotech',
          password: 'pass',
          password_confirmation: 'pass'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({ 'error' => { 'password' => ['is too short (minimum is 6 characters)'] } })
    end

    it "returns error when password and password_confirmation don't match" do
      post '/api/v1/signup', params: {
        user: {
          username: 'zeilotech',
          password: 'password',
          password_confirmation: 'wrongpassword'
        }
      }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response_body).to eq({ 'error' => { 'password_confirmation' => ["doesn't match Password"] } })
    end
  end
end
