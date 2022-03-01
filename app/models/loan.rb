class Loan < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :chatroom
  validates :loan_date, :return_date, :status, presence: true
  # validates :loan_date, comparison: { greater_than_or_equal_to: :return_date }
end
