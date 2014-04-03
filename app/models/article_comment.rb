class ArticleComment < ActiveRecord::Base
  default_scope order("created_at DESC")

  belongs_to :article
  belongs_to :user
end
