json.user do
  json.extract! @user, :id, :thanks_id, :name, :profile
  json.avatar_url @user.avatar_url
end
json.thanks @user.thanks
