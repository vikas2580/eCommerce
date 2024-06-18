class ApplicationController < ActionController::API
   def authenticate_admin!
    token = request.headers['Authorization'].split(' ').last
    decoded_token = JsonWebToken.decode(token)
    @current_user = User.find(decoded_token[:user_id])
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user&.admin?
  end
end
