json.extract! task, :title, :finished, :created_at, :updated_at
json.url task_url(task, format: :json)
