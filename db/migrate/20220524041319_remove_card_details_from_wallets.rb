class RemoveCardDetailsFromWallets < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallets, :card_number
    remove_column :wallets, :cvv
    remove_column :wallets, :expiry_date
    remove_column :wallets, :name 
  end
end
