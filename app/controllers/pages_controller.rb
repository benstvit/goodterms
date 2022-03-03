class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @loans = Loan.all
  end

  def dashboard
    @loans = Loan.all
    @users = User.all
  end
end
