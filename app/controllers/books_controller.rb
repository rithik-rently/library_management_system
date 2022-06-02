class BooksController < ApplicationController

  before_action :authenticate_user!
  
  
  def index
    @books = Book.where("available_copies >= ?", 1).distinct.pluck(:title)
  end

  def show 
    @book = Book.find_by(title:params[:title])      #.and(Book.where("available_copies >= ?",1))
  end

  def current_history
    @book = Book.find(params[:id])
    @history = @book.histories.find_by(users_id:current_user.id,return_date: nil)
  end

  def issue
    @book = Book.find(params[:id])
    if @book.update(available_copies:@book.available_copies - 1)
      @book.histories.create!(users_id:current_user.id,issue_date:Date.today)
      @wallet = Wallet.find_by(users_id:current_user.id)
      if @wallet.update(points: @wallet.points - 10)
        redirect_to "/borrowed"
      end
    end
  end

  def return
    @book = Book.find(params[:id])
    @history = @book.histories
    if @book.update(available_copies:@book.available_copies + 1)
      if @history.update(return_date: Date.today)
        redirect_to "/borrowed"
      end
    end    
  end
end 
