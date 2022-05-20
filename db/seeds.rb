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


c = Life.new(title: "Le Wagon Teacher", description: "Give remaining time before demo, with a sadic smile!", price_cents: 11000, user_id: 1, address: "5333, casgrain, qc")
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

g = Life.new(title: "Neil Armstrong", description: "Be the first human walking on the moon.", price_cents: 1999900, user_id: 1, address: "brossard, qc")
file6 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Neil_Armstrong_pose.jpg/819px-Neil_Armstrong_pose.jpg')
g.photo.attach(io: file6, filename: 'user.webp', content_type: 'image/jpg')
g.save

h = Life.new(title: "Homer Simpson", description: "Woo Hoo!!!", price_cents: 122200, user_id: 1, address: "verdun, qc")
file7 = URI.open('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2018%2F08%2Fsimp_homersingle08_f_hires2-2000.jpg')
h.photo.attach(io: file7, filename: 'user.webp', content_type: 'image/jpg')
h.save


i = Life.new(title: "Morty Smith", description: "I'm a version of your brother you can trust when he says. Don't run. Nobody exists on purpose. Nobody belongs anywhere. Everybody's gonna die.", price_cents: 122200, user_id: 2, address: "westmount, qc")
file8 = URI.open('https://static.tvtropes.org/pmwiki/pub/images/morty_smith_2.png')
i.photo.attach(io: file8, filename: 'user.webp', content_type: 'image/jpg')
i.save

j = Life.new(title: "Gandhi", description: "Be the change that you wish to see in the world.", price_cents: 1300, user_id: 2, address: "joliette, qc")
file9 = URI.open('https://upload.wikimedia.org/wikipedia/commons/7/7a/Mahatma-Gandhi%2C_studio%2C_1931.jpg')
j.photo.attach(io: file9, filename: 'user.webp', content_type: 'image/jpg')
j.save

k = Life.new(title: "David Gilmour", description: "Live a life in the most famous band of the world.", price_cents: 145300, user_id: 2, address: "montreal, qc")
file10 = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/David_Gilmour_Argentina_2015_%28cropped%29.jpg/220px-David_Gilmour_Argentina_2015_%28cropped%29.jpg')
k.photo.attach(io: file10, filename: 'user.webp', content_type: 'image/jpg')
k.save

l = Life.new(title: "Jon Snow", description: "Lose all your family, fall in love of your aunt, and still knowing nothing.", price_cents: 145300, user_id: 2, address: "Mont Tremblant, qc")
file11 = URI.open('https://upload.wikimedia.org/wikipedia/en/3/30/Jon_Snow_Season_8.png')
l.photo.attach(io: file11, filename: 'user.webp', content_type: 'image/png')
l.save

m = Life.new(title: "Captain Marvel", description: "Live the life of the most powerfull Avenger.", price_cents: 245300, user_id: 1, address: "2727 rue cuvillier, montreal, qc")
file12 = URI.open('https://static.wikia.nocookie.net/marvelcinematicuniverse/images/f/fe/CapMarvel-EndgameProfile.jpeg')
m.photo.attach(io: file12, filename: 'user.webp', content_type: 'image/jpeg')
m.save

n = Life.new(title: "New-Zealand Trip", description: "Travel during 2 months all arount the New-Zealand. Discover Auckland, Wellington, Milford Sound, Hobbiton...", price_cents: 2300, user_id: 1, address: "2727 rue cuvillier, montreal, qc")
file13 = URI.open('https://res.cloudinary.com/diiu2j0fw/image/upload/v1652996718/production/lfc7xajuq9ah9yz8ekjfbtx2u26z.jpg')
n.photo.attach(io: file13, filename: 'user.webp', content_type: 'image/jpg')
n.save
