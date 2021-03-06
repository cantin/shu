class UsersController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:show, :index]

  def index
    @latest_users = User.last(20)
    @most_active_users = User.most_active_users 20
  end

  def show
    @user = User.find(params[:id])

    @follow_user = @user.following_by_type 'User'
    @upload_books = @user.books
    @comment = Book.find_comments_by_user @user
  end

  def books
    @books = current_user.books.page(params[:page]).per(10)
  end

  def follow
    user = User.find params[:id]

    current_user.follow(user)

    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end

  def unfollow
    user = User.find params[:id]

    current_user.stop_following(user)

    respond_to do |format|
      format.json { render json: {}, status: :ok }
    end
  end

end
