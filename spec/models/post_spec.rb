require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Postモデル単体テスト" do
    it "正常に投稿する" do
      user = FactoryBot.create(:user)
      expect(FactoryBot.create(:post, user_id: user.id)).to be_valid
    end
    
    it "画像が無いと投稿されない" do
      user = FactoryBot.create(:user)
      expect(FactoryBot.build(:post, user_id: user.id, post_image: nil)).not_to be_valid
    end
    
    it "都道府県が無いと投稿されない" do
      user = FactoryBot.create(:user)
      expect(FactoryBot.build(:post, user_id: user.id, prefecture: nil)).not_to be_valid
    end
    
    it "市区町村が無いと投稿されない" do
      user = FactoryBot.create(:user)
      expect(FactoryBot.build(:post, user_id: user.id, cities: nil)).not_to be_valid
    end
    
    it "説明が無いと投稿されない" do
      user = FactoryBot.create(:user)
      expect(FactoryBot.build(:post, user_id: user.id, body: nil)).not_to be_valid
    end
  end
end
