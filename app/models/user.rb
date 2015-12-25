class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :auth_tokens, dependent: :delete_all
  has_many :thanks, dependent: :delete_all
  has_many :followee_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :delete_all
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: :followee_id, dependent: :delete_all
  has_many :followees, through: :followee_relationships
  has_many :followers, through: :follower_relationships

  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :thanks_id, uniqueness: true
  validates :thanks_id,
            :name,
            presence: true

  after_create :create_token

  mount_uploader :avatar, AvatarUploader

  scope :name_like, -> (keyword) { where('name LIKE ? OR thanks_id LIKE ?', "%#{keyword.downcase}%", "%#{keyword.downcase}%") }
  scope :except_ids, -> (ids) { where.not(id: ids) }

  def self.search_by(user, keyword)
    User.except_ids([user.id]).name_like(keyword)
  end

  def timeline_user_ids
    followee_user_ids + [id]
  end

  def followee_user_ids
    followees.pluck(:id)
  end

  def is_following?(user)
    followees.include?(user)
  end

  def is_followed_by?(user)
    user.followees.include?(self)
  end

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
