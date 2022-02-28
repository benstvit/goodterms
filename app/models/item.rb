class Item < ApplicationRecord
  belongs_to :user
  has_one :user, through: :loans
  validates :item_name, :description, :img_url, presence: true
end
