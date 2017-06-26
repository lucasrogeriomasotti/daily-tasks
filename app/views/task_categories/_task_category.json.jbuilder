json.extract! task_category, :id, :name, :reference_url, :user_id, :created_at, :updated_at
json.url task_category_url(task_category, format: :json)
