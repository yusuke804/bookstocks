require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  
  scenario "ユーザーが新しい投稿を送信し、それが正常に反映されたかを検証する" do
    user = FactoryBot.create(:user)
    
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    
    expect {
      click_link "投稿する"
      fill_in "著者名", with: "author_name"
      fill_in "小説名", with: "novel_title"
      fill_in "紹介する一節", with: "test"
      fill_in "ひとこと", with: "tests"
      click_button "投稿"
      
      
      save_and_open_page
      expect(page).to have_content "投稿を正常に送信しました"
      expect(page).to have_content "test"
      expect(page).to have_content "novel_title"
      expect(page).to have_content "author_name"
      expect(page).to have_content "#{user.name}"
    }.to change(user.posts, :count).by(1)
  end
end
