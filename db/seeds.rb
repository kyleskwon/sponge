5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8, 10)
  )
end
users = User.all

5.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    private: false,
    user_id: 6
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
