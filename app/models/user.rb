class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :image, ImageUploader
  has_many :posts
  has_many :favorites
  has_many :favposts, through: :favorites, source: :post
  
  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end

  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favpost?(post)
    self.favposts.include?(post)
  end


end
