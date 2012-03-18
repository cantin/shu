class HomesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @user ||= current_user
    @books = Book.all
    @mc_books = Book.most_commented_books
  end
end
