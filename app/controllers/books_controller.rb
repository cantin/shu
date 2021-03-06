#encoding: utf-8
class BooksController < ApplicationController
  skip_before_filter :authenticate_user!, only: [ :index, :show, :search, :tags ]
  protect_from_forgery :except => :search

  def index
    @books = Book.includes(:user).page(params[:page]).per(10)

    render 'homes/index'
  end

  def search
    q = { name_cont: params[:book_name] }
    @books = Book.search(q).result
  end

  def tags
    @books = Book.tagged_with(params[:name]).page(params[:page]).per(10)

    render 'homes/index'
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comment = Comment.new
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])
    @book.user = current_user

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: '上传书籍成功' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
end
