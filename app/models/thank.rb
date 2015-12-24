class Thank < ActiveRecord::Base
  belongs_to :user

  scope :timeline_for, -> (user) { includes(:user).where(users: { id: user.timeline_user_ids }) }

  default_scope -> { order(created_at: :desc) }
end
