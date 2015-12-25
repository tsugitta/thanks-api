json.thanks do
  json.array! @thanks do |thank|
    json.extract! thank, :id, :to_whom, :to_what
    json.posted_at time_ago_in_words(thank.created_at)
    json.user do
      json.extract! thank.user, :id, :thanks_id, :name
      json.avatar_url thank.user.avatar_url
    end
  end
end
json.user_thanks do
  json.array! @current_user.thanks do |thank|
    json.extract! thank, :id, :to_whom, :to_what
    json.posted_at time_ago_in_words(thank.created_at)
  end
end
