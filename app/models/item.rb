class Item < ApplicationRecord
  belongs_to :user
  has_many :loans
  has_many :users, through: :loans
  validates :item_name, :description, presence: true
  after_commit :add_default_photo, on: [:create, :update]
  has_one_attached :photo

  private

  def add_default_photo
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default-img.png")), filename: 'default-img.png', content_type: "image/png")
    end
  end
end
