json.extract! issue, :id, :uu_id, :description, :reporter_email, :created_at, :updated_at
json.url issue_url(issue, format: :json)
