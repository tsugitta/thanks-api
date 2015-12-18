class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :auth_tokens, dependent: :delete_all

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }


  validates :thanks_id, uniqueness: true
  validates :thanks_id,
            :name,
            presence: true

  after_create :create_token

  def signed_in?
    auth_token = auth_tokens.last
    auth_token.expire_if_needed
    auth_token.active?
  end

  private

  def create_token
    auth_tokens.create
  end
end
