json.extract! receipe_info, :id, :title, :body, :posted_at, :created_at, :updated_at
json.url receipe_info_url(receipe_info, format: :json)
