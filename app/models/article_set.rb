class ArticleSet < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  has_many :article_set_subscriptions

  def subscribe(user=current_user)
    if !self.is_subscribed?(user)
      subscription = self.article_set_subscriptions.new(user: user)
      subscription.save()
    end
  end

  def is_subscribed?(user=current_user)
    subscription = self.article_set_subscriptions.where(user: user).count()
    subscription > 0 ? true : false
  end

end