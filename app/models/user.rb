class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :loans
  has_many :reviews, dependent: :destroy
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true
  has_one_attached :photo
  after_commit :add_default_photo, on: [:create, :update]
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def index
    @users = User.all
  end

  def full_name
    "#{first_name} #{last_name} (#{average_rating})"
  end

  private

  def add_default_photo
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.png")), filename: 'default.png', content_type: "image/png")
    end
  end

  def average_rating
    ratings = []
    reviews = Review.all
    reviews.each do |review|
      ratings << review.rating if review.user == self
    end
    ratings.count.zero? ? average_rating = 0 : average_rating = ratings.sum.fdiv(ratings.count)
    return "⭐️" * average_rating.round
  end
end
