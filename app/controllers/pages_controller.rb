class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @loans = Loan.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user, loan: @loan })
      }
    end
  end

  def dashboard
    @loans = Loan.all
    @users = User.all
  end
end
