class Book < ApplicationRecord
    has_many :histories, foreign_key: :books_id
    has_many :users, through: :histories, dependent: :destroy

    validates :isbn, presence: true
    validates :title, presence: true
    validates :author, presence: true
    validates :publisher, presence: true
    validates :available_copies, presence: true, numericality: { greater_than_or_equal_to: 0}

end

