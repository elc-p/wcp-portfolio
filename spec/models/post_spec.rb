require 'rails_helper'

RSpec.describe Post, type: :model do
  it "投稿" do
    user = FactoryBot.create(:user)
    expect(FactoryBot.create(:post, user_id: user.id)).to be_valid
  end
  
  it "投稿失敗" do
    user = FactoryBot.create(:user)
    expect(FactoryBot.build(:post, user_id: user.id, body: nil)).not_to be_valid
  end
  
end
