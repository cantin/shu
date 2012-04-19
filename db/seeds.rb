# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  u = User.new(name: "shu", email: 'admin@shu.com', password: '123456', password_confirmation: '123456')
  u.confirm!

  Admin.create(email: 'admin@shu.com', password:'123456', password_confirmation: '123456')

  load File.join(File.dirname(__FILE__), "user_seeds.rb")
  load File.join(File.dirname(__FILE__), "book_seeds.rb")
  load File.join(File.dirname(__FILE__), "topic_seeds.rb")

  Book.create!(name: "ruby on rails", author: "someone",
               cover: File.open("#{Rails.root}/app/assets/images/rails.png"),
               user: u
              )
end
