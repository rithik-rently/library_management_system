class CreateWalletCards < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_cards do |t|
      t.string :card_number
      t.date :expiry_date
      t.string :cvv
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
