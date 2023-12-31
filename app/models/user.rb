class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lists, dependent: :destroy
  has_many :list_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :orders
  
  validates :name, presence: true
  
  has_one_attached :profile_image
  
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_person.jpg")
      profile_image.attach(io: File.open(file_path), filename: "sample-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end
end
