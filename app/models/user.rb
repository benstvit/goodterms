class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :loans
  has_many :reviews
  has_many :items, through: :loans
  has_many :reviews, through: :loans
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :location, presence: true

end
