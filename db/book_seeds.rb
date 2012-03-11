3.times.each do |i|
  Book.create(name: Faker::Product.product_name, author: Faker::Name.name, cover: File.open("#{Rails.root}/app/assets/images/rails.png"))
end

100.times.each do |i|
  Book.create(name: Faker::Product.product_name, author: Faker::Name.name)
end

