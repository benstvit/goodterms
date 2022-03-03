class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @loans = Loan.all
    # @items = @user.items
    @items = Item.all
  end
end

# Loan.all.where(loan.user == @user || loan.item.user == @user)
