class Article < ActiveRecord::Base
  # default_scope { order("created_at DESC") }

  scope :recent, -> { order("created_at DESC") }
  scope :today, -> { where("articles.created_at >= ? and articles.created_at <= ?", Date.today.beginning_of_day, Date.today.end_of_day) }
  scope :with_visits, -> { joins(:visit) }
  scope :trending_with_unique, -> { with_visits.order('visits.unique_visits DESC')}
  scope :trending_with_total, -> { with_visits.order("visits.total_visits DESC") }

  enum status: [:draft, :shared_draft, :published]

  has_attached_file :image, :styles => { :large => "900x900>", :small => "300x300#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
  belongs_to :article_set

  has_one :visit, as: :visitable
  has_many :article_comments
  has_many :tags
  
  def similar(count=5)
    Article.all.take(count)
  end

  def more_from_author(count=5)
    articles = Article.where(user: self.user).recent.take(count)
    articles.delete(self)
    articles
  end

  def recommended
    Article.first()
  end

  def can_edit?(user)
    (self.user == user) ? true : false
  end

  def can_delete(user)
    (self.user == user) ? true : false
  end

  def param_title
    self.title.parameterize
  end

end
