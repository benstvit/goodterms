class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @borrowed = current_user.loans.each do |loan|
      loan.where(loan.item.user_id != current_user.id)
    end
    @lent = current_user.loans.each do |loan|
      loan.where(loan.item.user_id == current_user.id)
    end
  end

  def dashboard
    @loans = Loan.where(user_id: current_user)
    @users = User.all
  end
end
