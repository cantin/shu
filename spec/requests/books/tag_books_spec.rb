#encoding: utf-8
require 'spec_helper'

feature 'Tag books',driver: :chrome do
  describe 'with valid tag' do
    before(:all) do
      5.times do |i|
        FactoryGirl.create :book, name: "张三的书#{i}", user_id: 1, tag_list: '技术'
      end
      FactoryGirl.create :book, name: "李四的书", user_id: 1
    end

    scenario 'will get the books' do
      visit '/books'

      click_link '技术'

      5.times do |i|
        page.should have_content "张三的书#{i}"
      end
      page.should_not have_content '李四的书'
    end
  end

end
