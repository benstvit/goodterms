class Loan < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :chatroom
  # has_one :review, through: :user, dependent: :destroy
  validates :loan_date, :return_date, :status, presence: true
  # accepts_nested_attributes_for :photo
  # validates :loan_date, comparison: { greater_than_or_equal_to: :return_date }
end
