class AuthToken < ActiveRecord::Base
  belongs_to :user

  after_create :generate_token, :set_expiration

  def active!
    update(active: true)
  end

  def inactive!
    update(active: false)
  end

  def expired?
    Date.today >= expires_at
  end

  def expire_if_needed
    inactive! if expired?
  end

  def set_expiration
    update(expires_at: Date.today + 365)
  end

  private

  def generate_token
    begin
      token = SecureRandom.hex
    end while AuthToken.exists?(token: token)
    update(token: token)
  end
end
