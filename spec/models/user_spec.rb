require 'rails_helper'

describe User do

  it "正常にユーザー登録出来る" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "名前を空欄にすると無効" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("is too short (minimum is 2 characters)")
  end

  it "都道府県を空欄にすると無効" do
    user = FactoryBot.build(:user, prefecture: nil)
    user.valid?
    expect(user.errors[:prefecture]).to include("can't be blank")
  end
  
  it "市区町村を空欄にすると無効" do
    user = FactoryBot.build(:user, cities: nil)
    user.valid?
    expect(user.errors[:cities]).to include("can't be blank")
  end
  
  it "メールアドレスを空欄にすると無効" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  
  it "パスワードを空欄にすると無効" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

end