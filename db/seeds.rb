Booking.delete_all
Life.delete_all

10.times do
  Life.create(title: Faker::Artist.name, description: 'Fake life for tests', user_id: 1, price: 99.99)
end

date = Date.today
Life.all.each do |life|
  5.times do
    Booking.create(life: life, user_id: 1, start_date: date, end_date: date.next_day)
    date = date.next_day(2)
    end
end
