namespace :utils do
  desc "Populate the survivors table with survivor's quantity (specify quantity w/ QTD=n)"
  task setup_survivors: :environment do
    # Rake::Task["db:reset"].invoke
    # if Rails.env.development?
    # Survivor.delete_all
    ENV['QTD'].to_i.times do |i|
        survivor_name = Faker::Name.name
        survivor_age = Faker::Number.between(from: 1, to: 95)
        survivor_gender = Faker::Gender.binary_type
        survivor_latitude = Faker::Number.number(digits: 10)
        survivor_longitude = Faker::Number.number(digits: 10)
        survivor = "#{survivor_name} - #{survivor_age} - #{survivor_gender} - #{survivor_latitude} - #{survivor_latitude}"
        puts survivor
        Survivor.create(name: survivor_name, age: survivor_age, gender: survivor_gender, latitude: survivor_latitude, longitude:survivor_longitude)
    end
    # else
    #   puts "This rake task is only available in development environment"
    # end
  end

  desc "Populate the import database with the number of abductions reported (specify quantity w/ QTD=n)"
  task setup_reports: :environment do
    # if Rails.env.development?
    # Report.delete_all
    ENV['QTD'].to_i.times do |r|
        report = Report.create(reporter: Survivor.all.sample, reported: Survivor.all.sample )
        puts "#{report.id} - #{report.reporter.name} - #{report.reported.name}"
    end
    # else
    #   puts "This rake task is only available in development environment"
    # end
  end
end
