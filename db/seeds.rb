require "open-uri"

Order.destroy_all
puts "Previous orders deleted..."

Item.destroy_all
puts "Previous items deleted..."

Outfit.destroy_all
puts "Previous outfits deleted..."

User.destroy_all
puts "Previous users deleted..."

users = Array.new(3)

user_photos = [
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641542998/upgrit4bif7ab8enrywz.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1643622347/ekjbgb0bi3ac6zg3nn1t.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641491612/phy5oue4p0ftrjl3nnu7.jpg"
]
nicknames = ["Christina", "Mario", "Yigit"]
user_email = ["christina@borensky.com", "mario@rodriguez-gonzalez.com", "yigit@tuncel.com"]
user_password = ["secret", "secret", "secret"]

users.each_with_index do |u, index|
  user = User.new(
    nickname: nicknames[index],
    email: user_email[index],
    password: user_password[index]
  )

  user_photo = URI.open(user_photos[index])
  user.photo.attach(io: user_photo, filename: user.email, content_type: 'image/png')
  user.save!
  puts "User #{user.nickname} created!"
end

item_photos = [
  "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80",
  "https://images.unsplash.com/photo-1591195853828-11db59a44f6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=997&q=80",
  "https://images.unsplash.com/photo-1582966772680-860e372bb558?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=654&q=80",
  "https://images.unsplash.com/photo-1556821840-3a63f95609a7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
]

item_names = ["T-shirt", "Short", "Shoe", "Trouser", "Sock", "Hoodie"]
item_descriptions = [
  "H&M Essentials. No. 7: The T-shirt. Regular-fit T-shirts in soft cotton jersey with a round, rib-trimmed neckline and a straight hem",
  "Shorts in a cotton weave with covered elastication and a drawstring at the waist, a fake fly, diagonal side pockets and an open back pocket.",
  "Derby shoes with open lacing at the front. Canvas linings and insoles. Heel 2.5 cm.",
  "Crease-leg trousers in woven fabric with a concealed hook-and-eye fastening and button on the waistband and a zip fly.",
  "Socks in a soft, fine-knit cotton blend with elasticated tops.",
  "The Hoodie. Hoodie in sweatshirt fabric made from a cotton blend."
]
item_brands = ["H&M", "Zara", "Bershka", "Nike", "Gucci", "	Levi’s"]
item_sizes = ["XS", "S", "M", "L", "XL", "XXL"]
item_colors = ["brown", "light grey", "mint blue", "yellow", "blue", "pink"]

items = Array.new(6)

items.each_with_index do |i, index|
  item = Item.new(
    name: item_names[index],
    description: item_descriptions[index],
    brand: item_brands[index],
    size: item_sizes[index],
    color: item_colors[index],
  )

  item_photo = URI.open(item_photos[index])
  item.photo.attach(io: item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.first
  item.save!
  puts "Item #{item.name} created!"
end


outfit_photos = [
  "https://images.unsplash.com/photo-1617019114583-affb34d1b3cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
  "https://images.unsplash.com/photo-1578632292335-df3abbb0d586?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3087&q=80"
]

outfit_descriptions = [
  "nice outfit",
  "do you like my outfit?"
]

outfits = Array.new(2)

outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: outfit_descriptions[index]
  )

  outfit_photo = URI.open(outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.first
  outfit.save!
  puts "Outfit #{outfit.description} created!"
end

outfit1 = Outfit.all[0]
outfit2 = Outfit.all[1]

ItemOutfit.create!(
  outfit: outfit1,
  item: Item.all[0]
)

ItemOutfit.create!(
  outfit: outfit1,
  item: Item.all[1]
)

ItemOutfit.create!(
  outfit: outfit1,
  item: Item.all[2]
)

ItemOutfit.create!(
  outfit: outfit2,
  item: Item.all[3]
)

ItemOutfit.create!(
  outfit: outfit2,
  item: Item.all[4]
)

ItemOutfit.create!(
  outfit: outfit2,
  item: Item.all[5]
)
