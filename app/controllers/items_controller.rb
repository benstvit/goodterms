class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.where(user_id: current_user[:id])
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.update(item_params)
    redirect_to item_path(@item)
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
