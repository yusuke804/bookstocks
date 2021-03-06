require 'rails_helper'

RSpec.describe User, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  
  # 名前、メール、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
      
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "14au064f@rikkyo.ac.jp")
    user = FactoryBot.build(:user, email: "14au064f@rikkyo.ac.jp")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
  # パスワードが６文字未満であれば無効な状態であること
  it "is invalid password.length < 6 " do
    user = User.new(password: "hoge")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end
end