require "open-uri"
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

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
    borrowers = []
    loans.each do |loan|
      borrower = loan.user
      borrowers << borrower
    end
    return borrowers
  end

  helper_method :borrowers, :lenders


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :location])
  end

end
