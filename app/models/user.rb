class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def following?(user)
    followings.include?(user)
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def active_for_authentication?
    super && self.status == false
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.prefecture = "東京都"
      user.cities = "千代田区"
      user.password = SecureRandom.urlsafe_base64
    end
  end


  attachment :user_image, destroy: false
  validates :name, length: {maximum: 30, minimum: 2}, uniqueness: true
  validates :prefecture, presence: true
  validates :cities, presence: true
end
