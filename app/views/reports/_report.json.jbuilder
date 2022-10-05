json.extract! report, :id, :reporter, :reported, :created_at, :updated_at
json.url report_url(report, format: :json)
