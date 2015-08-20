class AddAvatarDefaultToUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :avatar, to: 'default_avatar.png'
  end
end
