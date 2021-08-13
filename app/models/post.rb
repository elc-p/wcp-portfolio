class Post < ApplicationRecord
  belongs_to :user

  attachment :post_image

  has_many :post_comments, dependent: :destroy
  has_many :favorites
  has_many :taggings
  has_many :tags, through: :tagging


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tag(post, sent_tags)
    sent_tags.each do |tag|
      unless Tag.find_by(category: tag)
        Tag.create(category: tag)
        Tagging.create(post_id: post.id, tag_id: tag.id)
      else
        exist_tag = Tag.find_by(category: tag)
        Tagging.create(post_id: post.id, tag_id: exist_tag.id)
      end
    end
  end

end
