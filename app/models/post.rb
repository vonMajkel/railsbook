class Post < ApplicationRecord

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, length: { maximum: 4500 }

  def likes_count
    likes.count
  end
end
