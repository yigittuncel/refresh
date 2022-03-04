users = Array.new(3)

user_photos = [
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641542998/upgrit4bif7ab8enrywz.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1643622347/ekjbgb0bi3ac6zg3nn1t.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641491612/phy5oue4p0ftrjl3nnu7.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641496329/rksezyk6ndmyjuh3jp8b.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641197640/tltl66uk36iuhxjmt4wr.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641741818/rqxqd6d7kvehd8gfzj4z.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641194769/es5y4oty1ej25pmbckq6.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641489025/v0cccoyg5qgwifydqhlp.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1643376514/nfaf0gwsk3zgcnaodrtk.jpg",
  "https://avatars.githubusercontent.com/u/28245098?v=4",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641514195/rqald3eqzzvkqqycd21r.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641735078/pyafw4bavxfeqmb0vj7c.jpg",
  "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641554758/itw2hdjxge7nonvpoqae.jpg",
  "https://avatars.githubusercontent.com/u/97020679?v=4",
  "https://ca.slack-edge.com/T02NE0241-U56PHGY1Z-14661014b251-512",
  "https://ca.slack-edge.com/T02NE0241-UDAKDMC5U-22cee4862fb3-512",
  "https://ca.slack-edge.com/T02NE0241-U02A8HNNVD3-6830ab9e44f1-512",
  "https://ca.slack-edge.com/T02NE0241-URYUU7H9R-0a5744f5529b-512",
  "https://ca.slack-edge.com/T02NE0241-ULHT7RUTU-25f6e4344376-512",
  "https://ca.slack-edge.com/T02NE0241-ULMJDQKHP-92839c14cc51-512",
  "https://ca.slack-edge.com/T02NE0241-U018903QF1P-9415a7861e84-512"
]

nicknames = ["Christina", "Mario", "Yigit", "Anna", "Romain", "Melissa", "Sophie", "Michelle", "Fotios", "Nicola", "Michael", "Maximilian", "Hasib", "Sankar", "Arbi", "Marcel", "Domenico", "Bruncky", "Andre", "Yair", "Wiebke"]
user_email = ["christina@borensky.com", "mario@rodriguez-gonzalez.com", "yigit@tuncel.com", "anna@eiden.com", "romain@gille.com", "melissa@hauck.com", "sophie@hadeln.com", "michelle@knolly.com", "fotios@kolytoumpas.com", "nicola@pilcher.com", "michael@pitopoulakis.com", "maximilian@scheider.com", "hasib@Selimovic.com", "sankar@ganesh-subramanian.com", "arbi@velaj.com", "marcel@fonseca.com", "domenico@macellaro.com", "bruno@brunckhorst.com", "andre@ferrer.com", "yair@gordon.com", "wiebke@goldhorn.com"]
user_password = ["secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret", "secret" ]

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


outfit_photos = [
  https://cdn.aboutstatic.com/file/images/f381c62d33fbb657f3ba4991de1345ac.jpg?quality=75&height=800&width=600,
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
  outfit.user = User.find(index)
  outfit.items = []
  outfit.items << Item.find(index)
  outfit.save!
  puts "Outfit #{outfit.description} created!"
end
