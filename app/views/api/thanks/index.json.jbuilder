json.thanks do
  json.array! @thanks do |thank|
    json.extract! thank, :id, :to_whom, :to_what
    json.posted_at time_ago_in_words(thank.created_at)
    json.user do
      json.extract! thank.user, :id, :thanks_id, :name, :profile
      json.avatar_url thank.user.avatar_url
      json.is_following @current_user.is_following?(thank.user)
    end
  end
end
