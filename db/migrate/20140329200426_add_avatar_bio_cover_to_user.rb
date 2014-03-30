class AddAvatarBioCoverToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.attachment :avatar
      t.attachment :cover_image
      t.string :bio
    end
  end
end
