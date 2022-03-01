class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @loans = Loan.where(user_id: current_user)
    @users = User.all
  end
end
