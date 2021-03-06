json.user do
  json.extract! @user, :id, :thanks_id, :name, :profile
  json.avatar_url @user.avatar_url
  json.is_following @current_user.is_following?(@user)
end
json.auth_token @auth_token.token
