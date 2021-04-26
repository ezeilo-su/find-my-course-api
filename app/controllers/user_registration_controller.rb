class UserRegistrationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def create
    user = User.new(user_params)
    if user.save
      # render json: UserSerializer.new(user).serialized_json, status: :created
        token = AuthenticationTokenService.call(user.id)
        render json: {
          token: token
        }, status: :created
    else
      render json: { message: user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
  
  def parameter_missing(err)
    render json: { error: err.message }, status: :unprocessable_entity
  end
end
