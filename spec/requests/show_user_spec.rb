require 'spec_helper'
  feature "user index" do
    background(:all) do
      @u = user_create
      user_login @u
      @book2 = FactoryGirl.create :book, user: @u
      @u.follow @book2
      @book1= FactoryGirl.create :book, user: @u
      @u.follow @book1

      #@user1 = user_create
      #@u.follow @user1
      #@user2 = user_create
      #@u.follow @user2
      #@book3 = FactoryGirl.create :book, user: @user1
    end

    scenario "with follow book" do
      visit "/users/#{@u.id}"

      page.should have_content @book1.name
      page.should have_content @book2.name
      @u.books.should have(2).items
      @u.all_following.should have(2).items
    end

    #scenario "wiht follow user" do
      #visit "/users/#{@u.id}"

      #page.should have_content @user1.name
      #page.should have_conten @user2.name
      #page.shoudl have_content @book3.name
    #end
  end
