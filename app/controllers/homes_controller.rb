class HomesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @user ||= current_user
    @books = Book.includes(:user).page(params[:page]).per(10)
    @mc_books = Book.most_commented_books 10
  end
end
