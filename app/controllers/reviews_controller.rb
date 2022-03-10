class ReviewsController < ApplicationController
  def new
    # @loans = Loan.all
    # @loan = Loan.find(params[:loan_id])
    @review = Review.new
  end

  def show
  end


  def create
    @review = Review.new(review_params)
    @loan = Loan.find(params[:loan_id])
    @review.loan = @loan
    if current_user == @loan.item.user
      @review.user = @loan.user
    else
      @review.user = @loan.item.user
    end
    @review.save
    redirect_to request.referrer
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
