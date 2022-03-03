class ReviewsController < ApplicationController
  def show
  end

  def new
    @loan = Loan.find(params[:loan_id])
    @review = Review.new
  end

  def create
  end

  def destroy
  end
end
