class Article < ActiveRecord::Base
  default_scope order("created_at DESC")

  belongs_to :user
  belongs_to :article_set
  has_many :article_comments

end