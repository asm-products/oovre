class AddProfileViewsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :page_views, :integer
  end
end
