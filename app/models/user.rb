class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :registerable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_commit :create_wallet, on: :create

  has_many :histories, foreign_key: :users_id
  has_many :books, through: :histories
  has_one :wallet, foreign_key: :users_id
  has_one :wallet_card, through: :wallet

  def create_wallet
    @wallet = Wallet.create(users_id: id, points: 100)
  end

  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  validates :name, presence: true
  validates :contact, presence: true
  validates :email, presence: true 
  validates :password, presence: true
end
