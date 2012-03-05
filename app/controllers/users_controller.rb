class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: :show
  def show
    @user = User.find(params[:id])

    @follow_books = @user.follows_by_type "Book"
    @upload_books = @user.books
    @commet = @user.commets
  end
end
