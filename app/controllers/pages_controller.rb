class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    # @loans = Loan.all
    # @items = Item.all

    # @borrowed_loans = @loans.select do |loan|
    #   loan.user_id == current_user.id
    # end

    # @lent_items = @items.select do |item|
    #   item.user_id == current_user.id
    # end
    @loans = Loan.all
    @users = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def dashboard
    @loans = Loan.where(user_id: current_user)
    @users = User.all
  end
end

# <%= borrowed_count = 0 %>
#         <% @borrowed_loans.each do |loan| %>
#           <% borrowed_count += 1 if loan.item.user == user  %>
#           <% end %>

# <% lent_count = 0 %>
#         <% @lent_items.each do |item| %>
#           <% lent_count += 1 if item.loans.user == user  %>
#           <% end %>
