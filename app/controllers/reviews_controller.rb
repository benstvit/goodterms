class ReviewsController < ApplicationController
  def new
    @loans = Loan.all
    @loan = Loan.find(params[:loan_id])
    @review = Review.new
  end

  def show
  end


  def create
    @review = Review.new(review_params)
    if params[:time] == 'Yes' && params[:condition] == 'Yes'
      @review.rating =+ 10
    elsif params[:time] == 'Yes' || params[:condition] == 'Yes'
      @review.rating =+ 5
    end
    @loan = Loan.find(params[:loan_id])
    @review.loan = @loan
    @review.user = @loan.user
    @review.save
    redirect_to root_path
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
