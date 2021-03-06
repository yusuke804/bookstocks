class Post < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy
  
  has_many :searches, dependent: :destroy
  has_many :tags, through: :searches
  
  validates :author_name, presence: true, length: { maximum:30 }
  validates :novel_title, presence: true, length: { maximum:50 }
  validates :introduce_content, presence: true, length: { maximum:100 }
  validates :tweet_content, presence: true,  length: { maximum:1000 }
  validate :introduce_longer_than_tweet
  
  mount_uploader :image, ImageUploader
  
  private

  def introduce_longer_than_tweet
    if self.introduce_content.length > self.tweet_content.length
      errors.add(:tweet_content, "「ひとこと」が「紹介する一節」より短いため、投稿できません")
    end
  end
end