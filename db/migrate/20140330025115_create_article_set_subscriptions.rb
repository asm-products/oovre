class CreateArticleSetSubscriptions < ActiveRecord::Migration
  def change
    create_table :article_set_subscriptions do |t|
      t.integer :user_id
      t.integer :article_set_id
      
      t.timestamps
    end
  end
end
