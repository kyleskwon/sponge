10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8, 10)
  )
end
users = User.all

10.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
