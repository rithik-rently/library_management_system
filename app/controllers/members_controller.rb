class MembersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    if !user_signed_in?
      redirect_to "/users/sign_in"
    else
      # @books = Book.where(user_id:current_user.id)
      @books = current_user.histories.where(return_date: nil)
    end
  end
end
