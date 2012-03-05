FactoryGirl.define do
  factory :book, class: Book do
    association :user, factory: :user

    name Faker::Product.name
    author Faker::Name.name
    content_abstract  Faker::Product.model
    ISBN { rand(100000) }
  end

  factory :user, class: User do
    name Faker::Name.name
    email Faker::Internet.email
    password "123456"
    password_confirmation "123456"
  end

  factory :commet, class: Commet do
    association :user, factory: :user
    association :book, factory: :book

    commet Faker::Product.model
  end
end
