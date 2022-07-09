class BooksController < ApplicationController

 before_action :authenticate_user!
  
  def index
    # @books = Book.where("available_copies >= ?", 1).distinct.pluck(:title)
    @histories = current_user.histories.where(return_date: nil)
    # @available_books = @books.where(id: History.where.not())
    # @histories.each { |history| 
    #   # @books.each { |book|
    #     # if history.books_id == book.id
    #     #   @books.
    #     @books.delete_if { |book| book.id == history.books_id}
    #   # }
    # }
    @available_books = Book.where.not(id: @histories.select(:books_id)).where("available_copies >= ?", 1).distinct.pluck(:title)
  end

  def show 
    @book = Book.find_by(title:params[:title])
  end

  def current_history
    @book = Book.find(params[:id])
    @history = @book.histories.find_by(users_id:current_user.id,return_date: nil)
  end

  def issue
    user = User.find(current_user.id)
    if user.wallet.points == 0
      redirect_to "/borrowed", alert:"You don't have enough points in wallet."
    else
    @book = Book.find(params[:id])
      if @book.update(available_copies:@book.available_copies - 1)
        @book.histories.create!(users_id:current_user.id,issue_date:Date.today)
        @wallet = Wallet.find_by(users_id:current_user.id)
        if @wallet.update(points: @wallet.points - 10)
          redirect_to "/borrowed"
        end
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
