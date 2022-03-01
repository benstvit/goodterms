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
    @item = create_new_item
    @chatroom = Chatroom.create
    @loan = Loan.new(loan_params)
    @loan.item_id = @item.id
    @loan.chatroom = @chatroom
    if @loan.save
      redirect_to loans_path
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

  def loan_params
    params.require(:loan).permit(:loan_date, :return_date, :status, :user_id)
  end
end
