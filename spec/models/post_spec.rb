require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it "is invalid without author_name" do  
    post = FactoryBot.build(:post, author_name: nil)
    post.invalid?
    expect(post.errors[:author_name]).to include("can't be blank")
  end
  
  it "is invalid introduce_content.length > tweet_content.length" do
    post = FactoryBot.build(:post, introduce_content: "aa", tweet_content: "a")
    post.invalid?
    expect(post.errors[:tweet_content]).to include("「ひとこと」が「紹介する一節」より短いため、投稿できません")
  end
end