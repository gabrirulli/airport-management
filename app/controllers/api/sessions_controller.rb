class Api::SessionsController < Clearance::SessionsController
  def create
    user = authenticate(params)

    sign_in(user) do |status|
      if status.success?
        render json: user, serializer: UserSerializer, status: :ok
      else
        render json: { errors: 'Authentication failed, email or password are incorrect' }, status: 401
      end
    end
  end
end
