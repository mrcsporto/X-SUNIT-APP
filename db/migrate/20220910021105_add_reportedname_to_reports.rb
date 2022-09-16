class AddReportednameToReports < ActiveRecord::Migration[6.1]
  def change
    add_column :reports, :reported_name, :string
  end
end
