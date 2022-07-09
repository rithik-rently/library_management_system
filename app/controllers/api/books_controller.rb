class Api::BooksController < ApplicationController

  
   before_action :current_user
   before_action :doorkeeper_authorize!

  def index
    @books = Book.where("available_copies >= ?", 1).distinct.pluck(:title)
    render json: @books, status: 200
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status: 200
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      render json: @book, status: 200
    end
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      render json: @book, status: 200
    else
      render json:{"errormsg": "not saved"}
    end
  end

  def destroy 
    begin
      @book = Book.find(params[:id])
      if @book.destroy
        render json: @book, status: 200
      else 
        render json: {error: "Invalid Book id", status: false}, status: 400
      end
      rescue => exception
        render json: {error: exception, status:false}, status: 500
      end
    
  end


  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :available_copies)
  end
  
end
