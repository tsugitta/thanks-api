class Api::UserSessionsController < ApiController
  skip_before_action :require_valid_token, only: [:create, :create_with_token]

  def create
    if @user = login(user_session_params)
      @auth_token = @user.auth_tokens.create
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def create_with_token
    auth_token = AuthToken.find_by(token: request.headers[:AuthToken])
    @user = auth_token.user
  end

  def destroy
    logout
  end

  private

  def user_session_params
    params.permit(:thanks_id, :password)
  end
end
