class BookCommetsController < ApplicationController
  # GET /book_commets
  # GET /book_commets.json
  def index
    @book_commets = BookCommet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_commets }
    end
  end

  # GET /book_commets/1
  # GET /book_commets/1.json
  def show
    @book_commet = BookCommet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_commet }
    end
  end

  # GET /book_commets/new
  # GET /book_commets/new.json
  def new
    @book_commet = BookCommet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_commet }
    end
  end

  # GET /book_commets/1/edit
  def edit
    @book_commet = BookCommet.find(params[:id])
  end

  # POST /book_commets
  # POST /book_commets.json
  def create
    @book_commet = BookCommet.new(params[:book_commet])

    respond_to do |format|
      if @book_commet.save
        format.html { redirect_to @book_commet, notice: 'Book commet was successfully created.' }
        format.json { render json: @book_commet, status: :created, location: @book_commet }
      else
        format.html { render action: "new" }
        format.json { render json: @book_commet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_commets/1
  # PUT /book_commets/1.json
  def update
    @book_commet = BookCommet.find(params[:id])

    respond_to do |format|
      if @book_commet.update_attributes(params[:book_commet])
        format.html { redirect_to @book_commet, notice: 'Book commet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_commet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_commets/1
  # DELETE /book_commets/1.json
  def destroy
    @book_commet = BookCommet.find(params[:id])
    @book_commet.destroy

    respond_to do |format|
      format.html { redirect_to book_commets_url }
      format.json { head :no_content }
    end
  end
end
