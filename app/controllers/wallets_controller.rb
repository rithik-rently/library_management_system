class WalletsController < ApplicationController
  def show
    @wallet = Wallet.find_by(users_id: current_user.id)
  end
end
