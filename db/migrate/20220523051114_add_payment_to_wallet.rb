class AddPaymentToWallet < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :card_number, :string
    add_column :wallets, :expiry_date, :date
    add_column :wallets, :cvv, :string
    add_column :wallets, :name, :string
  end
end
