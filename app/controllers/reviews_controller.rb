class ReviewsController < ApplicationController
  def show
  end

  def new
    @loans = Loan.all
    @loan = Loan.find(params[:loan_id])
    @review = Review.new
  end

  def create
    raise
    @review = Review.new(review_params)
    @loan = Loan.find(params[:loan_id])
    @review.loan = @loan
    @review.save
    redirect_to root_path
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
