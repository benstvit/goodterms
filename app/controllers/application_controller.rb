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

  def my_borrowers(user)
    my_borrowers = []
    my_lendings = user_lendings(user)
    my_lendings.each do |lending|
      my_borrowers << lending.user
    end
    return my_borrowers
  end

  def my_lenders(user)
    my_lenders = []
    my_borrowings = user_borrowings(user)
    my_borrowings.each do |borrowing|
      my_lenders << borrowing.item.user
    end
    return my_lenders
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

  def average_rating(user)
    ratings = []
    reviews = Review.all
    reviews.each do |review|
      ratings << review.rating if review.user == user
    end
    ratings.count.zero? ? average_rating = 0 : average_rating = ratings.sum.fdiv(ratings.count)
    return average_rating
  end

  def notifications(message)
    @counter = 0
    @user = User.find(params[:id])
    @user_chatrooms = @chatrooms.where(loan.user == @user || loan.item.user == @user)
    @user_chatrooms.each do |chatroom|
      @counter += 1 if message.chatroom_id == chatroom
    end
    return @counter
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  helper_method :borrowers, :notifications, :lenders, :user_lendings, :user_borrowings, :lendings_with_current_user, :borrowings_with_current_user, :average_rating, :my_borrowers, :my_lenders


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :location])
  end

end
