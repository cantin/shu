3.times.each do |i|
  Book.create(name: Faker::Product.product_name, author: Faker::Name.name, cover: File.open("#{Rails.root}/app/assets/images/rails.png"))
end

100.times.each do |i|
  b = Book.create(name: Faker::Product.product_name, author: Faker::Name.name)
  i.times.each do
    b.comments.create(title: Faker::Name.name, comment: Faker::LoremCN.words)
  end
end

