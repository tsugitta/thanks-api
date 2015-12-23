class ApiController < ApplicationController
  before_action :set_current_user
  skip_before_action :verify_authenticity_token

  # before_action :require_valid_token
  # before_action :set_user

  private

  def set_current_user
    auth_token = AuthToken.find_by(token: request.headers[:AuthToken])
    @current_user = auth_token.user
  end

  # def require_valid_token
  #   token = request.headers[:AuthToken]
  #
  #   if token.valid
  # end
end
