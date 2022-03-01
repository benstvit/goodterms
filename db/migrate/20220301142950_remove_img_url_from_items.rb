class RemoveImgUrlFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column(:items, :img_url)
  end
end
