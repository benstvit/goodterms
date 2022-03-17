class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    request.variant = determine_variant
    @loans = Loan.all
    @user =  users_lent_to(current_user)
    @users = User.where(id: @user.map(&:id))
    @review = Review.new
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

  private

  def determine_variant
    variant = nil
    # some code to determine the variant(s) to use
    variant = :mobile if session[:use_mobile]

    variant
  end
  # def user_rating
  #   if loan.user.reviews.length >= 2
  #     '🌟'
  #   elsif loan.user.reviews.length == 1
  #     '⭐'
  #   else
  #     '😒'
  #   end
  # end
end
