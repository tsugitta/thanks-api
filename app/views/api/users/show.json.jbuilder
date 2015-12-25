json.user do
  json.extract! @user, :id, :thanks_id, :name, :profile
  json.avatar_url @user.avatar_url
  json.following @current_user.is_following?(user)
end
json.thanks do
  json.array! @user.thanks do |thank|
    json.extract! thank, :id, :to_whom, :to_what
    json.posted_at time_ago_in_words(thank.created_at)
  end
end
