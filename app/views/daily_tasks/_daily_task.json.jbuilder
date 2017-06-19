json.extract! daily_task, :id, :name, :duration, :date, :user_id, :created_at, :updated_at
json.url daily_task_url(daily_task, format: :json)
