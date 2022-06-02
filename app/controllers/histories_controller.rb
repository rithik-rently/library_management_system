class HistoriesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @histories = current_user.histories.where.not(return_date: nil)
  end

  
  
end
