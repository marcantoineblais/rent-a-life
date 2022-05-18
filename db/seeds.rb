Booking.destroy_all
Life.destroy_all
User.destroy_all

users = [
  User.create(first_name: 'admin', last_name: "istrator", password: '123456', email: "a@a.ca"),
  User.create(first_name: 'Marc', last_name: "Blais", password: '123456', email: "blaisma@live.fr")
]

users.each do |user|
  10.times do
    Life.create(title: Faker::Artist.name, description: 'Fake life for tests', user: user, price: 99.99)
  end
end

# date = Date.today
# Life.all.each do |life|
#   5.times do
#     Booking.create(life: life, user: user, start_date: date, end_date: date.next_day)
#     date = date.next_day(2)
#   end
# end
