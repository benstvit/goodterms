class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @loans = Loan.all
    # @items = @user.items
    @items = Item.all
    @chatrooms = Chatroom.all
    @message = Message.new
    @review = Review.new
  end
end
