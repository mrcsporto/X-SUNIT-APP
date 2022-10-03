# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Survivor.delete_all
100.times do 
    survivor_name = Faker::Name.name
    survivor_age = Faker::Number.between(from: 1, to: 95)
    survivor_gender = Faker::Gender.binary_type
    survivor_latitude = Faker::Number.number(digits: 10)
    survivor_longitude = Faker::Number.number(digits: 10)
    survivor = "#{survivor_name} - #{survivor_age} - #{survivor_gender} - #{survivor_latitude} - #{survivor_latitude}"
    puts survivor
    Survivor.create(name: survivor_name, age: survivor_age, gender: survivor_gender, latitude: survivor_latitude, longitude:survivor_longitude)
end

Report.delete_all
200.times do 
    report = Report.create(reporter: Survivor.all.sample, reported: Survivor.all.sample )
    puts "#{report.id} - #{report.reporter.name} - #{report.reported.name}"
end
