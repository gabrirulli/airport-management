class Api::RegistrationController < ApiController
  skip_before_action :authenticate_via_token
  
  def create
    user = User.new(user_params)
    if user.save
      # Authenticate user after creation
      sign_in(user) do |status|
        if status.success?
          render json: user, serializer: UserSerializer, status: :ok
        else
          render json: { errors: 'Authentication failed, try call "/login" endpoint' }, status: 401
        end
      end
    else
      render json: { errors: user.errors }, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end