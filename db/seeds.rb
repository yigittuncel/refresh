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
    color: christina_item_colors[index]
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

lena_photo = URI.open("https://image.gala.de/22297492/t/jg/v5/w1440/r1/-/lena-gercke.jpg")

lena = User.new(
  email: "lena@lena.com",
  password: "lena@lena.com",
  nickname: "Lena Gercke"
)

lena.photo.attach(io: lena_photo, filename: lena.email, content_type: 'image/png')
lena.save!
puts "User Lena Gercke has been created"

lena_items = Array.new(3)
lena_item_photos = [
  "https://cdn.aboutstatic.com/file/images/e0cefda9fe4e175e33d95daddd3c434f.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/453929312adda01d01b5666ff8dfe430.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/9b372fa94cffe3aafda0001103128a0b.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600"
]
lena_item_names = ["pullover", "pants 'Raven'", "ankle boots"]
lena_item_descriptions = [
  "A very stylish long-sleeved rib knit pullover. The colour looks really fresh and nice.",
  "This stylish black trousers are plain coloured and made out of faux leather. They are bootcut and high waist.",
  "These leather boots have platform heels and are in colour-blocking style with the colours black and white. The leather is very smooth and you have a side-zip. The heel is medium high, about 5 cm. "
]

lena_item_brands = ["LeGer", "LeGer", "LeGer"]
lena_item_sizes = ["S", "S", "38"]
lena_item_colors = ["pink", "black", "black and white"]

lena_items.each_with_index do |i, index|
  item = Item.new(
    name: lena_item_names[index],
    description: lena_item_descriptions[index],
    brand: lena_item_brands[index],
    size: lena_item_sizes[index],
    color: lena_item_colors[index]
  )

  lena_item_photo = URI.open(lena_item_photos[index])
  item.photo.attach(io: lena_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Lena Gercke"
  item.save!
  puts "Item #{item.name} created!"
end

lena_outfits = Array.new(1)
lena_outfit_descriptions = [
  "I love this outfit, because I think the combination of the fresh pink sweater with the dark leather trouser makes it look both elegant and easy-going."
]
lena_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/32f7e4ac378cca2f2f87eebfe0fd101d.jpg?quality=75&height=1280&width=960"
]

lena_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: lena_outfit_descriptions[index]
  )
  outfit_photo = URI.open(lena_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Lena Gercke"
  outfit.save!
  puts "Outfit created"
end

lena_outfits = Outfit.where("user_id = ?", User.last.id)
lena_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: lena_outfits.first,
  item: lena_items.first
)

ItemOutfit.create!(
  outfit: lena_outfits.first,
  item: lena_items.second
)

puts "Outfit with tagged items created"

# Here starts the third user

louis_photo = URI.open("https://i.pinimg.com/originals/4f/b4/9e/4fb49eed329eff40ed0bbb7626f89f7a.jpg")

louis = User.new(
  email: "louis@louis.com",
  password: "louis@louis.com",
  nickname: "Louis Darcis"
)

louis.photo.attach(io: louis_photo, filename: louis.email, content_type: 'image/png')
louis.save!
puts "User Louis Darcis has been created"

louis_items = Array.new(2)
louis_item_photos = [
  "https://cdn.aboutstatic.com/file/images/61be01e5d77afffa4892cb1c8890a734.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/72979f78b5ac87a69a3aa63d7fae372b.png?bg=F4F4F5&quality=75&trim=1&height=534&width=400"
]
louis_item_names = ["sweatshirt", "pants"]
louis_item_descriptions = [
  "Plain coloured hoodie, longsleeve and loose fit. Made out of cotton from organic farming. ",
  "This beige trousers are made out of cotton (from organic farming) and have a regular fit. You will look great in it.",
]

louis_item_brands = ["About You", "About You"]
louis_item_sizes = ["M", "M"]
louis_item_colors = ["white", "beige"]

louis_items.each_with_index do |i, index|
  item = Item.new(
    name: louis_item_names[index],
    description: louis_item_descriptions[index],
    brand: louis_item_brands[index],
    size: louis_item_sizes[index],
    color: louis_item_colors[index]
  )

  louis_item_photo = URI.open(louis_item_photos[index])
  item.photo.attach(io: louis_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Louis Darcis"
  item.save!
  puts "Item #{item.name} created!"
end

louis_outfits = Array.new(1)
louis_outfit_descriptions = [
  "Perfect outfit for the first spring days. The colours look really fresh and the hoodie keeps you warm in terms of spring days are not as warm as you expect."
]
louis_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/544ae25ce951c7b0c8df513108d83503.jpg?quality=75&height=534&width=400"
]

louis_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: louis_outfit_descriptions[index]
  )
  outfit_photo = URI.open(louis_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Louis Darcis"
  outfit.save!
  puts "Outfit created"
end

louis_outfits = Outfit.where("user_id = ?", User.last.id)
louis_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: louis_outfits.first,
  item: louis_items.first
)

ItemOutfit.create!(
  outfit: louis_outfits.first,
  item: louis_items.second
)

puts "Outfit with tagged items created"

# Here starts the fourth user

riccardo_photo = URI.open("https://www.wuv.de/var/wuv/storage/images/werben_verkaufen/marketing/ich_wollte_mich_nie_nur_auf_das_medium_blog_reduzieren_lassen/9623953-5-ger-DE/ich_wollte_mich_nie_nur_auf_das_medium_blog_reduzieren_lassen7_gross.jpg")

riccardo = User.new(
  email: "riccardo@riccardo.com",
  password: "riccardo@riccardo.com",
  nickname: "Riccardo Simonetti"
)

riccardo.photo.attach(io: riccardo_photo, filename: riccardo.email, content_type: 'image/png')
riccardo.save!
puts "User Riccardo Simonetti has been created"

riccardo_items = Array.new(2)
riccardo_item_photos = [
  "https://cdn.aboutstatic.com/file/c21f17a1d4edfb1c6d45fb98bbef6319?bg=F4F4F5&quality=75&trim=1&height=534&width=400",
  "https://cdn.aboutstatic.com/file/images/72979f78b5ac87a69a3aa63d7fae372b.png?bg=F4F4F5&quality=75&trim=1&height=534&width=400"
]
riccardo_item_names = ["Between-Season Jacket 'Vincent'"]
riccardo_item_descriptions = [
  "This blue denim jacket has a very special design with a motif-print and different applications. It is made out of 100% cotton and has a regular fit. "
]

riccardo_item_brands = ["About You"]
riccardo_item_sizes = ["M"]
riccardo_item_colors = ["denim"]

riccardo_items.each_with_index do |i, index|
  item = Item.new(
    name: riccardo_item_names[index],
    description: riccardo_item_descriptions[index],
    brand: riccardo_item_brands[index],
    size: riccardo_item_sizes[index],
    color: riccardo_item_colors[index]
  )

  riccardo_item_photo = URI.open(riccardo_item_photos[index])
  item.photo.attach(io: riccardo_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Riccardo Simonetti"
  item.save!
  puts "Item #{item.name} created!"
end

riccardo_outfits = Array.new(1)
riccardo_outfit_descriptions = [
  "I love this outfit, especially the jacket, which makes every look special and fun."
]
riccardo_outfit_photos = [
  "https://cdn.aboutstatic.com/file/4f4917a1f428eef48aca3c529e43776b?quality=75&height=534&width=400"
]

riccardo_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: riccardo_outfit_descriptions[index]
  )
  outfit_photo = URI.open(riccardo_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Riccardo Simonetti"
  outfit.save!
  puts "Outfit created"
end

riccardo_outfits = Outfit.where("user_id = ?", User.last.id)
riccardo_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: riccardo_outfits.first,
  item: riccardo_items.first
)

puts "Outfit with tagged items created"
