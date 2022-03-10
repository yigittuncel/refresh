require "open-uri"

Message.destroy_all
puts "Previous messages deleted..."

Chatroom.destroy_all
puts "Previous chatrooms deleted..."

Order.destroy_all
puts "Previous orders deleted..."

Item.destroy_all
puts "Previous items deleted..."

Outfit.destroy_all
puts "Previous outfits deleted..."

User.destroy_all
puts "Previous users deleted..."

# Here starts the first user

jaqueline_photo = URI.open("https://secure.gravatar.com/avatar/e1637014c2818e4cd87dc435fa3b0d41?s=500&d=mm&r=g")

jaqueline = User.new(
  email: "jaqueline@jaqueline.com",
  password: "jaqueline@jaqueline.com",
  nickname: "Jaqueline"
)

jaqueline.photo.attach(io: jaqueline_photo, filename: jaqueline.email, content_type: 'image/png')
jaqueline.save!
puts "User Jaqueline has been created"

jaqueline_items = Array.new(3)
jaqueline_item_photos = [
  "https://cdn.aboutstatic.com/file/images/4c7c5a5bc989cf99cfc2ccae9720aeb1.png?bg=F4F4F5&quality=75&trim=1&height=534&width=400",
  "https://cdn.aboutstatic.com/file/images/caccc327deaaddc470213e68390022b2.jpg?quality=75&height=534&width=400",
  "https://cdn.aboutstatic.com/file/images/cd71fa937261e93fd05c89b983582eb1.png?bg=F4F4F5&quality=75&trim=1&height=534&width=400"
]
jaqueline_item_names = ["Marlene trousers", "Crop Top 'Janey'", "Sneakers"]
jaqueline_item_descriptions = [
  "These marlene pants have 7/8 length and a loose fit with an elastic waistband. They are plain coloured and high waist.",
  "Sleeveless shirt wir a narrow fit. Plain coloured and made out of jersey.",
  "Plain coloured sneakers with platform and a treaded sole. They have a flat heel, the height is about 3 cm."
]

jaqueline_item_brands = ["H&M", "Zara", "Superga"]
jaqueline_item_sizes = ["XS", "S", "37"]
jaqueline_item_colors = ["coral", "beige", "white"]

jaqueline_items.each_with_index do |i, index|
  item = Item.new(
    name: jaqueline_item_names[index],
    description: jaqueline_item_descriptions[index],
    brand: jaqueline_item_brands[index],
    size: jaqueline_item_sizes[index],
    color: jaqueline_item_colors[index]
  )

  jaqueline_item_photo = URI.open(jaqueline_item_photos[index])
  item.photo.attach(io: jaqueline_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Jaqueline"
  item.save!
  puts "Item #{item.name} created!"
end

jaqueline_outfits = Array.new(1)
jaqueline_outfit_descriptions = [
  "Fresh outfit for nice summer days. I really love the colour of the pants in combination with the beige top and the white shoes."
]
jaqueline_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/f9ee553fb438c897c0268665d4bd6ec8.jpg?quality=75&height=800&width=600"
]

jaqueline_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: jaqueline_outfit_descriptions[index]
  )
  outfit_photo = URI.open(jaqueline_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Jaqueline"
  outfit.save!
  puts "Outfit created"
end

jaqueline_outfits = Outfit.where("user_id = ?", User.last.id)
jaqueline_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: jaqueline_outfits.first,
  item: jaqueline_items.first
)

ItemOutfit.create!(
  outfit: jaqueline_outfits.first,
  item: jaqueline_items.second
)

ItemOutfit.create!(
  outfit: jaqueline_outfits.first,
  item: jaqueline_items.third
)

puts "Outfit with tagged items created"

# Here starts user Vanessa

vanessa_photo = URI.open("https://lthumb.lisimg.com/271/24355271.jpg?width=280&sharpen=true")

vanessa = User.new(
  email: "vanessa@vanessa.com",
  password: "vanessa@vanessa.com",
  nickname: "Vanessa"
)

vanessa.photo.attach(io: vanessa_photo, filename: vanessa.email, content_type: 'image/png')
vanessa.save!
puts "User Vanessa has been created"

vanessa_items = Array.new(1)
vanessa_item_photos = [
  "https://cdn.aboutstatic.com/file/images/63f76b10faf2f5e6454474802db6b212.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600"
]

vanessa_item_names = ["Shirt 'Roman'"]
vanessa_item_descriptions = [
  "White oversize shirt, plain colored and out of jersey"
]

vanessa_item_brands = ["About You"]
vanessa_item_sizes = ["XS"]
vanessa_item_colors = ["white"]

vanessa_items.each_with_index do |i, index|
  item = Item.new(
    name: vanessa_item_names[index],
    description: vanessa_item_descriptions[index],
    brand: vanessa_item_brands[index],
    size: vanessa_item_sizes[index],
    color: vanessa_item_colors[index]
  )

  vanessa_item_photo = URI.open(vanessa_item_photos[index])
  item.photo.attach(io: vanessa_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Vanessa"
  item.save!
  puts "Item #{item.name} created!"
end

vanessa_outfits = Array.new(1)
vanessa_outfit_descriptions = [
  "Love oversize."
]
vanessa_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/e060a702fb296bcc1f8ef712caae753b.jpg?quality=75&height=800&width=600"
]

vanessa_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: vanessa_outfit_descriptions[index]
  )
  outfit_photo = URI.open(vanessa_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Vanessa"
  outfit.save!
  puts "Outfit created"
end

vanessa_outfits = Outfit.where("user_id = ?", User.last.id)
vanessa_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: vanessa_outfits.first,
  item: vanessa_items.first
)

puts "Outfit with tagged items created"

# Here ends user Vanessa


# Here starts user Tara

tara_photo = URI.open("https://live.staticflickr.com/4201/34145314604_e853bb9b2b_6k.jpg")

tara = User.new(
  email: "tara@tara.com",
  password: "tara@tara.com",
  nickname: "Tara"
)

tara.photo.attach(io: tara_photo, filename: tara.email, content_type: 'image/png')
tara.save!
puts "User Tara has been created"

tara_items = Array.new(1)
tara_item_photos = [
  "https://cdn.aboutstatic.com/file/images/710f3aa0ad5397278e2d4e4861086bc8.jpg?quality=75&height=534&width=400"
]

tara_item_names = ["Jeans 'Penelope'"]
tara_item_descriptions = [
  "Those jeans are loose fit, mid waist with maxi length. The attached pockets make them look special."
]

tara_item_brands = ["Guido Mario Kretschmer"]
tara_item_sizes = ["M"]
tara_item_colors = ["denim blue"]

tara_items.each_with_index do |i, index|
  item = Item.new(
    name: tara_item_names[index],
    description: tara_item_descriptions[index],
    brand: tara_item_brands[index],
    size: tara_item_sizes[index],
    color: tara_item_colors[index]
  )

  tara_item_photo = URI.open(tara_item_photos[index])
  item.photo.attach(io: tara_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Tara"
  item.save!
  puts "Item #{item.name} created!"
end

tara_outfits = Array.new(1)
tara_outfit_descriptions = [
  "Enjoying the first sunny days of spring."
]
tara_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/f6a10792f23437f5642cfea756948863.jpg?quality=75&height=534&width=400"
]

tara_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: tara_outfit_descriptions[index]
  )
  outfit_photo = URI.open(tara_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Tara"
  outfit.save!
  puts "Outfit created"
end

tara_outfits = Outfit.where("user_id = ?", User.last.id)
tara_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: tara_outfits.first,
  item: tara_items.first
)

puts "Outfit with tagged items created"

# Here ends user Tara

# Here starts user Louis

louis_photo = URI.open("https://i.pinimg.com/originals/4f/b4/9e/4fb49eed329eff40ed0bbb7626f89f7a.jpg")

louis = User.new(
  email: "louis@louis.com",
  password: "louis@louis.com",
  nickname: "Louis"
)

louis.photo.attach(io: louis_photo, filename: louis.email, content_type: 'image/png')
louis.save!
puts "User Louis has been created"

louis_items = Array.new(2)
louis_item_photos = [
  "https://cdn.aboutstatic.com/file/images/61be01e5d77afffa4892cb1c8890a734.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/72979f78b5ac87a69a3aa63d7fae372b.png?bg=F4F4F5&quality=75&trim=1&height=534&width=400"
]
louis_item_names = ["Sweatshirt", "Pants"]
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
  item.user = User.find_by nickname: "Louis"
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
  outfit.user = User.find_by nickname: "Louis"
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

# Here ends user Louis

# Here starts user Riccardo

riccardo_photo = URI.open("https://www.wuv.de/var/wuv/storage/images/werben_verkaufen/marketing/ich_wollte_mich_nie_nur_auf_das_medium_blog_reduzieren_lassen/9623953-5-ger-DE/ich_wollte_mich_nie_nur_auf_das_medium_blog_reduzieren_lassen7_gross.jpg")

riccardo = User.new(
  email: "riccardo@riccardo.com",
  password: "riccardo@riccardo.com",
  nickname: "Riccardo"
)

riccardo.photo.attach(io: riccardo_photo, filename: riccardo.email, content_type: 'image/png')
riccardo.save!
puts "User Riccardo has been created"

riccardo_items = Array.new(1)
riccardo_item_photos = [
  "https://cdn.aboutstatic.com/file/c21f17a1d4edfb1c6d45fb98bbef6319?bg=F4F4F5&quality=75&trim=1&height=534&width=400"
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
  item.user = User.find_by nickname: "Riccardo"
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
  outfit.user = User.find_by nickname: "Riccardo"
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

#Ends user Riccardo

# Here starts user Joel

joel_photo = URI.open("https://im.vsco.co/aws-us-west-2/34a33d/106701978/5cbf76c179a80d1e1fb24039/vsco5cbf76c4c34b3.jpg?w=412&dpr=2.625")

joel = User.new(
  email: "joel@joel.com",
  password: "joel@joel.com",
  nickname: "Joel"
)

joel.photo.attach(io: joel_photo, filename: joel.email, content_type: 'image/png')
joel.save!
puts "User Joel has been created"

joel_items = Array.new(1)
joel_item_photos = [
  "https://cdn.aboutstatic.com/file/images/8ae5fe6d68e8e8a936b81a01c3385522.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600"
]
joel_item_names = ["T-Shirt Trust Fear"]
joel_item_descriptions = [
  "Very cool shirt, 100% cotton. Normal length and normal fit. "
]

joel_item_brands = ["About You Unlimited"]
joel_item_sizes = ["M"]
joel_item_colors = ["black"]

joel_items.each_with_index do |i, index|
  item = Item.new(
    name: joel_item_names[index],
    description: joel_item_descriptions[index],
    brand: joel_item_brands[index],
    size: joel_item_sizes[index],
    color: joel_item_colors[index]
  )

  joel_item_photo = URI.open(joel_item_photos[index])
  item.photo.attach(io: joel_item_photo, filename: item.name, content_type: 'image/png')
  item.user = User.find_by nickname: "Joel"
  item.save!
  puts "Item #{item.name} created!"
end

joel_outfits = Array.new(1)
joel_outfit_descriptions = [
  "Stylish and cool - you can wear it for a lazy Sunday afternoon and also for going out in the evening to your favourite bar."
]
joel_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/029347f97db504f912bb90449cfc5486.jpg?quality=75&height=534&width=400"
]

joel_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: joel_outfit_descriptions[index]
  )
  outfit_photo = URI.open(joel_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Joel"
  outfit.save!
  puts "Outfit created"
end

joel_outfits = Outfit.where("user_id = ?", User.last.id)
joel_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: joel_outfits.first,
  item: joel_items.first
)

puts "Outfit with tagged items created"

# Here ends user Joel

# Here starts user Christina

christina_photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641542998/upgrit4bif7ab8enrywz.jpg")

christina = User.new(
  email: "christina@christina.com",
  password: "christina@christina.com",
  nickname: "Christina"
)

christina.photo.attach(io: christina_photo, filename: christina.email, content_type: 'image/png')
christina.save!
puts "User Christina has been created"

christina_items = Array.new(1)
christina_item_photos = [
  "https://www.brille-kaulard.de/media/image/78264.jpg"

]
christina_item_names = ["Ray Ban sunglasses"]
christina_item_descriptions = [
  "Ray Ban Wayfarer"
]

christina_item_brands = ["Ray Ban"]
christina_item_sizes = ["none"]
christina_item_colors = ["black"]

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
  item.user = User.find_by nickname: "Christina"
  item.save!
  puts "Item #{item.name} created!"
end

christina_outfits = Array.new(2)
christina_outfit_descriptions = [
  "Having a cocktail at Rodeo Drive in Miami Beach ✨",
  "Nice summer day on the beach."
]
christina_outfit_photos = [
  "https://res.cloudinary.com/mariorzgz/image/upload/v1646907577/21ee1047-1064-458c-9872-c4ca954f6471_ft0sue.jpg",
  "https://res.cloudinary.com/mariorzgz/image/upload/v1646907596/IMG_1187_q92wom.jpg"
]

christina_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: christina_outfit_descriptions[index]
  )
  outfit_photo = URI.open(christina_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Christina"
  outfit.save!
  puts "Outfit created"
end

christina_outfits = Outfit.where("user_id = ?", User.last.id)
christina_items = Item.where("user_id = ?", User.last.id)

ItemOutfit.create!(
  outfit: christina_outfits.first,
  item: christina_items.first
)

# Here ends user Christina

# Here starts user Yigit

yigit_photo = URI.open("https://res.cloudinary.com/mariorzgz/image/upload/v1646905514/yigit_avatar.jpg")

yigit = User.new(
  email: "yigit@yigit.com",
  password: "yigit@yigit.com",
  nickname: "Yigit"
)

yigit.photo.attach(io: yigit_photo, filename: yigit.email, content_type: 'image/png')
yigit.save!
puts "User Yigit has been created"

yigit_outfits = Array.new(1)
yigit_outfit_descriptions = [
  "Enjoying the Austrian mountains in my favourite shirt"
]
yigit_outfit_photos = [
  "https://res.cloudinary.com/mariorzgz/image/upload/v1646905514/yigit_outfit.jpg"
]

yigit_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: yigit_outfit_descriptions[index]
  )
  outfit_photo = URI.open(yigit_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Yigit"
  outfit.save!
  puts "Outfit created"
end

yigit_outfits = Outfit.where("user_id = ?", User.last.id)

# Here ends user Yigit


# Here starts user Mario

  mario_photo = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1643622347/ekjbgb0bi3ac6zg3nn1t.jpg")

  mario = User.new(
    email: "mario@mario.com",
    password: "mario@mario.com",
    nickname: "mariorzgz"
  )

  mario.photo.attach(io: mario_photo, filename: mario.email, content_type: 'image/png')
  mario.save!
  puts "User mario has been created"

  mario_items = Array.new(3)
  mario_item_photos = [
    "https://res.cloudinary.com/mariorzgz/image/upload/v1646400947/jacket_v1tu1c.jpg",
    "https://res.cloudinary.com/mariorzgz/image/upload/v1646400947/body_bad_gyal_jsbzut.jpg",
    "https://res.cloudinary.com/mariorzgz/image/upload/v1646400947/buffalo_z4svwx.jpg"

  ]
  mario_item_names = ["Fax fur jacket", "Bad Byal x Bershka bodysuit", "Buffalo Sneakers"]
  mario_item_descriptions = [
    "Faux fur jacket, bought it second handed already. It's super cozy and perfect for the winter",
    "Used only twice. This is the body from the Bad Byal collection from Bershka. Really nice for parties",
    "Barely used white buffalos. I need to get rid of them because they don't fit me. I accept some other buffalo in size 39 or 40"
  ]

  mario_item_brands = ["", "Bershka", "Buffalo"]
  mario_item_sizes = ["M", "M", "38"]
  mario_item_colors = ["brown", "pink", "white"]

  mario_items.each_with_index do |i, index|
    item = Item.new(
      name: mario_item_names[index],
      description: mario_item_descriptions[index],
      brand: mario_item_brands[index],
      size: mario_item_sizes[index],
      color: mario_item_colors[index]
    )

    mario_item_photo = URI.open(mario_item_photos[index])
    item.photo.attach(io: mario_item_photo, filename: item.name, content_type: 'image/png')
    item.user = User.find_by nickname: "mariorzgz"
    item.save!
    puts "Item #{item.name} created!"
  end

  mario_outfits = Array.new(2)
  mario_outfit_descriptions = [
    "Wearing the body from bershka for the first time ✨",
    "Love spring weather ✨"
  ]
  mario_outfit_photos = [
    "https://res.cloudinary.com/mariorzgz/image/upload/v1646400947/outfit_with_body_ykmiqp.jpg",
    "https://res.cloudinary.com/mariorzgz/image/upload/v1646400949/outfit_without_items_lgieud.jpg"
  ]

  mario_outfits.each_with_index do |o, index|
    outfit = Outfit.new(
      description: mario_outfit_descriptions[index]
    )
    outfit_photo = URI.open(mario_outfit_photos[index])
    outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
    outfit.user = User.find_by nickname: "mariorzgz"
    outfit.save!
    puts "Outfit created"
  end

  mario_outfits = Outfit.where("user_id = ?", User.last.id)
  mario_items = Item.where("user_id = ?", User.last.id)

  ItemOutfit.create!(
    outfit: mario_outfits.first,
    item: mario_items.second
  )

  Order.create!(
    buyer: User.find_by(nickname: 'Jaqueline'),
    offered_item: User.find_by(nickname: 'Jaqueline').items.third,
    seller: User.find_by(nickname: 'mariorzgz'),
    desired_item: User.find_by(nickname: 'mariorzgz').items.last
  )

  puts "First order created"

  Order.create!(
    buyer: User.find_by(nickname: 'Jaqueline'),
    offered_item: User.find_by(nickname: 'Jaqueline').items.second,
    seller: User.find_by(nickname: 'mariorzgz'),
    desired_item: User.find_by(nickname: 'mariorzgz').items.second
  )

  puts "Second order created"

# Ends User Mario

#Starts with user Lena

lena_photo = URI.open("https://image.gala.de/22297492/t/jg/v5/w1440/r1/-/lena-gercke.jpg")

lena = User.new(
  email: "lena@lena.com",
  password: "lena@lena.com",
  nickname: "Lena"
)

lena.photo.attach(io: lena_photo, filename: lena.email, content_type: 'image/png')
lena.save!
puts "User Lena has been created"

lena_items = Array.new(5)
lena_item_photos = [
  "https://cdn.aboutstatic.com/file/images/e0cefda9fe4e175e33d95daddd3c434f.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/453929312adda01d01b5666ff8dfe430.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/9b372fa94cffe3aafda0001103128a0b.png?bg=F4F4F5&quality=75&trim=1&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/540287c2e5f5ce8ddeac96148a490120.png?bg=F4F4F5&quality=75&trim=1&height=534&width=400",
  "https://cdn.aboutstatic.com/file/images/03c9e9d56ad31f1a72ad3db5f1cba822.jpg?quality=75&height=534&width=400"

]
lena_item_names = ["Pullover", "Pants 'Raven'", "Ankle boots", "Oversized sweater", "Pants 'Mia'"]
lena_item_descriptions = [
  "A very stylish long-sleeved rib knit pullover. The colour looks really fresh and nice.",
  "This stylish black trousers are plain coloured and made out of faux leather. They are bootcut and high waist.",
  "These leather boots have platform heels and are in colour-blocking style with the colours black and white. The leather is very smooth and you have a side-zip. The heel is medium high, about 5 cm.",
  "Fine knit oversized sweater, made out of 52% Alpaca wool. The sweater has a long cut and a normal fit. One of the best things is the soft feel.",
  "Plain coloured high waist trousers with wide leg. The trousers have side pockets and contrasts seams. 100% leather."
]

lena_item_brands = ["LeGer", "LeGer", "LeGer", "LeGer", "LeGer"]
lena_item_sizes = ["S", "S", "38", "36", "36"]
lena_item_colors = ["pink", "black", "black and white", "lilac", "black"]

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
  item.user = User.find_by nickname: "Lena"
  item.save!
  puts "Item #{item.name} created!"
end

lena_outfits = Array.new(2)
lena_outfit_descriptions = [
  "I love this outfit, because I think the combination of the fresh pink sweater with the dark leather trouser makes it look both elegant and easy-going.",
  "Very cool look, that I love to wear on weekends for going out."
]
lena_outfit_photos = [
  "https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600",
  "https://cdn.aboutstatic.com/file/images/a0177f681f7a181753008ee45d0d0f16.jpg?quality=75&height=534&width=400"
]

lena_outfits.each_with_index do |o, index|
  outfit = Outfit.new(
    description: lena_outfit_descriptions[index]
  )
  outfit_photo = URI.open(lena_outfit_photos[index])
  outfit.photo.attach(io: outfit_photo, filename: outfit.description, content_type: 'image/png')
  outfit.user = User.find_by nickname: "Lena"
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

ItemOutfit.create!(
  outfit: lena_outfits.first,
  item: lena_items.third
)

ItemOutfit.create!(
  outfit: lena_outfits.second,
  item: lena_items.fourth
)

ItemOutfit.create!(
  outfit: lena_outfits.second,
  item: lena_items.fifth
)

puts "Outfit with tagged items created"
