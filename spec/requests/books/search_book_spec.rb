#encoding: utf-8
require 'spec_helper'

feature 'Search book', js: true do
  describe 'with valid name' do
    before(:all) do
      5.times do |i|
        FactoryGirl.create :book, name: "张三的书#{i}", user_id: 1
      end
    end
    scenario ' will get the books' do
      visit '/books'

      fill_in 'book_name', with: '张三的'
      page.execute_script %Q( $('.navbar-search').submit() )
      sleep 3

      5.times do |i|
        page.should have_content "张三的书#{i}"
      end
    end
  end
end
