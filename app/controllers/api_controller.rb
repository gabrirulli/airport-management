class ApiController < ApplicationController
  before_action :authenticate_via_token
  
  def authenticate_via_token
    unless api_token
      render json: { errors: 'Authentication failed, try call "/login" endpoint' }, status: 401
    end
    user = User.find_by_remember_token(api_token)
    sign_in user if user
    cookies.delete(:remember_token) # so non-browser clients don't act like browsers and persist sessions in cookies
  end

  private

  def api_token
    pattern = /^Bearer /
    header  = request.env["HTTP_AUTHORIZATION"]
    header.gsub(pattern, '') if header && header.match(pattern)
  end
end