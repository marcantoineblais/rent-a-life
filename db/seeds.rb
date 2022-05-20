require "open-uri"

User.destroy_all
puts "Users destroyed"
Life.destroy_all
puts "Lives detroyed"
Booking.destroy_all
puts "Bookings destroyed"

u = User.create!(
  {email: "florent@gilet.ca", password: "123456", first_name: "Florent", last_name: "Gilet"}
)
file = URI.open('https://res.cloudinary.com/diiu2j0fw/image/upload/v1653063058/development/5mjrmlc6qq251et0e7nnh6fszjrq.jpg')
u.profile_picture.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

a = User.create!(
  {email: "marc@blais.com", password: "123456", first_name: "Marc", last_name: "Blais"}
)
file1 = URI.open('https://res.cloudinary.com/diiu2j0fw/image/upload/v1653063058/development/5mjrmlc6qq251et0e7nnh6fszjrq.jpg')
a.profile_picture.attach(io: file1, filename: 'user.jpg', content_type: 'image/jpg')

b = User.create!(
  {email: "aurelien@gremy.ca", password: "123456", first_name: "Aurelien", last_name: "Gremy"}
)
file2 = URI.open('https://res.cloudinary.com/diiu2j0fw/image/upload/v1653063058/development/5mjrmlc6qq251et0e7nnh6fszjrq.jpg')
b.profile_picture.attach(io: file2, filename: 'user.jpg', content_type: 'image/jpg')

puts "Users generated"


c = Life.new(title: "Le Wagon Teacher", description: "Give remaining time before demo, with a big smile!", price_cents: 11000, user_id: 1, address: "5333, casgrain, qc")
file3 = URI.open('https://dwj199mwkel52.cloudfront.net/assets/core/banners/banner-classroom-db49dfaaf56f2f0bec79ab7f48a2e47f93b5d0ee793fbe7086e18afb00028910.jpg')
c.photo.attach(io: file3, filename: 'user.webp', content_type: 'image/jpg')
c.save

d = Life.new(title: "Thanos", description: "What I'm About To Do To Your Stubborn, Annoying Little Planet, I'm Gonna Enjoy It, Very, Very Much.", price_cents: 15000, user_id: 2, address: "2727 rue cuvillier, montreal, qc")
file3 = URI.open('https://res.cloudinary.com/diiu2j0fw/image/upload/v1653065046/development/07i7f6qe72c00glk7sph705i4lbg.webp')
d.photo.attach(io: file3, filename: 'user.webp', content_type: 'image/webp')
d.save

e = Life.new(title: "Naked photo shoot", description: "Live my life as naked model", price_cents: 152300, user_id: 3, address: "451 rue lagarde, montreal, qc")
file4 = URI.open('https://cdn.fstoppers.com/wp-content/uploads/2013/08/chris_davis_fstoppers_interview_image2.jpg')
e.photo.attach(io: file4, filename: 'user.webp', content_type: 'image/jpg')
e.save

f = Life.new(title: "Superman", description: "Come from Krypton, live my superhero life!", price_cents: 999900, user_id: 1, address: "laval, qc")
file5 = URI.open('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/superman-and-lois-tyler-hoechlin-1607605148.jpg')
f.photo.attach(io: file5, filename: 'user.webp', content_type: 'image/jpg')
f.save
