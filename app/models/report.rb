class Report < ApplicationRecord
	validates 	:reporter_id, :reported_id, numericality: {less_than_or_equal_to: Survivor.last.id },presence: true
	before_validation :check_reporter_and_reported
	before_save :survivor_reports
	after_save :update_survivors_name
	
	def survivor_reports
		survivor_id = Survivor.find(reported_id)
		reports_count = Report.where(reported_id: survivor_id).size
		if reports_count >= 2
			survivor_id.update(abducted: true)
		end
	end

	def update_survivors_name
		reported_name = Survivor.find(reported_id).name
		self.update_column(:reported_name, reported_name)
	end

	def check_reporter_and_reported
		errors.add(:reporter_id, "can't be the same as Reported ID") if reporter_id === reported_id
	end

	def self.to_csv()
		CSV.generate() do |csv|
			csv << column_names
			all.each do |report|
				csv << report.attributes.values_at(*column_names)
			end
			end
		end   
end


