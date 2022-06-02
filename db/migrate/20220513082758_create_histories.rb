class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.references :users, null: false, foreign_key: true
      t.references :books, null: false, foreign_key: true
      t.date :issue_date, null: false
      t.date :return_date

      t.timestamps
    end
  end
end
