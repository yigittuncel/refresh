require "open-uri"

Order.destroy_all
puts "Previous orders deleted..."

Item.destroy_all
puts "Previous items deleted..."

Outfit.destroy_all
puts "Previous outfits deleted..."

User.destroy_all
puts "Previous users deleted..."

# Here starts the first user

christina_photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641542998/upgrit4bif7ab8enrywz.jpg")

christina = User.new(
  email: "christina@christina.com",
  password: "christina@christina.com",
  nickname: "christina"
)

christina.photo.attach(io: christina_photo, filename: christina.email, content_type: 'image/png')
christina.save!
puts "User christina has been created"

christina_items = Array.new(2)
christina_item_photos = [
  "https://cdn.aboutstatic.com/file/images/e0cefda9fe4e175e33d95daddd3c434f.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/453929312adda01d01b5666ff8dfe430.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600"
]
christina_item_names = ["T-shirt", "Shorts"]
christina_item_descriptions = [
  "H&M Essentials. No. 7: The T-shirt. Regular-fit T-shirts in soft cotton jersey with a round, rib-trimmed neckline and a straight hem",
  "Shorts in a cotton weave with covered elastication and a drawstring at the waist, a fake fly, diagonal side pockets and an open back pocket."
]

christina_item_brands = ["H&M", "Zara"]
christina_item_sizes = ["XS", "S"]
christina_item_colors = ["brown", "light grey"]

christina_items.each_with_index do |i, index|
  item = Item.new(
    name: christina_item_names[index],
    description: christina_item_descriptions[index],
    brand: christina_item_brands[index],
    size: christina_item_sizes[index],
    color: christina_item_colors[index],
  )

  christina_item_photo = URI.open(christina_item_photos[index])
  item.photo.attach(io: christina_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "christina"
  item.save!
  puts "Item #{item.name} created!"
end

christina_outfits = Array.new(2)
christina_outfit_descriptions = [
  "Here I am wearing my favourite T-Shirt.",
  "This is a very nice hat, which I bought in Barcelona."
]
christina_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600"
]

christina_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: christina_outfit_descriptions[index]
  )
  outfit_photo = URI.open(christina_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "christina"
  outfit.save!
  puts "Outfit created"
end

christina_outfits = Outfit.where("user_id = ?", User.last.id)
christina_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: christina_outfits.first,
  item: christina_items.first
)

ItemOutfit.create!(
  outfit: christina_outfits.first,
  item: christina_items.second
)

ItemOutfit.create!(
  outfit: christina_outfits.second,
  item: christina_items.first
)
puts "Outfit with tagged items created"

# Here starts the second user

christina_photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641542998/upgrit4bif7ab8enrywz.jpg")

christina = User.new(
  email: "christina@christina.com",
  password: "christina@christina.com",
  nickname: "christina"
)

christina.photo.attach(io: christina_photo, filename: christina.email, content_type: 'image/png')
christina.save!
puts "User christina has been created"

christina_items = Array.new(2)
christina_item_photos = [
  "https://cdn.aboutstatic.com/file/images/e0cefda9fe4e175e33d95daddd3c434f.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/453929312adda01d01b5666ff8dfe430.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600"
]
christina_item_names = ["T-shirt", "Shorts"]
christina_item_descriptions = [
  "H&M Essentials. No. 7: The T-shirt. Regular-fit T-shirts in soft cotton jersey with a round, rib-trimmed neckline and a straight hem",
  "Shorts in a cotton weave with covered elastication and a drawstring at the waist, a fake fly, diagonal side pockets and an open back pocket."
]

christina_item_brands = ["H&M", "Zara"]
christina_item_sizes = ["XS", "S"]
christina_item_colors = ["brown", "light grey"]

christina_items.each_with_index do |i, index|
  item = Item.new(
    name: christina_item_names[index],
    description: christina_item_descriptions[index],
    brand: christina_item_brands[index],
    size: christina_item_sizes[index],
    color: christina_item_colors[index],
  )

  christina_item_photo = URI.open(christina_item_photos[index])
  item.photo.attach(io: christina_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "christina"
  item.save!
  puts "Item #{item.name} created!"
end

christina_outfits = Array.new(2)
christina_outfit_descriptions = [
  "Here I am wearing my favourite T-Shirt.",
  "This is a very nice hat, which I bought in Barcelona."
]
christina_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600"
]

christina_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: christina_outfit_descriptions[index]
  )
  outfit_photo = URI.open(christina_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "christina"
  outfit.save!
  puts "Outfit created"
end

christina_outfits = Outfit.where("user_id = ?", User.last.id)
christina_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: christina_outfits.first,
  item: christina_items.first
)

ItemOutfit.create!(
  outfit: christina_outfits.first,
  item: christina_items.second
)

ItemOutfit.create!(
  outfit: christina_outfits.second,
  item: christina_items.first
)
puts "Outfit with tagged items created"
