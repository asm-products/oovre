class CreateArticleSets < ActiveRecord::Migration
  def change
    create_table :article_sets do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end