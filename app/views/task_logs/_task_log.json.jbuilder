json.extract! task_log, :id, :name, :duration, :date, :user_id, :created_at, :updated_at
json.url task_log_url(task_log, format: :json)
