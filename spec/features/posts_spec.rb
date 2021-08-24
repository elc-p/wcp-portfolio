require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "新規投稿できる" do
    user = FactoryBot.create(:user)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Log in"
    
    attach_file 'post[post_image]', "#{Rails.root}/spec/fixtures/sky.jpg"
    fill_in 'post[body]', with: "testtesttest"
    click_button "投稿"
    expect(page).to have_current_path user_path(user)
  end
end
