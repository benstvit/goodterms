class Item < ApplicationRecord
  belongs_to :user
  validates :item_name, :description, presence: true
  has_one_attached :photo
end
