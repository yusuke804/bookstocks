require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it "generates associated data from a factory" do
    favorite = FactoryBot.create(:favorite)
    puts "This favorite's post is #{favorite.post.inspect}"
    puts "This favorite's user is #{favorite.user.inspect}"
  end
end