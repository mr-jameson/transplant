# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create random users
user_ids = []
for i in 1..20
    user = User.create(
        name: Faker::Name.name
        email: "test#{i}@test.com",
        password: "Testing123"
        mobile: "0#{rand(408000000 - 499999999)}"
        description: "I like plants"
        created_at: Time.now
    )
    p "Created #{i} users!"

    user_ids.push(user.id)

end

listings = [
    {name: "Philodendron Hope", species: "Philodendron Hope", pot: "Plastic planter", light: 2, size: 1, description: "Philodendron Hope are versatile indoor or shade plants with large, tropical looking foliage with leaves that look like Elephants ears. They can handle cold climates, but prefer their natural warm rainforest weather. Hope need bright, indirect sunlight to thrive indoors and keep their foliage looking full and lush.", }
]

for i in 1..20
    Plant.create(
        name: listings[:title],
        price: rand(500..1000),
        description: listings[:description],
        created_at: Time.now,
        postage: "Local Pickup"
        species: listings[:species]
        pot: listings[:species]
        light: rand(0..2) #enum 0 low, 1 moderate, 2 bright
        size: rand(0..2) #enum 0 small, 1 medium, 2 large
        user_id: user_ids.sample,
    )
    p "Created #{i} plants!"
end

for i in 1..20
    Address.create(
        user_id: user_ids.sample
        address:
        suburb:
        state: "NSW"
        postcode:
    )
end

