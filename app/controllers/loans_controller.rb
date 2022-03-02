class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def new
    @loan = Loan.new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user[:id]
    @item.save
    @chatroom = Chatroom.create
    @loan = Loan.new(loan_params)
    @loan.item = @item
    @loan.chatroom = @chatroom
    if @loan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    (params.require(:item).permit(:item_name, :description, :photo)).merge(params.require(:loan).permit(:photo))
  end

  def loan_params
    params.require(:loan).permit(:loan_date, :return_date, :status, :user_id)
  end
end
