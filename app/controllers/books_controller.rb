class BooksController < ApplicationController

  def booksindex
  end

 

  def index
  	  @books = Book.all
  	  @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end


protect_from_forgery :except => ["create"]

  def create
  	  @book = Book.new(book_params)

  	  if @book.save
  	  	 flash[:success] = 'successfully'
  	     redirect_to book_path(@book)
  	  else
  	  	flash.now[:danger] = '入力してください'
        @books = Book.all
  	  	render :index
  	  end

  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	  @book = Book.find(params[:id])

  	  if @book.update(book_params)
         flash[:success] = 'successfully'
  	     redirect_to book_path(@book)
  	  else
  	  	render :edit
  	  end
  end

  def destroy
  	  @book = Book.new
  	  book = Book.find(params[:id])
  	  book.destroy
  	  redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
