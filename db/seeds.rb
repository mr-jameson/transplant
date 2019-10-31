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
        name: Faker::Name.name,
        email: Faker::Internet.free_email,
        password: "Testing123",
        mobile: "0#{rand(408000000..499999999)}",
        description: Faker::Quote.matz,
        created_at: Time.now
    )
    p "Created #{i} users!"

    user_ids.push(user.id)

end

listings = [
    {name: "Philodendron Hope", species: "Philodendron Hope", pot: "Plastic planter", light: 2, size: 1, description: "Philodendron Hope are versatile indoor or shade plants with large, tropical looking foliage with leaves that look like Elephants ears. They can handle cold climates, but prefer their natural warm rainforest weather. Hope need bright, indirect sunlight to thrive indoors and keep their foliage looking full and lush."},
    {name: "Devils Ivy", species: "Epiprimnum aureum", pot: "Plastic planter", light: 1, size: 1, description: "The Epipremnum aureum is a species of flowering plant in the family of Araceae and is native to French Polynesia. This plant has a multitude of common names, Golden Pothos, Pothos or Devils Ivy. The Devils Ivy is an evergreen vine that can grow over 1mtr tall. The Devils Ivy can climb by means of aerial roots which adhere to surfaces."},
    {name: "Peace Lily", species: "Spathiphyllum chico", pot: "White ceramic", light: 0, size: 1, description: "Peace Lily is one of the most popular indoor plants, due to its beautiful lush dark green leaves and its crisp white, lily-like flower. They grow in quite low light, so there is almost no position in your house where one will not grow! The sweet chico is a compact form with dark leaves suitable for smaller pots. They also have quite a prolific flowering habit."},
    {name: "Spider Plant", species: "Chlorophytum comosum", pot: "Plastic planter", light: 1, size: 1, description: "The Spider plant is an easy to grow, tough plant that flourishes indoors and out. The perennial plant is grown for its rosettes of long, narrow, green variegated with cream leaves."},
    {name: "Zebra Plant", species: "Calathea zebrina", pot: "Plastic planter", light: 2, size: 1, description: "The Calathea is native to the Americas. The Calathea zebrina or sometimes called Zebra Calathea has striking leaves are the attraction for tropical gardeners and indoor plant lovers as well. Calathea zebrina has large, elongated leaves in a dark green colour, with regular bright green stripes coming from the vein."},
    {name: "Fiddle Leaf Fig", species: "Ficus lyrata", pot: "Plastic planter", light: 2, size: 2, description: "The Ficus from will provide year round style, harmony and inspiration to any home, office, patio or veranda."},
    {name: "Fruit Salad Plant", species: "Monstera deliciosa", pot: "Plastic planter", light: 0, size: 2, description: "Exotic Indoor plant with large waxy leaves which grows cream flowers. Prefers a filtered light position in the corner of a room or on your patio. Monsteras can grow large, up to 4 metres, If yours grows too large you can plant it under an eve or in a sheltered spot in your garden where it won't get full sun or frost"},
    {name: "Snow Queen Ivy", species: "Scindapsus aureum", pot: "Plastic planter", light: 1, size: 1, description: "Snow Queen is a popular, evergreen Ivy which uses aerial roots to cling to and climb up poles, lattice and trellis. They are very common in hanging baskets as their trailing, variegated foliage creates a great feature indoors or on a shaded pergola."}  
]

for listing in listings
    plant = Plant.create(
        name: listing[:name],
        price: rand(5..10)*100,
        description: listing[:description],
        created_at: Time.now,
        postage: "Local Pickup",
        species: listing[:species],
        pot: listing[:species],
        light: rand(0..2), #enum 0 low, 1 moderate, 2 bright
        size: rand(0..2), #enum 0 small, 1 medium, 2 large
        user_id: user_ids.sample
    )
    plant.image.attach(io: File.open("app/assets/images/#{plant.name}.jpg"), filename: "#{plant.name}.jpg", content_type: "image/jpg")
    plant.save!
    p "Created #{listing} plants!"
end

suburbs = ["Sydney", "Pyrmont", "Greenwich", "Rose Bay", "Newtown", "Alexandria", "Marrickvile", "Lane Cove", "North Sydney", "Manly"]

for i in 1..20
    Address.create(
        user_id: user_ids.sample,
        address: Faker::Address.street_address,
        suburb: suburbs.sample,
        state: "NSW",
        postcode: rand(2000..2999)
    )
    p "Created #{i} addresses"
end

