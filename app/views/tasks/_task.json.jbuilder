json.extract! task, :id, :title, :finished, :created_at, :updated_at
json.url task_url(task, format: :json)
