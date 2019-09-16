class Tag < ApplicationRecord
  has_many :searches
  has_many :posts, through: :searches
end
