class Api::UserSessionsController < ApiController
  def create
    if @user = login(user_session_params)
      @auth_token = @user.auth_tokens.last
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    logout
  end

  private

  def user_session_params
    params.permit(:thanks_id, :password)
  end
end
