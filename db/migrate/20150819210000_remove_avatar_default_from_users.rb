class RemoveAvatarDefaultFromUsers < ActiveRecord::Migration
  def change
    change_column_default :users, :avatar, to: nil
  end
end
