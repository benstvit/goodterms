require "open-uri"
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  def lenders
    loans = Loan.all
    # @borrowers = borrowers
    lenders = []
    loans.each do |loan|
      lender = loan.item.user
      lenders << lender
    end
    return lenders
  end

  def borrowers
    loans = Loan.all
    @review = Review.new
    borrowers = []
    loans.each do |loan|
      borrower = loan.user
      borrowers << borrower
    end
    return borrowers
  end

  def user_lendings(user)
    loans = Loan.all
    user_lendings = []
    loans.each do |loan|
      user_lendings << loan if loan.item.user == user
    end
    return user_lendings
  end

  def user_lending(user)
    loans = Loan.all
    user_lendings = []
    loans.each do |loan|
      user_lendings << loan.user if loan.item.user == user
    end
    return user_lendings
  end

  def user_borrowings(user)
    return Loan.where(user: user)
  end

  def rating(loan)
    rating = '🌟' if loan.user.reviews.length >= 2
    rating = '⭐' if loan.user.reviews.length >= 0
    rating = 'No rating yet 😒' if loan.user.reviews.length.zero?
    return rating
  end

  helper_method :borrowers, :lenders, :user_lendings, :user_borrowings, :rating


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :location])
  end

end
