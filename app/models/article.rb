class Article < ActiveRecord::Base
  default_scope { order("created_at DESC") }

  scope :today, lambda {
    where("created_at >= ? and created_at <= ?", Date.today.beginning_of_day, Date.today.end_of_day)
  }

  has_attached_file :image, :styles => { :large => "900x900>", :small => "300x300#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :article_set

  has_one :visit, as: :visitable
  has_many :article_comments

  def similar(count=5)
    Article.where(["title LIKE ?", self.title]).where.not(title: self.title).take(count)
  end

end
