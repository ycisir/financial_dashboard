# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user = User.create!(
  name: "Jack Sparrow",
  email: "jack@example.com",
  role: :admin,
  status: :active
)

record_types = FinancialRecord.record_types.keys
categories = ["Food", "Transport", "Rent", "Entertainment", "Salary", "Investment"]

50.times do
  FinancialRecord.create!(
    user: user,
    amount: rand(50.0..5000.0).round(2),
    record_type: record_types.sample,
    category: categories.sample,
    date: Faker::Date.between(from: 2.years.ago, to: Date.today),
    notes: Faker::Lorem.sentence(word_count: 8)
  )
end

puts "Seeded 50 financial records"