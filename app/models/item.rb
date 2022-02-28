class Item < ApplicationRecord
  belongs_to :user
  validates :item_name, :description, :img_url, presence: true
end
