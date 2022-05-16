# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Deleting all users, events, and attendances...'
Attendance.destroy_all
Event.destroy_all
User.destroy_all
puts 'All users, events, and attendances deleted.'

10.times do |index|
    user = User.create(
        email: "thpalex#{index}@yopmail.com",
        encrypted_password: '123456',
        description: Faker::Lorem.paragraph,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
    )
end

puts '10 users created.'

10.times do
    event = Event.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        price: rand(1..1000),
        location: Faker::Address.city,
        start_date: Faker::Date.forward(days:30),
        duration: rand(1..100)*5,
        admin_id: User.all.sample.id
    )
end

puts '10 events created.'

20.times do
    attendance = Attendance.create(
        stripe_customer_id: Faker::Number.number(digits: 10),
        user_id: User.all.sample.id,
        event_id: Event.all.sample.id
    )
end

puts '50 attendances created.'

puts 'Finished!'
