100.times.each do
  u = User.new(name: Faker::Name.name, email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
  u.confirm!
end
