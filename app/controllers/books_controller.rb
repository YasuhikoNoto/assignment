class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @book = Book.all
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
      flash[:alert] = "2 errors prohibited this book from being saved:"
      @book = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:update] = "Book was successfully updated."
      redirect_to book_path(book.id)
    else
      flash[:alert] = "2 errors prohibited this book from being saved:"
      @book = Book.all
      redirect_to edit_book_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:destroy] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
