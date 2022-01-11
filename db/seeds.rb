5.times do
  Author.create!(first_name: Faker::Name.unique.first_name,
                last_name: Faker::Name.unique.last_name,
                gender: Faker::Gender.binary_type,
                birthday: Faker::Date.unique.birthday)
  puts '------'
end
