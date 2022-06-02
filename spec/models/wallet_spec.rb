require "rails_helper"
RSpec.describe Wallet, :type => :model do

    it { should belong_to(:user) }
    

    it { should have_one(:wallet_card) }

end

