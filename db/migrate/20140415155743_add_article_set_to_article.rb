class AddArticleSetToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :article_set_id, :integer
  end
end
