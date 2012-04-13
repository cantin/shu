class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @follow_books = @user.following_by_type "Book"
    @upload_books = @user.books
  end
end
