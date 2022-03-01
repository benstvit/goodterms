require "open-uri"
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def create_new_item
    @item = Item.new(item_params)
    @item.user_id = current_user[:id]
    file = URI.open(:img_url)
    @item.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
    @item.save
    return @item
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :img_url)
  end
end
