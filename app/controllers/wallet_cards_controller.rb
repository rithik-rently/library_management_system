class WalletCardsController < ApplicationController

    before_action :authenticate_user!
    def show
        user = User.find(current_user.id)
        puts("user wallet card: #{user.wallet.wallet_card}")
        if user.wallet.wallet_card
            @wallet_card = user.wallet.wallet_card
            puts "user has wallet card"
        else
            redirect_to "/wallet_card/new"
        end
    end

    def new
        @wallet_card = WalletCard.new
        puts "user don't have a wallet card"
    end
    
    def create
        user = User.find(current_user.id)   
        if user.wallet.create_wallet_card(wallet_card_params)
            redirect_to borrowed_path
        else
            render :new
        end
    end

    def recharge 
        
    end

    def add
        user = User.find(current_user.id)
        @wallet = Wallet.find_by(users_id:current_user.id)
        if @wallet.update(points: @wallet.points + params["points"].to_i)
          redirect_to "/borrowed"
        end
    end

    
    def wallet_card_params
        params.require(:wallet_card).permit(:card_number, :expiry_date, :cvv)
    end
end
