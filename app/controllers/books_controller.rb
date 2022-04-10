class BooksController < ApplicationController
  protect_from_forgery
  
  def index
    @book = Book.new
    @books=Book.all

  end
  

  def create
    flash[:notice] = "successfully" 
    @books=Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render:index
    end

  end


  def show
  	@book = Book.find(params[:id])
  end



  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    flash[:notice] = "Book was successfully updated." 
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
