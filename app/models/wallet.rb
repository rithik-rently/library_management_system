class Wallet < ApplicationRecord
    belongs_to :user, foreign_key: :users_id 
    has_one :wallet_card, foreign_key: :wallet_id
end
