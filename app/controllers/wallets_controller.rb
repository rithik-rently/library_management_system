class WalletsController < ApplicationController
  before_action :authenticate_user!
  def show
    @wallet = Wallet.find_by(users_id: current_user.id)
  end
end
