require 'spec_helper'

feature 'index page' do
  background do
    @user = user_create

    10.times.each do |i|
      FactoryGirl.create :book, user: @user, ISBN: (12345670 + i)
    end

    (100..105).each do |i|
      b = FactoryGirl.create :book,ISBN: (1 + i), user: @user
      i.times.each do |j|
        FactoryGirl.create :comment, commentable: b, user: @user
      end
    end
  end

  describe 'while user login' do
    before do
      user_login @user
    end

    scenario '' do
      should_find

      find('top-bar').should have_content @user.email
    end
  end

  describe 'while user not login' do
    scenario '' do
      should_find
    end
  end
end

def should_find
  10.times.each do |i|
    find('book-area').should have_content #{12345670 + i}
  end

  (100..105).each do |i|
    find('book-hot-comment').should have_content #{1 + i}
  end
end
