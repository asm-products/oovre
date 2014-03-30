class ArticleSetSubscription < ActiveRecord::Base
  belongs_to :article_set
  belongs_to :user
  
end