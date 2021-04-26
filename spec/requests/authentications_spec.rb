require 'rails_helper'

RSpec.describe 'Authentications', type: :request do
  describe 'POST /authenticate' do
    let(:user) { FactoryBot.create(:user, username: 'User1', password: 'password') }
    it 'authenticates the client' do
      post '/api/v1/authenticate', params: { username: user.username, password: 'password' }
      expect(response).to have_http_status(:created)
      expected_token = AuthenticationTokenService.call(user.id)
      expect(response_body).to eq({ 'token' => "#{expected_token}" })
    end

    it 'returns error when username is missing' do
      post '/api/v1/authenticate', params: { password: 'password' }
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response_body).to eq({ 'error' => 'param is missing or the value is empty: username' })
    end

    it 'returns error when password is missing' do
      post '/api/v1/authenticate', params: { username: 'User1' }
      expect(response).to have_http_status(:unprocessable_entity)

      expect(response_body).to eq({ 'error' => 'param is missing or the value is empty: password' })
    end

    it 'returns error when the password is incorrect' do      
      post '/api/v1/authenticate', params: { username: user.username, password: 'incorrect' }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
