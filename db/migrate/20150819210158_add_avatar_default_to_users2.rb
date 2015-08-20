class AddAvatarDefaultToUsers2 < ActiveRecord::Migration
  def change
    change_column_default :users, :avatar, 'default_avatar.png'
  end
end
