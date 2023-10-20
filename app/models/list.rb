class List < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  has_many :list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  
  validates :title, presence: true
  validates :body, presence: true
  
  def fav_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_fhoto.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [500, 500]).processed
  end
end
