class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :cover_image, :styles => { :large => "900x900#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

  has_one :visit, as: :visitable
  has_many :articles
  has_many :article_sets
  has_many :article_set_subscriptions
  has_many :article_comments
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id', class_name: 'Relationship'
  has_many :followers, through: :reverse_relationships


  def following?(other_user_id)
    relationships.find_by(followed_id: other_user_id)
  end

  def follow!(other_user_id)
    relationships.create!(followed_id: other_user_id)
  end

  def unfollow!(other_user_id)
    relationships.find_by(followed_id: other_user_id).destroy
  end

  def recent_articles(count=5)
    self.articles.first(count)
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
