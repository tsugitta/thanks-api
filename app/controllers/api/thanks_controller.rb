class Api::ThanksController < ApiController
  before_action :set_user, only: [:create, :destroy]
  before_action :set_thank, only: :destroy

  def index
    @thanks = Thank.includes(:user)
  end

  def create
    @current_user.thanks.create(thank_params)
    @thanks = Thank.includes(:user)
  end

  def destroy
    @thank.destroy
  end

  private

  def set_user
    auth_token = AuthToken.find_by(token: request.headers[:AuthToken])
    @current_user = auth_token.user
  end

  def set_thank
    @thank = Thank.find(params[:id])
  end

  def thank_params
    params.permit(:to_whom, :to_what)
  end
end
