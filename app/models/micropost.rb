class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :content, presence: true, length: { maximum: 255 }
  
  def like(micropost)
    self.likes.find_or_create_by(micropost_id: micropost.id)
  end

  def unlike(micropost)
    like = self.likes.find_by(micropost_id: micropost.id)
    like.destroy if like
  end
  
  def like_micropost?(micropost)
    self.like_microposts.include?(micropost)
  end
end
