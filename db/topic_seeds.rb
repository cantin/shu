#encoding: utf-8

topic_tags = %w(kindle 电子书 设计 艺术 计算机 文学)

30.times.each do |i|
  t = Topic.create(title: Faker::LoremCN.word, content: Faker::LoremCN.paragraphs, user: User.first)

  rand(i+1).times.each do |j|
    t.comments.create(title: Faker::Name.name, comment: Faker::LoremCN.sentences, user_id: rand(50) + 1)
  end

  t.tag_list = [ topic_tags[rand(6)], topic_tags[rand(6)] ]
  t.save
end
