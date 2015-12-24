class Api::UsersController < ApiController
  skip_before_action :require_valid_token, only: [:create]
  before_action :set_user, only: [:show, :update]
  before_action :set_current_user, only: [:search]

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
    unless @user.update(upload_params)
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def search
    @users = User.search_by(@current_user, params[:keyword])
  end

  def current_user
    auth_token = AuthToken.find_by(token: request.headers[:AuthToken])
    @user = auth_token.user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).
      permit(:thanks_id, :name, :password, :password_confirmation, :profile, :avatar)
  end

  # cannot nest params when using Alamofire's multipart form
  def upload_params
    params.permit(:thanks_id, :name, :profile, :avatar)
  end
end
