class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.where(user_id: current_user[:id])
  end

  def new
    @item = Item.new
    @user = User.all
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user[:id]
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.update(item_params)
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
