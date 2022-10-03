class Survivor < ApplicationRecord
    validates :name, :age, :gender, :latitude, :longitude, presence: true
    validates :age, numericality: {greater_than: 0 }
    validates :latitude, :longitude, numericality: true
    validates :name, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
    
    def self.to_csv()
    CSV.generate() do |csv|
        csv << column_names
        all.each do |survivor|
          csv << survivor.attributes.values_at(*column_names)
        end
      end
    end   
end
