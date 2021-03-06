#encoding: utf-8

tags = %w(计算机 文学 历史 哲学 心理学 随笔 科普 技术 小说 美术)

100.times.each do |i|
  b = Book.create(name: Faker::Product.product_name, author: Faker::Name.name, 
                  ISBN: rand(111111111111), user_id: rand(99)+1,
                  author_abstract: Faker::LoremCN.sentences,
                  content_abstract: Faker::LoremCN.paragraphs
                 )

  rand(i+1).times.each do
    b.comments.create(title: Faker::Name.name, comment: Faker::LoremCN.sentences, user_id: rand(50) + 1)
  end

  b.tag_list = [ tags[rand(10)], tags[rand(10)] ]
  b.save
end

3.times.each do |i|
  Book.create(name: Faker::Product.product_name, content_abstract: Faker::Lorem.sentences(5),
              author_abstract: Faker::Lorem.sentences,
              author: Faker::Name.name, cover: File.open("#{Rails.root}/app/assets/images/rails.png"),
              user: User.first
             )
end
