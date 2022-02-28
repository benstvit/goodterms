class Review < ApplicationRecord
  belongs_to :loan
  belongs_to :user
  validates :rating, :comment, presence: true
end
