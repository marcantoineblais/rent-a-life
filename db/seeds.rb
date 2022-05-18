Booking.destroy_all
Life.destroy_all
User.destroy_all

users = [
  User.create(first_name: 'admin', last_name: "istrator", password: '123456', email: "a@a.ca"),
  User.create(first_name: 'Marc', last_name: "Blais", password: '123456', email: "blaisma@live.fr"),
  User.create(first_name: 'Aurelien', last_name: 'Gremy', password: '123456', email: 'aurelien@gremy.ca')
]

Life.create(title: 'Marty McFly', description: 'For demo purpose only', price: 9999, image_url: 'https://upload.wikimedia.org/wikipedia/en/d/d8/Michael_J._Fox_as_Marty_McFly_in_Back_to_the_Future%2C_1985.jpg', user: users[1])
Life.create(title: 'Neil Armstrong', description: 'For demo purpose only', price: 9999, image_url: 'https://cdn.britannica.com/72/163272-050-1C5BC2B7/Neil-Armstrong-American.jpg', user: users[1])
Life.create(title: 'Superman', description: 'For demo purpose only', price: 9999, image_url: 'https://imageio.forbes.com/blogs-images/jvchamary/files/2016/03/man_of_steel-1200x800.jpg?fit=bounds&format=jpg&width=960', user: users[1])

users.each do |user|
  10.times do
    Life.create(title: Faker::Artist.name, description: 'Fake life for tests', user: user, price: 9999)
  end
end

# date = Date.today
# Life.all.each do |life|
#   5.times do
#     Booking.create(life: life, user: user, start_date: date, end_date: date.next_day)
#     date = date.next_day(2)
#   end
# end
