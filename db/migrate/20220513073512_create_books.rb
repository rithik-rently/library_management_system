class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.bigint :isbn
      t.string :title
      t.string :author
      t.string :publisher
      t.integer :available_copies
      t.timestamps
    end
  end
end
