class Api::HistoriesController < ApplicationController

  before_action :current_user

    def index
      @histories = History.where.not(return_date:nil)
      render json: @histories, status: 200
    end

    def show
      @history = History.find(params[:id])
      render json: @history, status: 200
    end

    def create
      @history=History.new(history_params)
      if @history.save
        render json: @history, status: 200
      else
        render json:{"errormsg": "not saved"}
      end
    end

    def update
      @history = History.find(params[:id])
      if @history.update(history_params)
        render json: @history, status: 200
      end
    end

    def destroy 
      @history = History.find(params[:id])
      if @history.destroy
        render json: @history, status: 200
      end
    end

    def history_params
      params.permit(:users_id, :books_id, :issue_date, :return_date)
    end
end