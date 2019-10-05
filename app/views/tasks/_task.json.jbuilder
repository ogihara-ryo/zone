json.extract! task, :title, :finished, :create_at, :update_at
json.url task_url(task, format: :json)
