class AddNotNullToWallets < ActiveRecord::Migration[6.1]
  def change
    change_column_null :wallets, :card_number,false
    change_column_null :wallets, :expiry_date, false
    change_column_null :wallets, :cvv,false
    change_column_null :wallets, :name, false
  end
end
