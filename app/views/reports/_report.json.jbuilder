json.extract! report, :id, :reporter_id, :reported_id, :created_at, :updated_at
json.url report_url(report, format: :json)
