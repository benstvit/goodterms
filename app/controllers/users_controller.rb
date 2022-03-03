class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @loans = @user.loans
  end
end

# Loan.all.where(loan.user == @user || loan.item.user == @user)
