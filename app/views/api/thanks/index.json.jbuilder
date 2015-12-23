json.array! @thanks do |thank|
  json.extract! thank, :id, :to_whom, :to_what
  json.user do
    json.extract! thank.user, :id, :thanks_id, :name
  end
end
