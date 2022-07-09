class Api::HistoriesController < ApplicationController

  before_action :current_user
  before_action :doorkeeper_authorize!
  
    def index
      @histories = History.where.not(return_date:nil)
      render json: @histories, status: 200
    end

    def show
      @history = History.find(params[:id])
      render json: @history, status: 200
    end

    def create
      @history=History.new(history_create_params)
      if  (params[:history][:issue_date]).to_date > (params[:history][:return_date]).to_date
        render json:{"errormsg": "not saved"}
      else
        if @history.save
          render json: @history, status: 200
        else
          render json:{"errormsg": "not saved"}
        end 
      end
    end

    def update
      @history = History.find(params[:id])
      if @history.issue_date > (params[:history][:return_date]).to_date
        render json:{"errormsg": "not saved"}
      else
        if @history.update(history_update_params)
          render json: @history, status: 200
        end
      end
    end

    def destroy 
      @history = History.find(params[:id])
      if @history.destroy
        render json: @history, status: 200
      end
    end

    def history_create_params
      params.permit(:users_id, :books_id, :issue_date, :return_date)
    end

    def history_update_params 
      params.permit(:issue_date, :return_date)
    end
end