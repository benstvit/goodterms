class Item < ApplicationRecord
  belongs_to :user
  has_many :loans
  validates :item_name, :description, presence: true
  has_one_attached :photo
end
