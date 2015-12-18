class Api::UsersController < ApiController
  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @auth_token = @user.auth_tokens.last
    else      
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(update_params)
      render json: @user
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).
      permit(:thanks_id, :name, :password, :password_confirmation, :avatar)
  end
end
