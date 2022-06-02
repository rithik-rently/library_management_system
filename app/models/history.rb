class History < ApplicationRecord
  belongs_to :user, foreign_key: :users_id
  belongs_to :book, foreign_key: :books_id

  validates :issue_date, presence: true
  # validates :return_date, presence: true
end