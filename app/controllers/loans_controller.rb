class LoansController < ApplicationController

  def index
    @loans = Loan.all
    @review = Review.new
  end

  def show
    @loan = Loan.find(params[:id])
    @loans = Loan.all
  end

  def new
    @loans = Loan.all
    @loan = Loan.new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.save
    @chatroom = Chatroom.create
    @loan = Loan.new(loan_params)
    @loan.item = @item
    @loan.chatroom = @chatroom
    if @loan.save
      redirect_to root_path notice: "Congrats, you created a new loan"
    else
      render :new
    end
  end

  def edit
  end


  def mark
    @loan = Loan.find(params[:id])
    @loan.update(status: 'accepted')
    redirect_to root_path, notice: "Request has been accepted"
  end

  def update
    @loan = Loan.find(params[:id])
    # @user = @loan.user
    if @loan.status == 'pending'
      @loan.update(status: 'accepted')
    else
      @loan.update(status: 'returned')
    end
  end

  def new_borrow
    @loan = Loan.new
    @item = Item.new
  end

  def borrow
    @user = User.find(params[:id])
    @loans = Loan.all
    # @items = @user.items
    @items = Item.all
    @chatrooms = Chatroom.all
    @message = Message.new
    @review = Review.new
    @item = Item.new(item_params)
    # @item.user_id = @item.user
    # @item.user_id = current_user[:id]
    # @item.user_id = Item.find(@item.user)
    # @item.user.id = params[:item][:user]
    @item.save
    @chatroom = Chatroom.create
    @loan = Loan.new(loan_params)
    @loan.user = current_user
    @loan.item = @item
    @loan.chatroom = @chatroom
    if @loan.save
      redirect_to root_path notice: "Congrats, you created a new loan"
    else
      render :new_borrow
    end
  end

  def destroy
    @loan = Loan.find(params[:id])
    @user = @loan.user
  end

  private

  def item_params
    (params.require(:item).permit(:item_name, :description, :user_id, :photo)).merge(params.require(:loan).permit(:photo))
  end

  def loan_params
    params.require(:loan).permit(:loan_date, :return_date, :status, :user_id)
  end
end
