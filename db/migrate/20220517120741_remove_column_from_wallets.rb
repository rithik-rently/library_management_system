class RemoveColumnFromWallets < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallets, :user_id
  end
end
