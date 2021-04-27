require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /login' do
    let(:user) { FactoryBot.create(:user, username: 'zeilotech', password: 'password') }
    it 'signs in a client' do
      post '/api/v1/login', params: { username: user.username, password: 'password' }
      expect(response).to have_http_status(:created)
      expected_token = AuthenticationTokenService.encode(user.id)
      expect(response_body).to eq({ 'token' => expected_token.to_s })
    end

    it 'returns error when username is missing' do
      post '/api/v1/login', params: { password: 'password' }
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response_body).to eq({ 'error' => 'param is missing or the value is empty: username' })
    end

    it 'returns error when password is missing' do
      post '/api/v1/login', params: { username: 'User1' }
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response_body).to eq({ 'error' => 'param is missing or the value is empty: password' })
    end

    it 'returns error when the password is incorrect' do
      post '/api/v1/login', params: { username: user.username, password: 'incorrect' }

      expect(response).to have_http_status(:unauthorized)
    end
  end

  # describe 'POST /logout' do

  # end
end
