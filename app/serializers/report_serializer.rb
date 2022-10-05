class ReportSerializer < ActiveModel::Serializer
  attributes :id, :reporter, :reported, :created_at, :updated_at
end

