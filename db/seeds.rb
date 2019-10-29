# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_ids = []

for i in 1..10
    user = User.create(
        name: "user#{i}"
        email: "test#{i}@test.com",
        password: "password#{i}"
        description: "I like plants"
    )
    p "Created #{i} users!"

    user_ids.push(user.id)

end


for i in 1..10
    Plant.create(
        name: "Plant#{i}",
        price: rand(500..1000)
        description: "Plant#{i} is healthy",
        created_at: Time.now,
        postage: "Local Pickup"
        user_id: user_ids.sample,
    )

    p "Created #{i} plants!"
end
