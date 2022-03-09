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
      unless loan.status == 'returned'
        lender = loan.item.user
        lenders << lender
      end
    end
    return lenders
  end

  def borrowers
    loans = Loan.all
    @review = Review.new
    borrowers = []
    loans.each do |loan|
      unless loan.status == 'returned'
        borrower = loan.user
        borrowers << borrower
      end
    end
    return borrowers
  end

  def user_lendings(user)
    loans = Loan.all
    user_lendings = []
    loans.each do |loan|
      unless loan.status == 'returned'
        user_lendings << loan if loan.item.user == user
      end
    end
    return user_lendings
  end

  def lendings_with_current_user(user)
    lendings = user_lendings(user)
    lendings_with_current_user = []
    lendings.each do |lending|
      lendings_with_current_user << lending if lending.user == current_user
    end
    return lendings_with_current_user
  end

  def users_lent_to(user)
    loans = Loan.all
    user_lendings = []
    loans.each do |loan|
      unless loan.status == 'returned'
        user_lendings << loan.user if loan.item.user == user
      end
    end
    return user_lendings
  end

  def user_borrowings(user)
    loans = Loan.all
    user_borrowings = []
    loans.each do |loan|
      unless loan.status == 'returned'
        user_borrowings << loan if loan.user == user
      end
    end
    return user_borrowings
  end

  def borrowings_with_current_user(user)
    borrowings = user_borrowings(user)
    borrowings_with_current_user = []
    borrowings.each do |borrowing|
      borrowings_with_current_user << borrowing if borrowing.item.user == current_user
    end
    return borrowings_with_current_user
  end

  def rating(loan)
    rating = '🌟' if loan.user.reviews.length >= 2
    rating = '⭐' if loan.user.reviews.length >= 0
    rating = 'No rating yet' if loan.user.reviews.length.zero?
    return rating
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  helper_method :borrowers, :lenders, :user_lendings, :user_borrowings, :rating, :lendings_with_current_user, :borrowings_with_current_user


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :location])
  end

end
